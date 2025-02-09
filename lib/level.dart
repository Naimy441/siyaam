import 'package:flutter/material.dart';
import 'package:odyssey/end_screen.dart';
import 'package:odyssey/levels.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odyssey/gemini_service.dart';
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
  Map<String, String> _twistsMap = {}; // Store AI-generated twists

  @override
  void initState() {
    super.initState();
    _loadTwistAndProgress();
  }

  // Load saved twist, challenge, and daily completion status
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

    // Load stored twists from SharedPreferences
    String? savedTwists = prefs.getString(
        'twistsMap_Chapter${widget.chapterNumber}_Level${widget.level}');

    if (savedTwists != null) {
      _twistsMap = Map<String, String>.from(jsonDecode(savedTwists));
      print("✅ Loaded twists from storage: $_twistsMap");
      setState(() {
        _isLoading = false;
      });
    } else if (widget.twists) {
      await _fetchTwists(); // No stored twists, fetch new ones
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Fetch twisted challenges from AI and store them
  Future<void> _fetchTwists() async {
    _twistsMap = await TextProcessor.twistIt(widget.challenge);
    print("🎭 Generated new twists: $_twistsMap");

    // Save twists in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'twistsMap_Chapter${widget.chapterNumber}_Level${widget.level}',
        jsonEncode(_twistsMap));

    setState(() {
      _isLoading = false;
    });
  }

  // Save selected twist and final challenge
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

  // Check if the quest has already been completed today
  bool _checkIfCompletedToday(SharedPreferences prefs) {
    String? lastCompletedDate = prefs.getString('lastQuestDate');
    String today = DateTime.now().toIso8601String().substring(0, 10);
    return lastCompletedDate == today;
  }

  // Save quest completion and update progress
  Future<void> _completeQuest() async {
    int chapterNum = widget.chapterNumber;
    final prefs = await SharedPreferences.getInstance();

    // Save today's date as last completed quest date
    String today = DateTime.now().toIso8601String().substring(0, 10);
    await prefs.setString('lastQuestDate', today);

    // Unlock next level in the same chapter
    int unlockedLevel =
        prefs.getInt('unlockedLevel_${widget.chapterNumber}') ?? 1;
    if (widget.level == unlockedLevel) {
      await prefs.setInt(
          'unlockedLevel_${widget.chapterNumber}', widget.level + 1);
    }
    if (widget.level == 5) {
      chapterNum += 1;
      await prefs.setInt('chapterNumber', widget.chapterNumber + 1);
      await prefs.setInt(
          'unlockedLevel_$chapterNum', 1);
          // print(chapterNum);
          // print(await prefs.getInt('unlockedLevel_$chapterNum'));
    }
    if (chapterNum == 7 && widget.level == 5) {
      Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              EndScreen(),
        ),
      );
    });
    
    } else {

    // print(widget.chapterNumber);
    // print(widget.level);

    setState(() {
      _questCompletedToday = true;
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("🎉 Quest completed! Next level unlocked.")),
    );

    // Delay then return to LevelsScreen
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              LevelsScreen(chapterNumber: chapterNum),
        ),
      );
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter ${widget.chapterNumber} - Level ${widget.level}"),
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
                // Challenge Card
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
                          "🎯 Challenge for Level ${widget.level}",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          _finalChallenge, // ✅ Ensures it displays the correct challenge
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // If twists are enabled, let user pick one
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
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ],

                // Show "Complete Quest" button
                if (_selectedTwist != null || !widget.twists)
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: _completeQuest, // ✅ Button now works properly
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "✅ Complete Quest",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
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