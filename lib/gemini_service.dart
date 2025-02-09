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
    "Funny", "Community", "Creative", "Devious", "Genius", "Roleplay", "Speedrun",
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
    String formattedPrompt = "";
    switch(twist) {
      case "Shakespere": formattedPrompt = "Modify \"${prompt}\" by adding an old English or Shakespearean theme that affects the way the challenge must be completed."; break;
      case "Community": formattedPrompt = "Modify \"${prompt}\" by adding a cooperative element that requires players to work together in an interesting way while maintaining the challenge’s original intent."; break;
      case "Creative": formattedPrompt = "Modify \"${prompt}\" by adding a creative requirement that forces players to use their imagination or customization options in a fun way."; break;
      case "Devious": formattedPrompt = "Modify \"${prompt}\" by adding a deceptive element, hidden rule, or misleading clue that makes players second-guess their approach while keeping the challenge fair."; break;
      case "Genius": formattedPrompt =  "Modify \"${prompt}\" by adding a layer of complexity or a multi-step puzzle that requires strategic thinking to solve."; break;
      case "Roleplay": formattedPrompt = "Modify \"${prompt}\" by adding a character-driven rule or immersive element that forces players to act within a role while completing the challenge."; break;
      case "Speedrun": formattedPrompt = "Modify \"${prompt}\" by introducing a randomized element that slightly alters how the challenge plays out each time without making it unfair or frustrating."; break;
      case "Randomized": formattedPrompt = "Rewrite \"${prompt}\" with a randomized twist that introduces unpredictable elements while maintaining the essence."; break;
      case "Gamified": formattedPrompt = "Modify \"${prompt}\" by gamifying it, whether that be adding collectables, obstacles, or other game elements to the challenge."; break;
      case "Duke University": formattedPrompt = "Modify \"${prompt}\" by incorporating an academic, sports, or campus-related element from Duke University that adds a fun layer to the challenge."; break;
      case "Sabotage": formattedPrompt = "Modify \"${prompt}\" by adding a fair sabotage mechanic that allows competitors or AI to interfere with progress in an interesting way."; break;
      case "Artificial": formattedPrompt = "Rewrite \"${prompt}\" with an AI-driven twist that incorporates machine learning, adaptive opponents, or smart mechanics while maintaining the essence."; break;
      case "Courage": formattedPrompt = "Modify \"${prompt}\" by adding an element that forces players to take a risk, make a bold choice, or push past fear in a controlled way."; break;
      case "Masterful": formattedPrompt = "Rewrite \"${prompt}\" with a masterful twist that demands skill, precision, and elite performance while maintaining the essence."; break;
      default: formattedPrompt = "Rewrite \"${prompt}\" with a creative twist related to the phrase \"${twist}\", ensuring a meaningful transformation, not just rewording. Introduce a slight, engaging change that enhances the challenge without making it unfair or inappropriate."; break;
    }
    formattedPrompt += "Ensure the twist meaningfully alters the challenge while keeping it fair, safe, and fun. The twist should be engaging, family-friendly, and easy to complete in one day. Avoid excessive difficulty or anything that could be seen as unfair or inappropriate. The generated challenge must fit on one line.";
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