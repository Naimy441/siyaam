import 'package:flutter/material.dart';
import 'package:odyssey/end_screen.dart';
import 'package:odyssey/levels.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odyssey/gemini_service.dart';
import 'dart:async';
import 'dart:convert';
import 'package:scratcher/scratcher.dart';

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
  bool _isScratched = false; // Track scratch completion
  Map<String, String> _twistsMap = {}; // Store AI-generated twists

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

    String today = DateTime.now().toIso8601String().substring(0, 10);
    await prefs.setString('lastQuestDate', today);

    int unlockedLevel =
        prefs.getInt('unlockedLevel_${widget.chapterNumber}') ?? 1;
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter ${widget.chapterNumber} - Quest ${widget.level}"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isLoading)
                const CircularProgressIndicator()
              else ...[
                // Scratcher Challenge Card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.orangeAccent.shade100,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          "🎯 Scratch to Reveal Challenge",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Scratcher(
                          brushSize: 50,
                          threshold: 50,
                          color: Colors.orangeAccent.shade100,
                          onChange: (value) {
                            if (value > 50) {
                              setState(() {
                                _isScratched = true;
                              });
                            }
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

                const SizedBox(height: 30),

                if (widget.twists && _selectedTwist == null) ...[
                  const Text(
                    "🎭 Choose a Twist!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: _twistsMap.keys.map((twist) {
                      return ElevatedButton(
                        onPressed: () => _selectTwist(twist),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          twist,
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ],

                if (_selectedTwist != null || !widget.twists)
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: _completeQuest,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text("✅ Complete Quest", style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}