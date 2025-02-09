import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class GeminiService {
  final String apiKey = dotenv.env['GEMINI_KEY'] ?? '';
  final String endpoint = "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent";

  Future<String> getGeminiResponse(String prompt) async {
    try {
      print("Sending request to Gemini API with prompt: ${prompt}");
      final response = await http.post(
        Uri.parse("${endpoint}?key=${apiKey}"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ]
        }),
      );

      print("Received response: ${response.statusCode} - ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.containsKey('candidates') &&
            data['candidates'].isNotEmpty &&
            data['candidates'][0].containsKey('content')) {
          print("Extracted content: ${data['candidates'][0]['content']}");
          return data['candidates'][0]['content']['parts'][0]['text'];
        }
        print("No valid response received from Gemini.");
        return "No valid response received from Gemini.";
      } else {
        return "Error: ${response.statusCode} - ${response.body}";
      }
    } catch (e) {
      print("Error occurred: ${e}");
      return "Error: ${e}";
    }
  }
}

class TextProcessor {
  GeminiService gemini = GeminiService();

  static List<String> twists = [
    "Funny", "Community", "Creativity", "Devious", "Genius", "Roleplay", "Speedrun",
    "Randomized", "Gamified", "Shakespeare", "Duke University", "Sabotage", "Artificial",
    "Intelligence", "Courage", "Masterful"
  ];

  static String processText(String prompt) {
    print("Processing text: ${prompt}");
    String processed = prompt.trim();
    if (processed.isNotEmpty) {
      processed = processed[0].toUpperCase() + processed.substring(1);
    }
    print("Processed input: ${processed}");
    return "Processed Input: ${processed}";
  }

  static int getRandomNumber(int min, int max) {
    final random = Random();
    int randomNumber = min + random.nextInt(max - min + 1);
    print("Generated random number: ${randomNumber}");
    return randomNumber;
  }

  static String getRandomTwist() {
    int randomIndex = getRandomNumber(0, twists.length - 1);
    print("Selected twist: ${twists[randomIndex]}");
    return twists[randomIndex];
  }

  static String promptify(String twist, String prompt) {
    String formattedPrompt = "Rewrite \"${prompt}\" with a creative twist related to the phrase \"${twist}\", ensuring a meaningful transformation, not just rewording. Maintain logic while adding a fresh, unexpected angle in one line.";
    print("Formatted prompt: ${formattedPrompt}");
    return formattedPrompt;
  }

  static Future<Map<String, String>> twistIt(String prompt) async {
    print("Twisting the prompt: ${prompt}");
    Set<String> seen = <String>{};
    List<String> selectedTwists = [];

    for (int i = 0; i < 3; i++) {
      String twist = getRandomTwist();
      while (seen.contains(twist)) {
        twist = getRandomTwist();
      }
      seen.add(twist);
      selectedTwists.add(twist);
    }

    print("Selected twists: ${selectedTwists}");

    Map<String, String> retMap = {
      selectedTwists[0]: "",
      selectedTwists[1]: "",
      selectedTwists[2]: ""
    };

    GeminiService gemini = GeminiService();

    for (int i = 0; i < 3; i++) {
      String formattedPrompt = promptify(selectedTwists[i], prompt);
      print("Sending formatted prompt to Gemini API: ${formattedPrompt}");
      String response = await gemini.getGeminiResponse(formattedPrompt);
      print("Received response for twist [${selectedTwists[i]}]: ${response}");
      retMap[selectedTwists[i]] = response;
    }

    return retMap;
  }
}