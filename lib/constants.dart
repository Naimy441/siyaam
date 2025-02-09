
class Chapter {
  final String theme;
  final String description;
  final List<String> story;
  final Map<int, List<String>> challenges; // Day -> List of 5 quests

  Chapter({required this.theme, required this.description, required this.story, required this.challenges});
}

// Define the structured data
final Map<int, Chapter> chapters = {
  1: Chapter(
    theme: "Education",
    description: "Learn and Spread Awareness",
    story: [
      "The first spark was small—a shared fact, a passing conversation, a meme that made someone pause. But knowledge rippled outward, stretching beyond a single voice, beyond a single moment.",
      "Like seeds carried by the wind, ideas took root in unexpected places—classrooms, coffee shops, quiet reflections. Awareness deepened, choices sharpened, and a shift began.",
      "There were no grand gestures, just the quiet hum of understanding passing from one person to another. And before our eyes, a movement took shape. The world began to listen."
    ],
    challenges: {
      1: [
        "Share a sustainability fact or meme – Post a fun or thought-provoking sustainability fact or meme on social media or share it with a friend.",
        "Curate a nature-inspired playlist – Create a playlist with songs that remind you of nature, sustainability, or environmental activism.",
        "Explore your local recycling system – Research how recycling works in your city. What items are accepted? Where does your recycling go? Bonus: Visit a local recycling plant.",
        "Investigate and share your carbon footprint – Use an online carbon footprint calculator to estimate your impact on the planet. Share one surprising fact you learned.",
        "Remove invasive plants – Research and remove invasive species from your yard or a local green space."
      ],
    },
  ),
  2: Chapter(
    theme: "Reduce Waste",
    description: "Minimize Trash and Maximize Reuse",
    story: [
      "It’s not always about tasks, but about a shift in perspective.",
      "Waste was no longer waste—it was a resource. Light was no longer automatic—it was intentional. Every step became a conscious act of care.",
      "One day, you paused before tossing something away. You questioned before buying. You noticed the world around you—truly noticed. And in that moment, you realized: Sustainability isn't a checklist. It's a way of seeing."
    ],
    challenges: {
      1: [
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
    story: [
      "At first, the changes were small—a plastic bottle repurposed, a footprint lightened. The steady hum of wasted energy faded, replaced by mindful choices.",
      "Like a river shaping the land, each decision made a difference. Shorter showers saved unseen gallons, unplugged devices silenced the silent drain, and sunlight replaced artificial glow.",
      "Little by little, the world responded. Waste turned to intention, excess to balance. And in that quiet shift, the earth exhaled—lighter, freer, and more alive."
    ],
    challenges: {
      1: [
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
    story: [
      "The earth noticed the shift—a plastic bag refused, a reusable bottle filled, a habit formed. Waste less, choose wisely—each act a quiet vow to the planet.",
      "Like a river shaping the land, small choices shaped tomorrow. Sunlight replaced artificial glow, nourishing both space and spirit. A plant-based meal, a repurposed item—proof that new wasn’t always better.",
      "Mindfulness took root, one decision at a time. And in that shift, abundance was redefined—not in excess, but in sustainability, in care, in lasting impact."
    ],
    challenges: {
      1: [
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
    story: [
      "From the first step, the earth took notice. Engines idled less. Footsteps replaced exhaust. A journey once measured in miles became an opportunity to move with purpose.",
      "Like a river carving a path, each decision—no matter how small—shaped the landscape of tomorrow. A walk that once seemed too far became a moment to breathe. A bus ride carried not just people, but the promise of fewer emissions. A shared trip meant less congestion, less pollution, more connection.",
      "In these choices, movement became more than just getting from one place to another—it became a statement, a shift toward a cleaner, quieter world. And before our eyes, the roads cleared, the air lightened, and the journey itself became part of the solution."
    ],
    challenges: {
      1: [
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
    story: [
      "It started with a single act—a petition signed, a cleanup joined, a voice raised. One action became many, momentum building with every hand willing to help.",
      "A park restored, a law challenged, a conversation that sparked change. Letters reached leaders, demanding a future where nature thrived. Small efforts wove together, forming something greater than any one person.",
      "And before our eyes, the world listened—because we refused to stay silent."
    ],
    challenges: {
      1: [
        "Sign a climate action petition – Add your name to a petition supporting environmental policy changes.",
        "Write an eco-friendly encouragement note – Send a message to a friend encouraging them to adopt a sustainable habit.",
        "Participate in a local cleanup – Join or organize a community cleanup effort to remove litter from a park, beach, or neighborhood.",
        "Plant a tree – Either plant one yourself or contribute to a tree-planting organization to help combat deforestation.",
        "Write a letter to Congress about climate action – Draft a persuasive letter to your representative about an environmental issue you care about. Even better, send it!"
      ],
    },
  ),
};

String getChallenge(int chapter, int level) {
  if (level < 1 || level > 5) {
    return "Invalid level. Please select a level between 1 and 5.";
  }
  
  if (chapters.containsKey(chapter)) {
    Chapter currentChapter = chapters[chapter]!;
    
    List<String>? levelChallenges = currentChapter.challenges[1];
    
    if (levelChallenges != null && levelChallenges.length >= level) {
      return levelChallenges[level - 1];
    }
  }

  return "Challenge not found.";
}

// Function to retrieve chapter info
Map<String, dynamic> getChapterInfo(int chapterNumber) {
  if (chapters.containsKey(chapterNumber)) {
    return {
      "theme": chapters[chapterNumber]!.theme,
      "description": chapters[chapterNumber]!.description,
      "story": chapters[chapterNumber]!.story
    };
  }
  return {"theme": "Not Found", "description": "No chapter available."};
}
