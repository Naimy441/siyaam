import 'dart:async';
import 'package:flutter/material.dart';
import 'package:siyaam/levels.dart';
import 'package:siyaam/constants.dart';
import 'package:audioplayers/audioplayers.dart';

class ChapterScreen extends StatefulWidget {
  final int chapterNumber;

  const ChapterScreen({super.key, required this.chapterNumber});

  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> with SingleTickerProviderStateMixin {
  late Map<String, dynamic> chapterInfo;
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  bool _showSkipButton = true;
  Timer? _fadeTimer;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    chapterInfo = getChapterInfo(widget.chapterNumber);
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 13),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0.9), // Start off-screen (bottom)
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

    _animationController.forward();
    _playVoiceOver();
    _startFadeTimer();
  }

  void _playVoiceOver() async {
    // _audioPlayer.play(AssetSource("voiceover${widget.chapterNumber}"));
  }

  void _startFadeTimer() {
    _fadeTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _showSkipButton = false);
      }
    });
  }

  void _resetFadeTimer() {
    setState(() => _showSkipButton = true);
    _fadeTimer?.cancel();
    _startFadeTimer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _fadeTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _resetFadeTimer,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 134, 211, 250), Color.fromARGB(255, 203, 121, 248)],
              ),
            ),
          ),
                    Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

            Positioned.fill(
              child: SlideTransition(
                position: _animation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Chapter ${widget.chapterNumber}: ${chapterInfo["theme"]}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(221, 255, 255, 255),
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (chapterInfo["story"] as List<String>).map((line) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            line,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 20,
              child: AnimatedOpacity(
                opacity: _showSkipButton ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LevelsScreen(chapterNumber: widget.chapterNumber),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey,
                      ),
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