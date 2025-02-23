import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:siyaam/end_screen.dart';
import 'package:siyaam/gemini_service.dart';
import 'package:siyaam/levels.dart';
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
  String? selectedTwist;
  String finalChallenge = "";
  bool questCompletedToday = false;
  bool isLoading = true;
  bool isScratched = false;
  double scratchProgress = 0; // Tracks how much is scratched
  Map<String, String> twistsMap = {};

  @override
  void initState() {
    super.initState();
    _loadTwistAndProgress();
  }

  Future<void> _loadTwistAndProgress() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      selectedTwist = prefs.getString(
          'selectedTwist_Chapter${widget.chapterNumber}_Level${widget.level}');
      finalChallenge = prefs.getString(
              'finalChallenge_Chapter${widget.chapterNumber}_Level${widget.level}') ??
          widget.challenge;
      questCompletedToday = _checkIfCompletedToday(prefs);
    });

    String? savedTwists = prefs.getString(
        'twistsMap_Chapter${widget.chapterNumber}_Level${widget.level}');

    if (savedTwists != null) {
      twistsMap = Map<String, String>.from(jsonDecode(savedTwists));
      setState(() {
        isLoading = false;
      });
    } else if (widget.twists) {
      await _fetchTwists();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchTwists() async {
    twistsMap = await TextProcessor.twistIt(widget.challenge);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'twistsMap_Chapter${widget.chapterNumber}_Level${widget.level}',
        jsonEncode(twistsMap));

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _selectTwist(String twist) async {
    final prefs = await SharedPreferences.getInstance();
    String selectedChallenge = twistsMap[twist] ?? widget.challenge;

    setState(() {
      selectedTwist = twist;
      finalChallenge = selectedChallenge;
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
    await prefs.setString(
        'lastQuestDate', DateTime.now().toIso8601String().substring(0, 10));

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
        questCompletedToday = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("🎉 Quest completed! Next level unlocked.")),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text(
            "Chapter ${widget.chapterNumber} - Quest ${widget.level}",
            style: const TextStyle(
                color: Color.fromARGB(221, 255, 255, 255),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.275),
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/level_background.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : selectedTwist == null && widget.twists
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20), // Rounded corners for glass effect
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 5, sigmaY: 5), // Apple-style blur effect
                          child: Container(
                            height: 300,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                  0.2), // Semi-transparent white for frosted glass
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.white.withOpacity(
                                      0.3)), // Subtle glassy border
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                      0.1), // Soft shadow for depth
                                  blurRadius: 10,
                                  spreadRadius: 3,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "🎭 Choose a Twist!",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                Wrap(
                                  spacing: 10,
                                  children: twistsMap.keys.map((twist) {
                                    return ElevatedButton(
                                      onPressed: () => _selectTwist(twist),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue.shade200,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Text(
                                        twist,
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // "Scratch Below" Label (Disappears after 50% Scratch)

                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: isScratched ? 0.0 : 1.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(
                                    0.5), // Slightly dark background
                                borderRadius: BorderRadius.circular(
                                    10), // Rounded edges for a softer look
                              ),
                              child: const Text(
                                "🔽 Scratch Below 🔽",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Colors.white, // White text for contrast
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Scratch Card with Challenge Text
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Scratcher(
                                brushSize: 50,
                                threshold: 50,
                                color: const Color.fromARGB(255, 247, 201, 84),
                                onChange: (value) {
                                  setState(() {
                                    scratchProgress = value;
                                    if (scratchProgress >= 50) {
                                      isScratched = true;
                                    }
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  width: 350, // Bigger initial size
                                  height: 250, // Bigger initial size
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.2)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      finalChallenge,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          // Complete Quest Button (Initially Hidden, Appears after 50% Scratch)
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: isScratched
                                ? 1.0
                                : 0.0, // Only appears after scratching
                            child: ElevatedButton(
                              onPressed: isScratched ? _completeQuest : null,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 15),
                                backgroundColor: Colors.blue.shade600,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 10,
                              ),
                              child: const Text(
                                "✅ Complete Quest",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
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
