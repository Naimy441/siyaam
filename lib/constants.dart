
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
      "“Read in the name of your Lord who created. Created man from a clot. Read, and your Lord is the Most Generous.” (Qur'an 96:1-3)",
      "This event highlights the importance of seeking knowledge in Islam. The Prophet ﷺ emphasized this by saying: “Seeking knowledge is an obligation upon every Muslim.” (Ibn Majah)",
      "📌 Reflection: Just as the Prophet ﷺ was instructed to seek knowledge, we too must prioritize learning—whether through Qur'an, Hadith, or personal reflection.",
    ],
    challenges: {
      1: [
        "Write down a personal dua for Ramadan.",
        "Read and reflect on one verse of the Quran.",
        "Learn a new hadith and share it with someone.",
        "Memorize a short surah or dua.",
        "Listen to an Islamic podcast or lecture.",
      ],
    },
  ),
  2: Chapter(
    theme: "Gratitude & Contentment",
    description: "Finding Joy in What You Have",
    story: [
      "🌿 Islamic Story: The Patience of Prophet Ayyub (AS)",
      "Prophet Ayyub (AS) was once wealthy, blessed with health, family, and prosperity. But he was tested with severe illness, loss of wealth, and isolation. Yet, despite his hardships, he never complained. Instead, he remained patient and grateful, saying:",
      "“Indeed, adversity has touched me, and You are the Most Merciful of the merciful.” (Qur'an 21:83)",
      "Because of his unwavering gratitude and patience, Allah restored his health and doubled his blessings.",
      "📌 Reflection: Gratitude is not about how much we have, but how we perceive our blessings. Ramadan teaches us to appreciate even the smallest things—water, food, family, and health."
    ],
    challenges: {
      1: [
        "List 3 things you're grateful for today.",
        "Avoid complaining for an entire day.",
        "Extend your sajdah (prostration) in prayer by a minute.",
        "Make dhikr 100 times today (SubhanAllah, Alhamdulillah, Allahu Akbar).",
        "Perform a good deed for a family member or friend without them knowing.",
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
        "Donate something (money, an item, a smile, or a compliment).",
        "Volunteer your time to help someone.",
        "Share a meal with someone in need.",
        "Reconnect with a friend or relative you haven't spoken to in a while.",
        "Participate in an event or spend time at the mosque.",
      ],
    },
  ),
  4: Chapter(
    theme: "Self-Discipline & Patience",
    description: "Building Inner Strength",
    story: [
      "🕌 Islamic Story: How Fasting Was Prescribed",
      "Before fasting in Ramadan became obligatory, early Muslims only fasted on Ashura (the 10th of Muharram). However, in the second year after the Hijrah, Allah revealed the command to fast during Ramadan, saying:",
      "“O you who have believed, fasting has been prescribed for you as it was prescribed for those before you, so that you may attain Taqwa (God-consciousness).” (Qur'an 2:183)",
      "Fasting is more than just abstaining from food—it is a training ground for self-discipline, patience, and gratitude. It helps us break bad habits, control our desires, and grow spiritually.",
      "📌 Reflection: Ramadan is a school of discipline. From controlling anger to resisting temptations, every fast strengthens our soul. As the month ends, we must carry this self-discipline into our daily lives. 🌙✨"
    ],
    challenges: {
      1: [
        "Avoid social media for the entire day.",
        "Control your temper and respond to frustration with kindness.",
        "Forgive someone today.",
        "Make dua for the forgiveness of the Ummah",
        "Strive to pray at least one prayer in congregation.",
      ],
    },
  ),
  5: Chapter(
    theme: "Simplicity & Mindfulness",
    description: "Living a Purpose-Driven Life",
    story: [
      "🍃 Islamic Story: The Minimalist Lifestyle of Prophet Muhammad ﷺ",
      "Despite being the leader of the Muslims, Prophet Muhammad ﷺ lived simply. His home was small, his mattress was rough, and some days he had nothing to eat except dates and water. When Umar (RA) saw the marks of a rough mat on his back, he wept. But the Prophet ﷺ replied:",
      "“What do I have to do with the world! I am not in the world but as a rider seeking shade under a tree, then he catches his breath and leaves it” (Tirmidhi).",
      "📌 Reflection: Happiness is not in material things but in contentment. Ramadan teaches us to let go of excess and live with purpose.",

    ],
    challenges: {
      1: [
        "Go outside and appreciate nature as a sign of Allah's creation.",
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
      "🛤 Islamic Story: The Tawakkul of Musa's Mother",
      "When Musa (AS) was born, Pharaoh had ordered the killing of all newborn Israelite boys. His mother was filled with fear, yet Allah inspired her with a command:",
      "“Suckle him, and when you fear for him, cast him into the river and do not fear nor grieve. Indeed, We will return him to you and make him one of the messengers.” (Qur'an 28:7)",
      "With complete Tawakkul (trust in Allah), she placed her baby into the dangerous waters of the Nile, not knowing what would happen. Yet, Allah's promise was true—Musa (AS) was not only saved but was returned to his mother and later became a Prophet.",
      "📌 Reflection: Just as Musa's mother let go and trusted Allah in her most difficult moment, we must carry this trust beyond Ramadan. Life will have uncertainties, but Allah's plan is always greater than our fears. Trust in Him, take action, and He will guide your path. 🌊✨",
    ],
    challenges: {
      1: [
        "Intimately learn one name of Allah and try to apply it.",
        "Deeply explore the story of a prophet you resonate with.",
        "Make a list of personal habits you want to continue after Ramadan.",
        "Set a goal for after Ramadan and plan how to achieve it.",
        "Reflect on what you've learned this Ramadan and share one insight.",
      ],
    },
  ),
};

final List<String> notifications = [
  "Skipping today? Jannah isn't gonna wait forever! Get your quest done!",
  "Jannah is knocking… but you're ignoring the door? Complete today's quest!",
  "A Step Closer to Jannah—unless you're okay staying behind? Open the app now!",
  "Every deed counts… except the ones you don't do. Your challenge awaits!",
  "Ramadan is a gift. Are you really gonna leave it unopened? Complete your quest!", 
  "Your effort is seen. But today, we're seeing… nothing. Keep up with your challenge!", 
  "Knock, and the Gates of Jannah open… but you're just standing there? Get moving!", 
  "One good deed can change everything! Too bad procrastination isn't one of them. Start now!", 
  "Let today be meaningful—unless scrolling endlessly is more fulfilling? Begin now!", 
  "Win in both worlds! Or just keep losing to laziness, your call. Your mission is ready!",
  "Don't let this day go to waste! Allah opens doors for whom he wills. Open the app now!", 
  "Grow closer to Allah! Or grow closer to another Netflix binge. Choose wisely.",
  "A new day, a new blessing! Don't wait until it's too late. Start now!", 
  "Your path to Jannah begins today! Or are you just sightseeing? Complete your quest!", 
  "Allah loves those who strive… so what's your excuse? Take that step today!", 
  "Ramadan is passing quickly… unlike your response time to this notification. Make it count!", 
  "Your effort will never be lost! Can't say the same for that missing motivation… Complete today's task", 
  "Earn rewards beyond measure! But hey, ignoring this works too. Start now!", 
  "Another chance to grow closer to Allah… and another chance for you to ignore it? Don't miss out!", 
  "Good deeds multiply in Ramadan! Take action now!",
  "One step at a time… unless you're standing still? Jannah is worth the effort!", 
  "Shaytan is locked up… so what's your excuse? Strengthen your faith today!", 
  "Ramadan won't last forever. Just like your willpower if you don't act now. Your mission awaits!", 
  "Allah sees your efforts! Stay consistent!", 
  "A heart full of faith, a life full of light… but only if you actually do something. Complete your task!", 
  "Your soul needs nourishment too! But sure, keep feeding that procrastination. Strengthen your Iman now!", 
  "Make every moment of Ramadan count! Or just count how many times you ignored this. Your challenge is waiting!", 
  "A blessed day awaits! But hey, no pressure, right? Complete today's task!", 
  "Don't miss out on today's rewards! Or do… but don't blame us later. A small deed goes a long way!", 
  "Jannah is within reach! Unlike your phone when you conveniently “forget” to check the app… Take action today!"
];

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
