import 'package:flutter/material.dart';
import 'package:odyssey/levels.dart';

class ChapterScreen extends StatelessWidget {
  final int chapterNumber;
  final String theme;
  final String description;

  const ChapterScreen({
    super.key,
    required this.chapterNumber,
    required this.theme,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter $chapterNumber: $theme'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Chapter Title
            Text(
              "Chapter $chapterNumber: $theme",
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(221, 17, 17, 17),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Chapter Illustration (Placeholder)
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.orangeAccent.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.eco_rounded,
                size: 80,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),

            // Chapter Description
            Text(
              description,
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
        builder: (context) => const LevelsScreen(), // Now uses saved progress
      ),
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
    );
  }
}