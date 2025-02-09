import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:odyssey/levels.dart';
import 'package:odyssey/constants.dart'; // Import structured data

class ChapterScreen extends StatelessWidget {
  final int chapterNumber;

  const ChapterScreen({
    super.key,
    required this.chapterNumber,
  });

  @override
  Widget build(BuildContext context) {
    // Retrieve the chapter details from the structured data
    Map<String, String> chapterInfo = getChapterInfo(chapterNumber);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Chapter $chapterNumber: ${chapterInfo["theme"]}',
          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background Gradient (Soft Blue)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.shade100,
                  Colors.blue.shade50,
                ],
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Chapter Title
                  Text(
                    "Chapter $chapterNumber: ${chapterInfo["theme"]}",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Chapter Illustration (Glassmorphic Effect)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white.withOpacity(0.3)),
                        ),
                        child: const Icon(
                          Icons.eco_rounded,
                          size: 80,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Chapter Description
                  Text(
                    chapterInfo["description"]!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  // Continue Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LevelsScreen(chapterNumber: chapterNumber),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: Colors.blue.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                    ),
                    child: const Text(
                      "Start Chapter",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}