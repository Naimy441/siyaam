import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'level.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  _LevelsScreenState createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  int _unlockedLevel = 1;
  bool _questCompletedToday = false;

  final Map<int, String> levelChallenges = {
    1: "Replace a plastic bottle with a reusable flask.",
    2: "Go zero-waste for a day.",
    3: "Try using only natural light for an entire day.",
    4: "Pick up the most unusual litter you find.",
    5: "Cook a meal with zero food waste!"
  };

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _unlockedLevel = prefs.getInt('unlockedLevel') ?? 1;
      _questCompletedToday = _checkIfCompletedToday(prefs);
    });
  }

  bool _checkIfCompletedToday(SharedPreferences prefs) {
    String? lastCompletedDate = prefs.getString('lastQuestDate');
    String today = DateTime.now().toIso8601String().substring(0, 10);
    return lastCompletedDate == today;
  }

  Future<void> _handleQuestSelection(int level) async {
    if (_questCompletedToday) {
      bool confirmOverride = await _showOverrideDialog();
      if (!confirmOverride) return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LevelScreen(
          level: level,
          challenge: levelChallenges[level]!,
          twists: true,
        ),
      ),
    ).then((_) => _loadProgress()); // Refresh levels on return
  }

  Future<bool> _showOverrideDialog() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Already Completed a Quest Today"),
            content: const Text("Are you sure you want to do another quest today?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text("Yes, Continue"),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back button
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select a Level"),
          backgroundColor: Colors.orangeAccent,
          automaticallyImplyLeading: false, // Hide back button
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Complete each level to unlock the next!",
                style: TextStyle(fontSize: 18, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: List.generate(5, (index) {
                  int level = index + 1;
                  bool isUnlocked = level <= _unlockedLevel;

                  return GestureDetector(
                    onTap: isUnlocked ? () => _handleQuestSelection(level) : null,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: isUnlocked ? Colors.orangeAccent : Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: isUnlocked
                            ? Text(
                                "Level $level",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(Icons.lock, color: Colors.white70, size: 30),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}