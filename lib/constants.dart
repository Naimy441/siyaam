
class Chapter {
  final String theme;
  final String description;
  final List<String> story;
  final Map<int, List<String>> challenges;

  Chapter({required this.theme, required this.description, required this.story, required this.challenges});
}

// Define the structured data
final Map<int, Chapter> chapters = {
  1: Chapter(
    theme: "Knowledge & Reflection",
    description: "Strengthening Faith Through Learning",
    story: [
      "Sustainability isn’t just about saving the environment, it’s about ensuring that future generations have access to clean air, water, and resources.",
      "Did you know that if everyone lived like the average American, we would need five Earths to sustain us?", 
      "Our current lifestyle is outpacing what the planet can handle, but small, mindful changes can help.",
      "Over the next few days, you'll be challenged to rethink the impact of your daily habits.",
      "From tracking your carbon footprint to identifying wasteful patterns, each task will bring you closer to a more sustainable lifestyle."
    ],
    challenges: {
      1: [
        "Read and reflect on one verse of the Quran.",
        "Learn a new hadith and share it with someone.",
        "Memorize a short surah or dua.",
        "Listen to an Islamic podcast or lecture.",
        "Write down a personal dua for Ramadan."
      ],
    },
  ),
  2: Chapter(
    theme: "Gratitude & Contentment",
    description: "Finding Joy in What You Have",
    story: [
      "Every year, the world produces over 2 billion tons of waste. In the U.S. alone, 30 to 40% of food goes to waste while millions face food insecurity.", 
      "Single-use plastics, excessive packaging, and fast fashion only add to the problem.",
      "Your challenge: Cut down on waste at home and on the go. You'll be tasked with eliminating single-use plastics, repurposing old items, and even finding creative ways to reduce food waste.", 
      "Each action will help conserve resources, reduce pollution, and keep unnecessary waste out of landfills."
    ],
    challenges: {
      1: [
        "List 10 things you’re grateful for today.",
        "Avoid complaining for an entire day.",
        "Cook a meal with minimal waste.",
        "Donate an item you no longer use.",
        "Perform a good deed for a family member without them knowing.",
      ],
    },
  ),
  3: Chapter(
    theme: "Charity & Community", 
    description: "Giving for the Sake of Allah",
    story: [
      "Leaving a phone charger plugged in might not seem like a big deal, but phantom energy use (electricity consumed by plugged-in devices not in use) costs Americans nearly \$19 billion annually."
      "Meanwhile, a single leaky faucet can waste a gallon of water a day.",
      
      "Your challenge: Reduce unnecessary energy and water consumption. You'll be tasked with unplugging unused electronics, adjusting your thermostat, taking shorter showers, and spotting energy-wasting habits at home.",
      "By conserving these resources, you’ll help lower emissions, protect water supplies, and even save money on your utility bills."
    ],
    challenges: {
      1: [
        "Give any amount in Sadaqah today.",
        "Volunteer your time to help someone.",
        "Share a meal with someone in need.",
        "Reconnect with a friend or relative you haven’t spoken to in a while.",
        "Encourage someone else to give charity.",
      ],
    },
  ),
  4: Chapter(
    theme: "Self-Discipline & Patience",
    description: "Building Inner Strength",
    story: [
      "The fast fashion industry produces 10% of the world's carbon emissions. That’s more than all international flights and maritime shipping combined. Meanwhile, an estimated 85% of textiles end up in landfills each year.", 
      "Your challenge: Be intentional with your purchases. You'll be tasked with supporting ethical brands, choosing durable and eco-friendly alternatives, and resisting impulse buys.",
      "By making smarter shopping decisions, you’ll reduce waste, cut down on pollution, and help shift industries toward more sustainable practices."
    ],
    challenges: {
      1: [
        "Avoid social media for the entire day.",
        "Control your temper and respond to frustration with kindness.",
        "Forgive someone today.",
        "Make dua for the forgiveness of the Ummah",
        "Make dhikr 100 times today (SubhanAllah, Alhamdulillah, Allahu Akbar).",
      ],
    },
  ),
  5: Chapter(
    theme: "Simplicity & Mindfulness",
    description: "Living a Purpose-Driven Life",
    story: [
      "Transportation is responsible for nearly 1/4 of global CO₂ emissions, with cars contributing the most. A short one-mile car trip emits nearly 400 grams of CO₂, while walking or biking has zero emissions.",
      "Even switching to public transit can cut your carbon footprint by half.",
      "Your challenge: Reduce your transportation impact. You'll be tasked with walking or biking instead of driving, carpooling with friends, and exploring public transit options.",
      "Every small shift adds up, lowering emissions, reducing traffic congestion, and improving air quality in your community."

    ],
    challenges: {
      1: [
        "Go outside and appreciate nature as a sign of Allah’s creation.",
        "Spend the evening in quiet reflection instead of entertainment.",
        "Make the intention to wake up up for the night prayer (tahajjud) for the next day."
        "Repent to Allah and ask for forgiveness.",
        "Send salawat upon the Prophet Muhammad (SAW).",
      ],
    },
  ),
  6: Chapter(
    theme: "Tawakkul & Transformation",
    description: "Trusting Allah & Looking Ahead",
    story: [
      "Only about 100 companies are responsible for over 70% of global emissions. Change happens when individuals advocate for better policies and corporate accountability.", 
      "Studies show that community cleanups, petitions, and sustainability initiatives can significantly reduce pollution and encourage greener practices.",
      "Your challenge: Take sustainability beyond your personal habits. You’ll be tasked with joining or organizing a cleanup, spreading awareness about sustainability issues, and contacting local leaders about environmental initiatives.",
      "The most impactful change happens when people work together—your voice and actions matter."

    ],
    challenges: {
      1: [
        "Make a list of personal habits you want to continue after Ramadan.",
        "Spend 10 minutes making sincere dua for others.",
        "Pray two extra rak’ahs of nafl prayer.",
        "Set a goal for after Ramadan and plan how to achieve it.",
        "Reflect on what you’ve learned this Ramadan and share one insight.",
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
