import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  int storedChapter = await getStoredChapter();
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  await dotenv.load(fileName: ".env"); 

  runApp(OdysseyApp(initialChapter: storedChapter));
}

Future<int> getStoredChapter() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('chapterNumber') ?? 0; // Default to 0 if not set
}

class OdysseyApp extends StatelessWidget {
  final int initialChapter;

  const OdysseyApp({super.key, required this.initialChapter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Odyssey',
      theme: ThemeData.light(),
      home: getInitialScreen(initialChapter),
    );
  }

  Widget getInitialScreen(int chapter) {
    if (chapter == 0) {
      return const HomeScreen();
    } else {
      return ChapterScreen(
        chapterNumber: chapter,
      );
    }
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurple, Colors.orangeAccent],
              ),
            ),
          ),

          // Centered Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Title
                const Text(
                  "ODYSSEY",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    color: Colors.white,
                    shadows: [
                      Shadow(blurRadius: 10, color: Colors.black),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Subtitle
                const Text(
                  "Your Journey to Sustainability",
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
                const SizedBox(height: 50),

                // Start Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IntroductionScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  IntroductionScreenState createState() => IntroductionScreenState();
}

class IntroductionScreenState extends State<IntroductionScreen> {
  int _currentStep = 0;

  final List<String> _introTexts = [
    "Odyssey is a 30-Day App Challenge to foster sustainable and eco-friendly living.",
    "Each day is called a Quest, guiding you through impactful actions.",
    "Odyssey is divided into 6 Chapters, each focusing on different sustainability themes.",
    "You'll start small, but each day’s quest builds upon the last.",
    "After Chapter 1, you'll unlock a special AI-powered twist!",
    "Get ready for a gamified, interactive journey towards sustainability!"
  ];

  void _nextStep() async {
    if (_currentStep < _introTexts.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      // Save progress (Set chapter 1 as completed)
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('chapterNumber', 1);

      // Navigate to Chapter 1
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ChapterScreen(chapterNumber: 1,)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _nextStep,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueGrey, Colors.greenAccent],
            ),
          ),
          child: Center(
            child: Text(
              _introTexts[_currentStep],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
