import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  _LevelsScreenState createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  int _unlockedLevel = 1; // Default: Only Level 1 is unlocked

  @override
  void initState() {
    super.initState();
    _loadLevelProgress();
  }

  // Load the last saved level from storage
  Future<void> _loadLevelProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _unlockedLevel = prefs.getInt('unlockedLevel') ?? 1;
    });
  }

  // Function to unlock the next level (to be called when a level is completed)
  Future<void> _unlockNextLevel(int level) async {
    if (level == _unlockedLevel) {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _unlockedLevel = level + 1;
      });
      await prefs.setInt('unlockedLevel', _unlockedLevel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a Level"),
        backgroundColor: Colors.orangeAccent,
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

            // Levels Grid
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: List.generate(5, (index) {
                int level = index + 1;
                bool isUnlocked = level <= _unlockedLevel;

                return GestureDetector(
                  onTap: isUnlocked
                      ? () {
                          _unlockNextLevel(level); // Unlock next level
                          // Navigate to quest.dart (To be implemented later)
                        }
                      : null,
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
    );
  }
}