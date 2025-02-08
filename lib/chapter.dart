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
      appBar: AppBar(
        title: Text('Chapter $chapterNumber: ${chapterInfo["theme"]}'),
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
              "Chapter $chapterNumber: ${chapterInfo["theme"]}",
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
                    builder: (context) => LevelsScreen(chapterNumber: chapterNumber,), // Uses saved progress
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