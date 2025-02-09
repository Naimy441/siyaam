import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'level.dart';
import 'package:odyssey/constants.dart'; // Import structured chapter data

class LevelsScreen extends StatefulWidget {
  final int chapterNumber;

  const LevelsScreen({super.key, required this.chapterNumber});

  @override
  LevelsScreenState createState() => LevelsScreenState();
}

class LevelsScreenState extends State<LevelsScreen> {
  int _unlockedLevel = 1;
  bool _questCompletedToday = false;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _unlockedLevel = prefs.getInt('unlockedLevel_${widget.chapterNumber}') ?? 1;
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

    String challenge = getChallenge(widget.chapterNumber, level);
    bool isTwist = widget.chapterNumber != 1; // Enable twists after Chapter 1
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LevelScreen(
          level: level,
          challenge: challenge,
          twists: isTwist,
          chapterNumber: widget.chapterNumber,
        ),
      ),
    ).then((_) => _loadProgress()); // Refresh levels on return
  }

  Future<bool> _showOverrideDialog() async {
  return await showDialog(
        context: context,
        builder: (context) => Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent, // Glass effect
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Soft blur effect
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3), // Glass effect
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade100.withOpacity(0.4),
                      blurRadius: 15,
                      spreadRadius: 1,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Already Completed a Quest Today",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Are you sure you want to do another quest today?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    
                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildDialogButton(
                          text: "Cancel",
                          color: Colors.grey.shade300,
                          textColor: Colors.black87,
                          onTap: () => Navigator.pop(context, false),
                        ),
                        _buildDialogButton(
                          text: "Yes, Continue",
                          color: Colors.blue.shade600,
                          textColor: Colors.white,
                          onTap: () => Navigator.pop(context, true),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ) ??
      false;
}

// Custom Modern Dialog Button
Widget _buildDialogButton({
  required String text,
  required Color color,
  required Color textColor,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back button
      child: Scaffold(
        extendBodyBehindAppBar: true, // Make background extend to the top
        appBar: AppBar(
          title: Text(
            "Chapter ${widget.chapterNumber} - Select a Quest",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black87, // Light mode-friendly text
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false, // Hide back button
        ),
        body: Stack(
          children: [
            // Background Gradient (Soft Light Blue)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade100, // Soft sky blue
                    Colors.blue.shade50, // Lightest blue near white
                  ],
                ),
              ),
            ),

            // Blurred Glass Panel
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    width: 320,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade100.withOpacity(0.3),
                          blurRadius: 12,
                          spreadRadius: 1,
                          offset: const Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Complete quests to unlock new adventures!",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),

                        // Apple-style modern Quest buttons
                        Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          children: List.generate(5, (index) {
                            int level = index + 1;
                            bool isUnlocked = level <= _unlockedLevel;

                            return GestureDetector(
                              onTap: isUnlocked ? () => _handleQuestSelection(level) : null,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: isUnlocked
                                      ? Colors.white.withOpacity(0.8) // Glass effect
                                      : Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isUnlocked ? Colors.blue.shade200 : Colors.blue.shade50,
                                    width: 1.2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.shade300.withOpacity(0.2),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                      offset: const Offset(3, 3),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: isUnlocked
                                      ? Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.play_circle_fill,
                                                color: Colors.blue.shade600, size: 30),
                                            const SizedBox(height: 5),
                                            Text(
                                              "Quest $level",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue.shade900,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Icon(Icons.lock,
                                          color: Colors.blueGrey.shade300, size: 28),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}