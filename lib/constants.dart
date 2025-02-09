
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
      "Sustainability isn’t just about saving the environment, it’s about ensuring that future generations have access to clean air, water, and resources.",
      "Did you know that if everyone lived like the average American, we would need five Earths to sustain us?", 
      "Our current lifestyle is outpacing what the planet can handle, but small, mindful changes can help.",
      "Over the next few days, you'll be challenged to rethink the impact of your daily habits.",
      "From tracking your carbon footprint to identifying wasteful patterns, each task will bring you closer to a more sustainable lifestyle."
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
      "Every year, the world produces over 2 billion tons of waste. In the U.S. alone, 30 to 40% of food goes to waste while millions face food insecurity.", 
      "Single-use plastics, excessive packaging, and fast fashion only add to the problem.",
      "Your challenge: Cut down on waste at home and on the go. You'll be tasked with eliminating single-use plastics, repurposing old items, and even finding creative ways to reduce food waste.", 
      "Each action will help conserve resources, reduce pollution, and keep unnecessary waste out of landfills."
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
      "Leaving a phone charger plugged in might not seem like a big deal, but phantom energy use (electricity consumed by plugged-in devices not in use) costs Americans nearly \$19 billion annually."
      "Meanwhile, a single leaky faucet can waste a gallon of water a day.",
      
      "Your challenge: Reduce unnecessary energy and water consumption. You'll be tasked with unplugging unused electronics, adjusting your thermostat, taking shorter showers, and spotting energy-wasting habits at home.",
      "By conserving these resources, you’ll help lower emissions, protect water supplies, and even save money on your utility bills."
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
      "The fast fashion industry produces 10% of the world's carbon emissions. That’s more than all international flights and maritime shipping combined. Meanwhile, an estimated 85% of textiles end up in landfills each year.", 
      "Your challenge: Be intentional with your purchases. You'll be tasked with supporting ethical brands, choosing durable and eco-friendly alternatives, and resisting impulse buys.",
      "By making smarter shopping decisions, you’ll reduce waste, cut down on pollution, and help shift industries toward more sustainable practices."
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
      "Transportation is responsible for nearly 1/4 of global CO₂ emissions, with cars contributing the most. A short one-mile car trip emits nearly 400 grams of CO₂, while walking or biking has zero emissions.",
      "Even switching to public transit can cut your carbon footprint by half.",
      "Your challenge: Reduce your transportation impact. You'll be tasked with walking or biking instead of driving, carpooling with friends, and exploring public transit options.",
      "Every small shift adds up, lowering emissions, reducing traffic congestion, and improving air quality in your community."

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
      "Only about 100 companies are responsible for over 70% of global emissions. Change happens when individuals advocate for better policies and corporate accountability.", 
      "Studies show that community cleanups, petitions, and sustainability initiatives can significantly reduce pollution and encourage greener practices.",
      "Your challenge: Take sustainability beyond your personal habits. You’ll be tasked with joining or organizing a cleanup, spreading awareness about sustainability issues, and contacting local leaders about environmental initiatives.",
      "The most impactful change happens when people work together—your voice and actions matter."

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
