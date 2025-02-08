import 'package:flutter/material.dart';
import 'package:odyssey/levels.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

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

  // Placeholder twist options (Replace with Gemini AI later)
  final Map<String, String> twistOptions = {
    "Funny": "Tell a joke about your challenge before starting!",
    "Roleplay": "Pretend you are an ancient eco-warrior completing this quest.",
    "Speedrun": "Complete the challenge in 5 minutes or less!"
  };

  @override
  void initState() {
    super.initState();
    _loadTwistAndProgress();
  }

  // Load saved twist and daily completion status
  Future<void> _loadTwistAndProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedTwist = prefs.getString('selectedTwist_Chapter${widget.chapterNumber}_Level${widget.level}');
      if (_selectedTwist != null) {
        _finalChallenge = "${twistOptions[_selectedTwist!]} ${widget.challenge}";
      }
      _questCompletedToday = _checkIfCompletedToday(prefs);
    });
  }

  // Save selected twist
  Future<void> _selectTwist(String twist) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedTwist = twist;
      _finalChallenge = "${twistOptions[twist]} ${widget.challenge}";
    });
    await prefs.setString('selectedTwist_Chapter${widget.chapterNumber}_Level${widget.level}', twist);
  }

  // Check if the quest has already been completed today
  bool _checkIfCompletedToday(SharedPreferences prefs) {
    String? lastCompletedDate = prefs.getString('lastQuestDate');
    String today = DateTime.now().toIso8601String().substring(0, 10);
    return lastCompletedDate == today;
  }

  // Save quest completion and update progress
  Future<void> _completeQuest() async {
    final prefs = await SharedPreferences.getInstance();

    // Save today's date as last completed quest date
    String today = DateTime.now().toIso8601String().substring(0, 10);
    await prefs.setString('lastQuestDate', today);

    // Unlock next level in the same chapter
    int unlockedLevel = prefs.getInt('unlockedLevel_${widget.chapterNumber}') ?? 1;
    if (widget.level == unlockedLevel) {
      await prefs.setInt('unlockedLevel_${widget.chapterNumber}', widget.level + 1);
    }

    setState(() {
      _questCompletedToday = true;
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Quest completed! Next level unlocked.")),
    );

    // Delay then return to LevelsScreen (Ensuring the correct chapter)
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LevelsScreen(chapterNumber: widget.chapterNumber),
        ),
      );
    });
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
                        "Challenge for Level ${widget.level}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        _selectedTwist == null ? widget.challenge : _finalChallenge,
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
                  "Choose a Twist!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: twistOptions.keys.map((twist) {
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

              // Show "Complete Quest" button if a twist is chosen or not required
              if (_selectedTwist != null || !widget.twists)
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: _completeQuest,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Complete Quest",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}