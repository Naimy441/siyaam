import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:odyssey/end_screen.dart';
import 'package:odyssey/gemini_service.dart';
import 'package:odyssey/levels.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scratcher/scratcher.dart';
import 'dart:async';
import 'dart:convert';

class LevelScreen extends StatefulWidget {
  final int chapterNumber;
  final int level;
  final String challenge;
  final bool twists;

  const LevelScreen({
    super.key,
    required this.chapterNumber,
    required this.level,
    required this.challenge,
    this.twists = false,
  });

  @override
  LevelScreenState createState() => LevelScreenState();
}

class LevelScreenState extends State<LevelScreen> {
  String? _selectedTwist;
  String _finalChallenge = "";
  bool _questCompletedToday = false;
  bool _isLoading = true;
  bool _isScratched = false;
  double _scratchProgress = 0; // Tracks how much is scratched
  Map<String, String> _twistsMap = {};

  @override
  void initState() {
    super.initState();
    _loadTwistAndProgress();
  }

  Future<void> _loadTwistAndProgress() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _selectedTwist = prefs.getString(
          'selectedTwist_Chapter${widget.chapterNumber}_Level${widget.level}');
      _finalChallenge = prefs.getString(
              'finalChallenge_Chapter${widget.chapterNumber}_Level${widget.level}') ??
          widget.challenge;
      _questCompletedToday = _checkIfCompletedToday(prefs);
    });

    String? savedTwists = prefs.getString(
        'twistsMap_Chapter${widget.chapterNumber}_Level${widget.level}');

    if (savedTwists != null) {
      _twistsMap = Map<String, String>.from(jsonDecode(savedTwists));
      setState(() {
        _isLoading = false;
      });
    } else if (widget.twists) {
      await _fetchTwists();
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchTwists() async {
    _twistsMap = await TextProcessor.twistIt(widget.challenge);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'twistsMap_Chapter${widget.chapterNumber}_Level${widget.level}',
        jsonEncode(_twistsMap));

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _selectTwist(String twist) async {
    final prefs = await SharedPreferences.getInstance();
    String selectedChallenge = _twistsMap[twist] ?? widget.challenge;

    setState(() {
      _selectedTwist = twist;
      _finalChallenge = selectedChallenge;
    });

    await prefs.setString(
        'selectedTwist_Chapter${widget.chapterNumber}_Level${widget.level}',
        twist);
    await prefs.setString(
        'finalChallenge_Chapter${widget.chapterNumber}_Level${widget.level}',
        selectedChallenge);
  }

  bool _checkIfCompletedToday(SharedPreferences prefs) {
    String? lastCompletedDate = prefs.getString('lastQuestDate');
    String today = DateTime.now().toIso8601String().substring(0, 10);
    return lastCompletedDate == today;
  }

  Future<void> _completeQuest() async {
    int chapterNum = widget.chapterNumber;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastQuestDate', DateTime.now().toIso8601String().substring(0, 10));

    int unlockedLevel = prefs.getInt('unlockedLevel_${widget.chapterNumber}') ?? 1;
    if (widget.level == unlockedLevel) {
      await prefs.setInt(
          'unlockedLevel_${widget.chapterNumber}', widget.level + 1);
    }
    if (widget.level == 5) {
      chapterNum += 1;
      await prefs.setInt('chapterNumber', widget.chapterNumber + 1);
      await prefs.setInt('unlockedLevel_$chapterNum', 1);
    }
    if (chapterNum == 7 && widget.level == 5) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EndScreen(),
          ),
        );
      });
    } else {
      setState(() {
        _questCompletedToday = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("🎉 Quest completed! Next level unlocked.")),
      );

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LevelsScreen(chapterNumber: chapterNum),
        ),
      );
    });
  }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Chapter ${widget.chapterNumber} - Quest ${widget.level}",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.shade100,
                  Colors.blue.shade50,
                ],
              ),
            ),
          ),

          Center(
            child: _isLoading
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Scratch Card with Glassmorphism
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            width: 320,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white.withOpacity(0.2)),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "🎯 Scratch to Reveal Challenge",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 15),
                                Scratcher(
                                  brushSize: 50,
                                  threshold: 50,
                                  color: Colors.blue.shade200,
                                  onChange: (value) {
                                    setState(() {
                                      _scratchProgress = value;
                                      if (_scratchProgress >= 50) {
                                        _isScratched = true;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 300,
                                    height: 200,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: _isScratched
                                        ? Text(
                                            _finalChallenge,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black54,
                                            ),
                                            textAlign: TextAlign.center,
                                          )
                                        : const Text(
                                            "🎭 Scratch Here",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Complete Quest Button (Initially Grey, Fades to Blue)
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: _isScratched ? 1.0 : 0.5,
                        child: ElevatedButton(
                          onPressed: _isScratched ? _completeQuest : null,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            backgroundColor: _isScratched ? Colors.blue.shade600 : Colors.grey.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: _isScratched ? 10 : 0,
                          ),
                          child: const Text(
                            "✅ Complete Quest",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}