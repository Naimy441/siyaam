import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:siyaam/main.dart'; // Import Main Screen

class EndScreen extends StatefulWidget {
  const EndScreen({super.key});

  @override
  EndScreenState createState() => EndScreenState();
}

class EndScreenState extends State<EndScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play(); // Start confetti
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade700,
      body: Stack(
        children: [
          // Confetti Effect
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: [Colors.orange, Colors.green, Colors.blue, Colors.purple],
              gravity: 0.2,
              numberOfParticles: 30,
            ),
          ),

          // Centered Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Trophy Icon 🏆
                const Icon(
                  Icons.emoji_events_rounded,
                  size: 100,
                  color: Colors.amberAccent,
                ),

                const SizedBox(height: 20),

                // Congratulations Message 🎉
                const Text(
                  "Congratulations! 🎉",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(blurRadius: 5, color: Colors.black),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 15),

                // Reflection Message 🌿
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "You've completed the Siyaam Challenge! 🌍 "
                    "Take a moment to reflect on your journey and "
                    "continue making sustainable choices every day. 💚",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 40),

                // Restart Button 🔄
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Restart Journey 🔄",
                    style: TextStyle(fontSize: 20, color: Colors.white),
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