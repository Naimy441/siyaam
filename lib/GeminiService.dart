import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

class GeminiService {
  final String apiKey = "AIzaSyAxJYdJgNkNU06XStCoj5M54pBtLNFlzWM";
  final String endpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateText";

  Future<String> getGeminiResponse(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse("$endpoint?key=$apiKey"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "prompt": {"text": prompt},
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['candidates'][0]['output'] ?? "No response";
      } else {
        return "Error: ${response.statusCode} - ${response.body}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}


class TextProcessor {

  GeminiService gemini = new GeminiService();

  static List<String> twists = ["Funny","Community","Creativity","Devious","Genius","Roleplay","Speedrun","Randomized","Gamified","Shakespeare","Duke University","Sabotage","Artificial","Intelligence","Courage","Masterful"];

  /// A method that takes a string and processes it
  static String processText(String prompt) {
    // Example: Trim whitespace and ensure first letter is uppercase
    String processed = prompt.trim();
    if (processed.isNotEmpty) {
      processed = processed[0].toUpperCase() + processed.substring(1);
    }
    return "Processed Input: $processed";
  }

  // gets random integer
  static int getRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  // gets a random twist from the reviously declared list of twists
  static String getRandomTwist() {
    int randomIndex = getRandomNumber(0,twists.length-1);
    return twists[randomIndex];
  }

  static String promptify(String twist, String prompt) {
    return "Output in just one line the following challenge that is changed to the style of [$twist]: $prompt";
  }

  // method that changes a prompt based on one of three "twists". Returns altered prompt along with the twist in list format.
  static Future<Map<String,String>> twistIt(String prompt) async {
    Set<String> seen = new Set<String>();
    List<String> twists = [];

    for (int i = 0; i < 3; i++) {
      String twist = getRandomTwist();
      while (seen.contains(twist)) {
        twist = getRandomTwist();
      }
      seen.add(twist);
      twists.add(twist);
    }

    Map<String,String> retMap = {
      twists[0] : "",
      twists[1] : "",
      twists[2] : ""
    };

    // Create an instance of GeminiService
    GeminiService gemini = GeminiService();

    for (int i = 0; i < 3; i++) {
      String response = await gemini.getGeminiResponse(twists[i]);
      retMap[twists[i]] = response;
    }    

    // Return the list containing both twist and response
    return retMap;
  }
}