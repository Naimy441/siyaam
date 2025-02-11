
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
      "📖 Islamic Story: The First Revelation",
      "One night, in the Cave of Hira, the Angel Jibreel (AS) appeared to Prophet Muhammad ﷺ, commanding him to “Read!” (Iqra). Though he was unlettered, he was chosen to receive the divine message that would change the world. The first revealed words were:",
      "“Read in the name of your Lord who created. Created man from a clot. Read, and your Lord is the Most Generous.” (Qur’an 96:1-3)",
      "This event highlights the importance of seeking knowledge in Islam. The Prophet ﷺ emphasized this by saying: “Seeking knowledge is an obligation upon every Muslim.” (Ibn Majah)",
      "📌 Reflection: Just as the Prophet ﷺ was instructed to seek knowledge, we too must prioritize learning—whether through Qur’an, Hadith, or personal reflection.",
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
      "🌿 Islamic Story: The Patience of Prophet Ayyub (AS)",
      "Prophet Ayyub (AS) was once wealthy, blessed with health, family, and prosperity. But he was tested with severe illness, loss of wealth, and isolation. Yet, despite his hardships, he never complained. Instead, he remained patient and grateful, saying:",
      "“Indeed, adversity has touched me, and You are the Most Merciful of the merciful.” (Qur’an 21:83)",
      "Because of his unwavering gratitude and patience, Allah restored his health and doubled his blessings.",
      "📌 Reflection: Gratitude is not about how much we have, but how we perceive our blessings. Ramadan teaches us to appreciate even the smallest things—water, food, family, and health."
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
      "💧 Islamic Story: Uthman (RA) and the Well of Ruma",
      "During a severe drought in Madinah, a wealthy merchant owned the only well, charging people for water. Prophet Muhammad ﷺ called upon the believers:",
      "“Whoever buys this well and shares its water with others will have Jannah in return.”",
      "Uthman ibn Affan (RA) purchased the well and made it free for all, securing his place in Paradise through charity.",
      "📌 Reflection: Giving is not just about money—it includes time, kindness, and even a smile. During Ramadan, our smallest acts of charity can have a big impact.",
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
      "🕌 Islamic Story: How Fasting Was Prescribed",
      "Before fasting was made obligatory, the early Muslims would only fast on Ashura (the 10th of Muharram). But in the second year after the Hijrah, Allah revealed:",
      "Fasting trains us in patience, discipline, and gratitude, helping us break bad habits and grow spiritually.",
      "📌 Reflection: Ramadan is a school of discipline—from controlling our anger to resisting temptations, every fast brings spiritual strength.",
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
      "🍃 Islamic Story: The Minimalist Lifestyle of Prophet Muhammad ﷺ",
      "Despite being the leader of the Muslims, Prophet Muhammad ﷺ lived simply. His home was small, his mattress was rough, and some days he had nothing to eat except dates and water. When Umar (RA) saw the marks of a rough mat on his back, he wept. But the Prophet ﷺ replied:",
      "“What do I have to do with this world? My example is like a traveler who rests under a tree for a short while and then moves on.” (Tirmidhi)",
      "📌 Reflection: Happiness is not in material things but in contentment. Ramadan teaches us to let go of excess and live with purpose.",

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
      "🛤 Islamic Story: The Hijrah & Tawakkul",
      "When the Prophet ﷺ and Abu Bakr (RA) fled Makkah to escape persecution, they hid in a cave as Quraysh forces searched for them. Abu Bakr (RA) whispered in fear:",
      "“O Messenger of Allah, if they look beneath their feet, they will see us!”",
      "The Prophet ﷺ replied with full trust in Allah:",
      "“Do not be afraid, for Allah is with us.” (Qur’an 9:40)",
      "Against all odds, they made it to Madinah safely, marking the beginning of a new era for Islam.",
      "📌 Reflection: Ramadan is about trusting Allah and embracing change. As the month ends, we must continue our journey beyond Ramadan with renewed faith.",

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
