import 'dart:async';
import 'package:flutter/material.dart';
import 'package:odyssey/levels.dart';
import 'package:odyssey/constants.dart';
import 'package:audioplayers/audioplayers.dart';

class ChapterScreen extends StatefulWidget {
  final int chapterNumber;

  const ChapterScreen({super.key, required this.chapterNumber});

  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> with SingleTickerProviderStateMixin {
  late Map<String, String> chapterInfo;
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  bool _showSkipButton = true;
  Timer? _fadeTimer;
  final AudioPlayer _audioPlayer = AudioPlayer();

@override
void initState() {
  super.initState();
  chapterInfo = getChapterInfo(widget.chapterNumber);
  _scrollController = ScrollController();
  
  // Initialize the animation controller
  _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 13),
  );

  // Initialize the animation after the controller
  _animation = Tween<Offset>(
    begin: const Offset(0, 0.9), // Start off-screen (bottom)
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _animationController, curve: Curves.linear));

  // Start animation
  _animationController.forward();

  // Play the voiceover
  _playVoiceOver();

  // Start fading timer for the skip button
  _startFadeTimer();
}

  void _playVoiceOver() async {
    // await _audioPlayer.play(AssetSource('audio/chapter_${widget.chapterNumber}.mp3'));
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
    _scrollController.dispose();
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
            // Background Gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.lightBlue.shade50,
                    Colors.lightBlue.shade200,
                  ],
                ),
              ),
            ),
            
            // Scrolling Text Animation
            Positioned.fill(
              child: SlideTransition(
                position: _animation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Chapter ${widget.chapterNumber}: ${chapterInfo["theme"]}",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "This is the first point of the chapter.",
                          "It provides an introduction to the theme.",
                          "Key concepts will be explored in detail.",
                          "Each concept builds upon the previous one.",
                          "A summary will reinforce learning outcomes."
                        ].map((line) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            line,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
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
            
            // Skip Button
            Positioned(
              top: 40,
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
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueGrey, width: 1.5),
                    ),
                    child: const Text(
                      '>>>',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
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