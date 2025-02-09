
class Chapter {
  final String theme;
  final String description;
  final Map<int, List<String>> challenges; // Day -> List of 5 quests

  Chapter({required this.theme, required this.description, required this.challenges});
}

// Define the structured data
final Map<int, Chapter> chapters = {
  1: Chapter(
    theme: "Education",
    description: "Learn and Spread Awareness",
    challenges: {
      1: [
        "Share a sustainability fact or meme – Post a fun or thought-provoking sustainability fact or meme on social media or share it with a friend.",
        "Curate a nature-inspired playlist – Create a playlist with songs that remind you of nature, sustainability, or environmental activism.",
        "Explore your local recycling system – Research how recycling works in your city. What items are accepted? Where does your recycling go? Bonus: Visit a local recycling plant.",
        "Investigate and share your carbon footprint – Use an online carbon footprint calculator to estimate your impact on the planet. Share one surprising fact you learned.",
        "Write a letter to Congress about climate action – Draft a persuasive letter to your representative about an environmental issue you care about. Even better, send it!"
      ],
    },
  ),
  2: Chapter(
    theme: "Reduce Waste",
    description: "Minimize Trash and Maximize Reuse",
    challenges: {
      6: [
        "Give an old item new life – Turn an old sock into a sock puppet, repurpose a glass jar, or find another creative way to upcycle an item you would normally throw away.",
        "Shop secondhand – Visit a thrift store or a secondhand shop instead of buying something new.",
        "Declutter sustainably – Gather clothes, books, or items you no longer use and donate them to a local charity.",
        "Cook with zero waste in mind – Plan a meal where you use every part of your ingredients (e.g., vegetable scraps for broth, banana peels for compost).",
        "Start a compost bin – Begin composting food scraps to reduce landfill waste and nourish the soil. If composting at home isn't possible, research local compost drop-off sites."
      ],
    },
  ),
  3: Chapter(
    theme: "Conserve Energy & Water",
    description: "Use Resources Wisely",
    challenges: {
      11: [
        "Let the sun do the work – Use only natural light during daylight hours.",
        "Eliminate phantom energy waste – Unplug electronics and appliances when they’re not in use to prevent energy drain.",
        "Switch to cold water – Wash your clothes in cold water instead of hot to save energy.",
        "Take a timed shower – Play your favorite song and finish your shower before it ends.",
        "Go a full day without charging devices – Start your day at 100% battery and see if you can last without plugging in."
      ],
    },
  ),
  4: Chapter(
    theme: "Conscious Consumption",
    description: "Make Thoughtful Choices",
    challenges: {
      16: [
        "Swap a disposable item for a reusable one – Replace a single-use plastic item (water bottle, coffee cup, grocery bag, etc.) with a reusable alternative.",
        "Ditch plastic bags – Carry a reusable bag for shopping or errands instead of using plastic bags.",
        "Support local farmers – Shop at a farmer’s market instead of a supermarket and learn about where your food comes from.",
        "Try a plant-based day – Go vegetarian for a day and explore new plant-based meals.",
        "Attempt a zero-waste day – Try to go the whole day without creating trash. If you do, acknowledge it with an 'oops!' and reflect on ways to reduce waste in the future."
      ],
    },
  ),
  5: Chapter(
    theme: "Sustainable Transportation",
    description: "Move Greener",
    challenges: {
      21: [
        "Take a walking challenge – Walk to your destination for the day instead of driving or taking a bus.",
        "Replace a short car trip with walking – Choose one trip you’d normally drive and walk instead.",
        "Carpool to reduce emissions – Share a ride with a friend or coworker to cut down on carbon emissions.",
        "Use public transportation for a day – Opt for a bus, train, or subway instead of using a personal vehicle.",
        "Go car-free for the day – Challenge yourself to avoid all car travel for a full day by biking, walking, or using public transit."
      ],
    },
  ),
  6: Chapter(
    theme: "Advocacy and Volunteering",
    description: "Take Action for the Planet",
    challenges: {
      26: [
        "Sign a climate action petition – Add your name to a petition supporting environmental policy changes.",
        "Write an eco-friendly encouragement note – Send a message to a friend encouraging them to adopt a sustainable habit.",
        "Participate in a local cleanup – Join or organize a community cleanup effort to remove litter from a park, beach, or neighborhood.",
        "Remove invasive plants – Research and remove invasive species from your yard or a local green space.",
        "Plant a tree – Either plant one yourself or contribute to a tree-planting organization to help combat deforestation."
      ],
    },
  ),
};

String getChallenge(int chapter, int level) {
  if (chapters.containsKey(chapter)) {
    Chapter currentChapter = chapters[chapter]!;

    // Find the nearest level that exists
    int? foundLevel = currentChapter.challenges.keys.firstWhere(
      (lvl) => lvl <= level,
      orElse: () => -1, // If not found, return an invalid value
    );

    if (foundLevel == -1) {
      return "Challenge not found.";
    }

    List<String>? levelChallenges = currentChapter.challenges[foundLevel];

    // Validate that the challenge exists
    if (levelChallenges != null && levelChallenges.isNotEmpty) {
      int index = (level - foundLevel);
      if (index >= 0 && index < levelChallenges.length) {
        return levelChallenges[index];
      }
    }
  }

  return "Challenge not found.";
}

// Function to retrieve chapter info
Map<String, String> getChapterInfo(int chapterNumber) {
  if (chapters.containsKey(chapterNumber)) {
    return {
      "theme": chapters[chapterNumber]!.theme,
      "description": chapters[chapterNumber]!.description
    };
  }
  return {"theme": "Not Found", "description": "No chapter available."};
}