import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siyaam/reminder.dart';
import 'chapter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;
  AudioManager._internal();

  final AudioPlayer audioPlayer = AudioPlayer();
  bool isMuted = false;

  Future<void> init() async {
    await audioPlayer.stop();
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    await audioPlayer.play(AssetSource('nasheed1.mp3'));
  }

  Future<void> playAudio() async {
    isMuted = false;
    await audioPlayer.play(AssetSource('nasheed1.mp3'));
  }

  Future<void> stopAudio() async {
    isMuted = true;
    await audioPlayer.stop();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase Initialization Error: $e");
  }
  int storedChapter = await getStoredChapter();

  // Uncomment to clear user local storage
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  final AudioManager audioManager = AudioManager();
  await audioManager.init();

  runApp(SiyaamApp(initialChapter: storedChapter));
}

Future<int> getStoredChapter() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('chapterNumber') ?? 0; // Default to 0 if not set
}

class SiyaamApp extends StatefulWidget {
  final int initialChapter;

  const SiyaamApp({super.key, required this.initialChapter});

  @override
  SiyaamAppState createState() => SiyaamAppState();
}

class SiyaamAppState extends State<SiyaamApp> {
  late FirebaseRemoteConfig _remoteConfig;
  bool _bypassCountdown = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeRemoteConfig();
  }

  Future<void> _initializeRemoteConfig() async {
    _remoteConfig = FirebaseRemoteConfig.instance;

// Set default values to avoid issues if Firebase fails
    await _remoteConfig.setDefaults({
      "bypassCountdown": false, // Default value
    });

    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    await _fetchConfig();
  }

  Future<void> _fetchConfig() async {
    try {
      await _remoteConfig.fetchAndActivate();
      setState(() {
        _bypassCountdown = _remoteConfig.getBool('bypassCountdown');
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching Remote Config: $e"); // Debugging
      setState(() {
        _isLoading = false; // Prevent infinite loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime countDownDate = DateTime(2025, 3, 1);

    return MediaQuery(
      data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.0)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Siyaam',
        theme: ThemeData.light(),
        home: _isLoading
            ? const Scaffold(
                body: Center(
                    child:
                        CircularProgressIndicator())) // ✅ Ensure Scaffold is inside MaterialApp
            : (_bypassCountdown || DateTime.now().isAfter(countDownDate))
                ? getInitialScreen(widget.initialChapter)
                : CountdownScreen(targetDate: countDownDate),
      ),
    );
  }

  Widget getInitialScreen(int chapter) {
    if (chapter == 0) {
      return const HomeScreen();
    } else {
      return ChapterScreen(chapterNumber: chapter);
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
              "assets/siyaam_home.png",
              fit: BoxFit.cover, // Ensures the GIF covers the entire background
            ),
          ),

          // Centered Content
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.19, // Adjust height dynamically
                ),
                Text(
                  "SIYAAM",
                  style: GoogleFonts.aBeeZee(
                    // Use camelCase for Google Fonts
                    fontSize: MediaQuery.of(context).size.height * 0.065,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),

                // Subtitle
                Text(
                  "Your Journey in Islam",
                  style: GoogleFonts.aBeeZee(
                    // Use camelCase for Google Fonts
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.46, // Adjust height dynamically
                ),

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
                    backgroundColor: Color.fromARGB(255, 247, 201, 84),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
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
    "🌱 Welcome to Siyaam!\nA 30-day challenge to embrace Islamic values and God-conscious living.",
    "📖 Siyaam unfolds across six immersive chapters, each diving into a different spiritual theme.",
    "🛤 Each day is a Quest, leading you through small but powerful actions to make an impact.",
    "🔄 Every step matters – your efforts build upon the previous, creating lasting habits.",
    "🤖 Special AI-powered twists await you after completing Chapter 1!",
    "⏰ Set your intentions, and let the journey unfold.",
    "🚀 Get ready for an interactive, gamified journey towards a better future!"
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
          builder: (context) => ReminderScreen(),
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
                colors: [
                  Color.fromARGB(255, 134, 211, 250),
                  Color.fromARGB(255, 203, 121, 248)
                ],
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

class CountdownScreen extends StatefulWidget {
  final DateTime targetDate;

  const CountdownScreen({super.key, required this.targetDate});

  @override
  CountdownScreenState createState() => CountdownScreenState();
}

class CountdownScreenState extends State<CountdownScreen> {
  late Duration _remainingTime;
  late Timer _timer;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.targetDate.difference(DateTime.now());
    _startCountdown();

    // Confetti Controller for normal confetti rain from the top
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 30));
    _confettiController.play();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime = widget.targetDate.difference(DateTime.now());
        if (_remainingTime.isNegative) {
          _timer.cancel();
          _confettiController.stop();
          _navigateToMain();
        }
      });
    });
  }

  void _navigateToMain() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = _formatDuration(_remainingTime);

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/level_selector_background.png",
              fit: BoxFit.cover,
            ),
          ),

          // Confetti Rain from Top
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: 3.14 / 2, // Directly downward
              emissionFrequency: 0.1, // Higher for smoother rain effect
              numberOfParticles: 10, // Consistent flow
              gravity: 0.3, // Natural falling motion
              maxBlastForce: 5, // Gentle, steady rain effect
              minBlastForce: 2, // Prevents bursts
              shouldLoop: true, // Ensures continuous confetti
              particleDrag: 0.05, // Slight slow-down for realism
            ),
          ),

          // Centered Countdown Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title Text
                const Text(
                  "Countdown to Launch 🚀",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(2, 2)),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Countdown Timer Container (Static size)
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: Text(
                    formattedTime,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Fixed white color
                      shadows: [
                        Shadow(
                            blurRadius: 15,
                            color: Colors.black,
                            offset: Offset(2, 2)),
                      ],
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

  String _formatDuration(Duration duration) {
    int days = duration.inDays;
    int hours = duration.inHours.remainder(24);
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    return "$days days\n${_twoDigits(hours)}:${_twoDigits(minutes)}:${_twoDigits(seconds)}";
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}
