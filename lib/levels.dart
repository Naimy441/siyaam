import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'level.dart';
import 'package:siyaam/constants.dart';
import 'package:confetti/confetti.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'main.dart';

class LevelsScreen extends StatefulWidget {
  final int chapterNumber;

  const LevelsScreen({super.key, required this.chapterNumber});

  @override
  LevelsScreenState createState() => LevelsScreenState();
}

class LevelsScreenState extends State<LevelsScreen> {
  int _unlockedLevel = 1;
  bool _questCompletedToday = false;
  late ConfettiController _confettiController;
  final AudioManager audioManager = AudioManager();
  bool _isMuted = false;

  int _carouselIndex = 0;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _loadProgress();

    Future.delayed(const Duration(milliseconds: 500), () {
      _confettiController.play();
    });

    _isMuted = audioManager.isMuted;
  }

  // Toggle audio playback when the mute button is pressed
  void _toggleAudio() async {
    if (_isMuted) {
      // Unmute: start playing audio again
      setState(() {
        _isMuted = false;
      });
      await audioManager.playAudio();
    } else {
      // Mute: stop the audio playback
      setState(() {
        _isMuted = true;
      });
      await audioManager.stopAudio();
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _unlockedLevel =
          prefs.getInt('unlockedLevel_${widget.chapterNumber}') ?? 1;
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
                filter: ImageFilter.blur(
                    sigmaX: 10, sigmaY: 10), // Soft blur effect
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
            "Chapter ${widget.chapterNumber}",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: const Color.fromARGB(
                  221, 255, 255, 255), // Light mode-friendly text
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false, // Hide back button
        ),
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                "assets/level_selector_background.png",
                fit: BoxFit.cover,
              ),
            ),

            // Confetti rain from top if chapterNumber >= 1
            if (widget.chapterNumber >= 1)
              Positioned.fill(
                child: IgnorePointer(
                  child: Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: _confettiController,
                      blastDirection: -pi / 2, // Downward rain effect
                      emissionFrequency: 0.2, // More particles per second
                      numberOfParticles: 15,
                      gravity: 0.01, // Slow falling effect
                      shouldLoop: false,
                    ),
                  ),
                ),
              ),

            // Blurred Glass Panel
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: 320,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
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
                        Text(
                          "${getChapterInfo(widget.chapterNumber)['theme']}",
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w600,
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
                              onTap: isUnlocked
                                  ? () => _handleQuestSelection(level)
                                  : null,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: isUnlocked
                                      ? Colors.white.withOpacity(0.8)
                                      : Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isUnlocked
                                        ? Colors.blue.shade200
                                        : Colors.blue.shade50,
                                    width: 1.2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: (level >= _unlockedLevel)
                                          ? Colors.blue.shade300
                                              .withOpacity(0.5)
                                          : const Color.fromARGB(
                                                  255, 8, 178, 25)
                                              .withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                      offset: const Offset(3, 3),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: isUnlocked
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (level == _unlockedLevel)
                                              Icon(Icons.play_circle_fill,
                                                  color: Colors.blue.shade600,
                                                  size: 30),
                                            if (level < _unlockedLevel)
                                              Icon(Icons.play_circle_fill,
                                                  color: const Color.fromARGB(
                                                      255, 8, 178, 25),
                                                  size: 30),
                                            const SizedBox(height: 5),
                                            if (level == _unlockedLevel)
                                              Text(
                                                "Quest $level",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue.shade900,
                                                ),
                                              ),
                                            if (level < _unlockedLevel)
                                              Text(
                                                "Quest $level",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color.fromARGB(
                                                      255, 8, 178, 25),
                                                ),
                                              ),
                                          ],
                                        )
                                      : Icon(Icons.lock,
                                          color: Colors.blueGrey.shade300,
                                          size: 28),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 40),
                        CarouselSlider(
                          items: [
                            _buildCarouselItem(
                                context,
                                "Verse of the Day\n\n${quranAndDuaList[_unlockedLevel - 1]["quran"]!}",
                                35),
                            _buildCarouselItem(
                                context,
                                "Verse Translation\n\n${quranAndDuaList[_unlockedLevel - 1]["interpretation"]!}",
                                25),
                            _buildCarouselItem(
                                context,
                                "Dua of the Day\n\n${quranAndDuaList[_unlockedLevel - 1]["dua"]!}",
                                35),
                            _buildCarouselItem(
                                context,
                                "Dua Transliteration\n\n${quranAndDuaList[_unlockedLevel - 1]["transliteration"]!}",
                                25),
                            _buildCarouselItem(
                                context,
                                "Dua Translation\n\n${quranAndDuaList[_unlockedLevel - 1]["translation"]!}",
                                25),
                          ],
                          options: CarouselOptions(
                            height: 200,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            pauseAutoPlayOnTouch: true,
                            pauseAutoPlayOnManualNavigate: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Floating mute/unmute button at the top right
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom,
              right: 10,
              child: FloatingActionButton(
                backgroundColor: Colors.black.withOpacity(0.3),
                onPressed: _toggleAudio,
                elevation: 0,
                child: Icon(
                  _isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCarouselItem(BuildContext context, String text, double fontSize) {
  return GestureDetector(
    onTap: () => _showFullScreenText(context, text, fontSize),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 300, // Adjust the height limit as needed
        ),
        child: SingleChildScrollView(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}

void _showFullScreenText(BuildContext context, String text, double fontSize) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.blue.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                ),
                child: const Text(
                  "Close",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
