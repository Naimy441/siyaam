import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chapter.dart';
import 'package:audioplayers/audioplayers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  int storedChapter = await getStoredChapter();

  // Uncomment to clear user local storage
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  await dotenv.load(fileName: ".env"); 

  // Loops background music
  final AudioPlayer audioPlayer = AudioPlayer();
  audioPlayer.setReleaseMode(ReleaseMode.loop); 
  audioPlayer.play(AssetSource('floating_cat.mp3'));

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
          Positioned.fill(
            child: Image.asset(
              "assets/Title Page v2.gif",
              fit: BoxFit.cover, // Ensures the GIF covers the entire background
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
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(179, 6, 6, 6)),
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
  final PageController _pageController = PageController();
  int _currentStep = 0;

  final List<String> _introTexts = [
    "🌱 Welcome to Odyssey!\nA 30-day challenge to embrace sustainability and eco-conscious living.",
    "📖 Odyssey unfolds across six immersive chapters, each diving into a different sustainability theme.",
    "🛤 Each day is a Quest, leading you through small but powerful actions to make an impact.",
    "🔄 Every step matters – your efforts build upon the previous, creating lasting habits.",
    "🤖 A special AI-powered twist awaits you after Chapter 1!",
    "🚀 Get ready for an interactive, gamified journey towards a greener future!"
  ];

  void _nextStep() async {
    if (_currentStep < _introTexts.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('chapterNumber', 1);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ChapterScreen(chapterNumber: 1),
        ),
      );
    }
  }

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
                colors: [Color.fromARGB(255, 134, 211, 250), Color.fromARGB(255, 203, 121, 248)],
              ),
            ),
          ),

          // Semi-transparent overlay for better text readability
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          // Introduction Content with Smooth Transitions
          PageView.builder(
            controller: _pageController,
            itemCount: _introTexts.length,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentStep = index;
              });
            },
            itemBuilder: (context, index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated Intro Text
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          _introTexts[index],
                          key: ValueKey(_introTexts[index]),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Progress Indicator (Dots)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _introTexts.length,
                          (dotIndex) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: _currentStep == dotIndex ? 12 : 8,
                            height: _currentStep == dotIndex ? 12 : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentStep == dotIndex
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),

                      // Next Button
                      ElevatedButton(
                        onPressed: _nextStep,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          backgroundColor: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          _currentStep == _introTexts.length - 1
                              ? "Start Journey 🚀"
                              : "Next",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}