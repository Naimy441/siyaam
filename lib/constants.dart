class Chapter {
  final String theme;
  final String description;
  final List<String> story;
  final Map<int, List<String>> challenges;

  Chapter(
      {required this.theme,
      required this.description,
      required this.story,
      required this.challenges});
}

final Map<String, Map<String, String>> twists = {
  "List 3 things you're grateful for today.": {
    "Funny":
        "😂 Gratitude check: What's keeping you sane today? Your comfy bed? That perfect cup of chai? The fact that you didn't sleep through Fajr? List three!",
    "Community":
        "🤝 Gratitude grows when shared! What are three things you're thankful for today? Bonus points if you tell someone!",
    "Creative":
        "🎨 Life is a canvas—what three colors of gratitude are painting your day today? List them and appreciate the masterpiece!",
    "Genius":
        "🧠 Studies show gratitude boosts happiness. List three things you're grateful for today and give your brain a natural dopamine boost!",
    "Roleplay":
        "🛡️ You've been blessed with many gifts on your quest—name three treasures you're grateful for today before continuing your journey!",
    "Gamified":
        "🏆 Daily quest: 'Gratitude Streak.' List three things you're grateful for and keep your streak going—bonus rewards for consistency!",
    "Shakespeare":
        "🎭 Hark! What blessings doth this day bestow upon thee? Speak, and name but three, that thy heart may brim with joy!",
    "Intelligence":
        "📚 Great minds reflect. What three things today remind you of the countless blessings in your life? Write them down and reflect!",
    "Courage":
        "🦁 Even on tough days, gratitude is a source of strength. Name three things you appreciate today and keep moving forward!",
    "Masterful":
        "🎩 A master of life knows that gratitude is key. Identify three things you're grateful for and let them fuel your success today!"
  },
  "Avoid complaining for an entire day.": {
    "Funny":
        "😂 No complaints today! Yes, even about the weather, your WiFi, or the person who took the last samosa. You got this!",
    "Community":
        "🤝 Positivity challenge: No complaints for a whole day! Instead, swap them out for gratitude—let's make this contagious!",
    "Creative":
        "🎨 Turn every complaint into a creative solution. Instead of 'Ugh, I'm tired,' try 'I'm a warrior who just needs a power nap.'",
    "Genius":
        "🧠 Your brain rewires with every thought—train it for positivity! Avoid complaints today and see how your mindset shifts.",
    "Roleplay":
        "🛡️ The hero's oath: 'I shall not utter a single complaint today, no matter how tempting!' Accept the challenge and rise above!",
    "Gamified":
        "🏆 Stealth Mode Activated: Dodge every complaint for 24 hours. If you slip up, reset and keep the streak going!",
    "Shakespeare":
        "🎭 Verily, shall thou abstain from lamentations this day! Speak only of joy, lest thou summon the woe of thine own tongue!",
    "Intelligence":
        "📚 Complaints drain energy. Challenge yourself to go 24 hours without one and channel that energy into solutions instead!",
    "Courage":
        "🦁 True strength lies in self-control. Resist the urge to complain today—face challenges with patience and grace!",
    "Masterful":
        "🎩 Mastery is found in restraint. Today, speak only solutions, not complaints, and watch how your perspective transforms!"
  },
  "Extend your sajdah (prostration) in prayer by a minute.": {
    "Funny":
        "😂 Bonus round: Stay in sujood for an extra minute. No, it's not a workout—yes, your legs might feel it. Worth it!",
    "Community":
        "🤝 Imagine the entire Ummah taking an extra moment in sujood today. Be part of this wave of devotion—hold it a little longer!",
    "Creative":
        "🎨 Think of your sujood as a heartfelt letter to Allah—take an extra minute to make it a masterpiece of sincerity!",
    "Genius":
        "🧠 Studies show deep reflection increases mindfulness. Extend your sujood by a minute today and feel the spiritual reset!",
    "Roleplay":
        "🛡️ Your quest: A longer sujood, a stronger connection. Hold your position and let your heart speak to its Creator!",
    "Gamified":
        "🏆 Achievement unlocked: 'Deep Connection.' Extend your sujood for 60 more seconds and level up your spiritual focus!",
    "Shakespeare":
        "🎭 Rest thy brow upon the earth a moment longer, and let thy soul whisper secrets to the Most Merciful!",
    "Intelligence":
        "📚 Sujood is where you're closest to your Creator—take a little extra time today and let that nearness sink in.",
    "Courage":
        "🦁 Patience, humility, and strength—hold your sujood a bit longer today and embrace the moment of surrender!",
    "Masterful":
        "🎩 A master of devotion knows that true peace is found in sujood. Linger a little longer and soak in the tranquility."
  },
  "Make dhikr 100 times today (SubhanAllah, Alhamdulillah, Allahu Akbar).": {
    "Funny":
        "😂 100 dhikr reps today—no gym membership required! Strengthen your soul, no sweating necessary!",
    "Community":
        "🤝 Imagine if we all did 100 dhikr today—millions of praises rising together! Be part of this beautiful wave!",
    "Creative":
        "🎨 Turn your dhikr into a rhythm, a melody, a heartbeat. 100 praises today—let your soul sing!",
    "Genius":
        "🧠 Neuroscience says repetition strengthens memory. Say 'SubhanAllah, Alhamdulillah, Allahu Akbar' 100 times today—rewire your heart!",
    "Roleplay":
        "🛡️ Your mission: Recite dhikr 100 times to fortify your spiritual armor. Each word is a shield—equip yourself well!",
    "Gamified":
        "🏆 Daily Quest: '100 Dhikr Streak!' Complete the challenge and earn spiritual XP—bonus points if you go beyond!",
    "Shakespeare":
        "🎭 Let thy tongue flow with praises most fair—100 utterances of love for the Most High shall grace thy day!",
    "Intelligence":
        "📚 Spiritual focus hack: Set small moments in your day to complete 100 dhikr. Watch how mindfulness increases!",
    "Courage":
        "🦁 The strongest hearts remember Allah often. Take on the challenge—100 dhikr today, and feel the strength within!",
    "Masterful":
        "🎩 A master of faith knows dhikr polishes the heart. Commit to 100 praises today and refine your soul!"
  },
  "Perform a good deed for a family member or friend without them knowing.": {
    "Funny":
        "😂 Become a stealthy do-gooder! Sneak in a good deed today—bonus points if they never figure out it was you!",
    "Community":
        "🤝 Secret kindness mission: Do something nice for a family member or friend today… but keep it a mystery!",
    "Creative":
        "🎨 Think of yourself as a kindness ninja—silent, swift, and untraceable. Leave good deeds behind, but no fingerprints!",
    "Genius":
        "🧠 Psychologists say secret acts of kindness boost happiness. Try it today—help someone without them knowing and observe the results!",
    "Roleplay":
        "🛡️ You're a mysterious guardian of goodness. Your task: Complete a secret mission of kindness without being detected!",
    "Gamified":
        "🏆 Side quest unlocked: 'Undercover Kindness.' Perform a good deed in secret—extra XP if no one suspects a thing!",
    "Shakespeare":
        "🎭 Dost thou seek noble purpose? Perform an act of kindness this day, yet let not thy name be known!",
    "Intelligence":
        "📚 A true act of kindness expects nothing in return. Challenge yourself today—do good and remain unseen.",
    "Courage":
        "🦁 True strength lies in quiet goodness. Go out of your way today to help someone—without taking credit!",
    "Masterful":
        "🎩 A master of generosity seeks no recognition. Today, uplift someone in secret and let the reward come from above!"
  },
  "Donate something (money, an item, a smile, or a compliment).": {
    "Funny":
        "😂 Donate something today—money, an item, a smile… or that half-eaten bag of chips you keep 'saving for later.'",
    "Community":
        "🤝 Giving brings us together! Donate something today, even if it's just a kind word to brighten someone's day.",
    "Creative":
        "🎨 Find a way to give that no one has thought of before—whether it's a poem, a doodle, or a completely unnecessary yet hilarious interpretive dance.",
    "Genius":
        "🧠 Run an impact analysis: What can you donate today that will yield the highest net positive return for humanity?",
    "Roleplay":
        "🛡️ You are a noble adventurer! Donate an item, a coin, or an act of kindness to aid a fellow traveler on their quest.",
    "Gamified":
        "🏆 Welcome to the Daily Giving Challenge! Donate something today and earn +100 kindness XP. Bonus points for creativity!",
    "Shakespeare":
        "🎭 Hark! Bestow upon thy brethren a gift most fair—a token, a coin, or but a smile—to weave joy midst the mortal coil!",
    "Intelligence":
        "📚 Donate something today—but make it something that helps another person learn, grow, or think deeper.",
    "Courage":
        "🦁 Give beyond your comfort zone—whether it's donating money when it feels tight or sharing words of kindness when it feels awkward.",
    "Masterful":
        "🎩 Give with grace, intention, and excellence—because true generosity is an art, and today, you are the artist."
  },
  "Volunteer your time to help someone.": {
    "Funny":
        "😂 Volunteer your time today—yes, even five minutes counts. No, watching someone struggle and thinking about helping doesn't.",
    "Community":
        "🤝 Lend a hand, lift a heart! Volunteer your time today and make someone's burden a little lighter.",
    "Creative":
        "🎨 Volunteer your time today—but do it in a way that surprises or delights someone. Bonus points for creativity!",
    "Genius":
        "🧠 Optimize your impact: Where can your time today create the greatest positive ripple effect?",
    "Roleplay":
        "🛡️ You are a wandering hero! Seek out a side quest where your skills can assist a fellow traveler in need.",
    "Gamified":
        "🏆 Daily Side Quest: Volunteer your time to help someone. Rewards: +50 Good Karma, +10 XP in Humanity.",
    "Shakespeare":
        "🎭 Dost thou possess the hours to spare? Lend thy hand to one in need, and be the light in another's shadowed day!",
    "Intelligence":
        "📚 Use your time wisely—volunteer in a way that shares knowledge, wisdom, or a skill with someone who could benefit.",
    "Courage":
        "🦁 Step outside your comfort zone—volunteer your time today in a way that pushes you to connect, serve, or lead.",
    "Masterful":
        "🎩 True mastery lies in service. Volunteer your time today with intention, excellence, and the knowledge that even small acts create great impact."
  },
  "Share a meal with someone in need.": {
    "Funny":
        "😂 Share a meal with someone in need—bonus points if you don't secretly hope they leave you the best bite.",
    "Community":
        "🤝 Food brings people together! Share a meal today and nourish both body and soul.",
    "Creative":
        "🎨 Don't just share a meal—make it an experience! Cook, plate, or present it in a way that makes someone smile.",
    "Genius":
        "🧠 Analyze: What's the most efficient and impactful way to share a meal today? Data-driven generosity, anyone?",
    "Roleplay":
        "🛡️ You are a traveling merchant with a bountiful feast! Share your provisions with a weary traveler in need.",
    "Gamified":
        "🏆 Side Quest: Share a meal, unlock +100 kindness XP, and level up in generosity!",
    "Shakespeare":
        "🎭 To break bread with one in need—what nobler act than this? Partake in charity and be blessed!",
    "Intelligence":
        "📚 Nourish the body, nourish the mind. Share a meal today, and spark a conversation that feeds the soul too.",
    "Courage":
        "🦁 Step beyond your comfort zone—offer food to someone you wouldn't normally approach and brighten their day.",
    "Masterful":
        "🎩 True generosity is elegant in its simplicity. Share a meal today with grace, humility, and an open heart."
  },
  "Reconnect with a friend or relative you haven't spoken to in a while.": {
    "Funny":
        "😂 Reconnect with a long-lost friend or relative—yes, even the one who still owes you \$5 from 2017.",
    "Community":
        "🤝 Friendships and family bonds grow stronger with time… but only if you nurture them! Reach out today.",
    "Creative":
        "🎨 Rekindle an old connection—but do it in a fun way! A meme? A handwritten letter? A dramatic 'long time no see' entrance?",
    "Genius":
        "🧠 Social ties are crucial for well-being. Strengthen yours today—reach out and rebuild a meaningful connection!",
    "Roleplay":
        "🛡️ You are a time-traveling bard, returning to an old ally. Send a message, rekindle the bond, and let the next chapter begin!",
    "Gamified":
        "🏆 Side Quest: Message someone you haven't talked to in a while. Achievement unlocked: 'Social Butterfly.'",
    "Shakespeare":
        "🎭 Hast thou a dear friend or kin left in silence too long? Pen thy words forthwith, and let not the bond wither!",
    "Intelligence":
        "📚 Exercise your emotional intelligence today—reach out with a thoughtful message and make someone's day brighter.",
    "Courage":
        "🦁 It's been a while, but don't overthink it! Send the message, make the call—reconnection takes bravery.",
    "Masterful":
        "🎩 A masterful life is rich in relationships. Take the first step in reviving an old connection today."
  },
  "Participate in an event or spend time at the mosque.": {
    "Funny":
        "😂 Go to the mosque or an event today—because praying alone is cool, but getting that post-prayer tea and catching up on auntie gossip? Even better.",
    "Community":
        "🤝 Faith grows stronger together! Join a gathering or spend time at the mosque today and connect with your community.",
    "Creative":
        "🎨 Don't just attend—immerse yourself! Whether through art, storytelling, or heartfelt conversation, make today's visit meaningful.",
    "Genius":
        "🧠 Engage with purpose: How can attending a mosque event today strengthen your faith and your understanding of the world?",
    "Roleplay":
        "🛡️ You are a seeker of wisdom on a sacred quest—attend a gathering or visit the mosque to gain spiritual insight and camaraderie!",
    "Gamified":
        "🏆 Mission: Attend an event or spend time at the mosque today. Bonus XP for meeting someone new or learning something valuable!",
    "Shakespeare":
        "🎭 To the house of worship thou must go, where hearts find peace and spirits grow!",
    "Intelligence":
        "📚 Faith and knowledge go hand in hand. Attend an event or visit the mosque today and expand both your mind and soul.",
    "Courage":
        "🦁 Step out of your routine—attend a gathering, meet new faces, or simply sit in quiet reflection at the mosque today.",
    "Masterful":
        "🎩 True mastery of faith comes in action—immerse yourself in an event today and strengthen your connection to Allah and your community."
  },
  "Avoid social media for the entire day.": {
    "Funny":
        "😂 Avoid social media today. Yes, that means no doomscrolling, no 'just one meme,' and absolutely NO lurking in the comments for drama.",
    "Community":
        "🤝 Disconnect to reconnect! Spend today off social media and use that time to engage with real people around you.",
    "Creative":
        "🎨 Skip social media for a day and create something instead! Doodle, write, build—turn that screen time into masterpiece time.",
    "Genius":
        "🧠 A full day without social media? Your brain just gained +10 focus points and a free upgrade to deep thinking mode.",
    "Roleplay":
        "🛡️ You are a monk on a digital sabbatical. The internet is a distraction—abstain for a day and reclaim your mind!",
    "Gamified":
        "🏆 Hard Mode Activated: No social media for the next 24 hours. Bonus XP if you replace it with something productive!",
    "Shakespeare":
        "🎭 Dost thou dare break free from yon endless scroll? Forsooth, a day unshackled from screens awaits thee!",
    "Intelligence":
        "📚 A social media detox is like a cleanse for the mind. Use today to read, reflect, and engage with the real world.",
    "Courage":
        "🦁 Resist the urge to check that notification. Be bold, be strong—today, you reclaim your time from the algorithm!",
    "Masterful":
        "🎩 The truly disciplined control their time. Stay off social media today and master the art of being present."
  },
  "Control your temper and respond to frustration with kindness.": {
    "Funny":
        "😂 Feeling frustrated? Take a deep breath, smile, and remember: you can't control others, but you can confuse them with unexpected kindness.",
    "Community":
        "🤝 Kindness is contagious! Respond to frustration today with patience—you never know whose day you might turn around.",
    "Creative":
        "🎨 Turn irritation into inspiration! Instead of reacting with anger, channel your energy into something positive—maybe even an artful comeback (kindly, of course).",
    "Genius":
        "🧠 Anger is easy, self-control is mastery. Today, run the experiment: respond to frustration with kindness and observe the results.",
    "Roleplay":
        "🛡️ You are a wise sage on a noble quest—when frustration arises, wield the sword of patience and shield of kindness!",
    "Gamified":
        "🏆 New challenge: Take a hit to your ego bar, but gain +100 XP in emotional intelligence by responding to frustration with kindness!",
    "Shakespeare":
        "🎭 What wrath dost rise within thy breast? Quell it with gentle words, for tempests do no good!",
    "Intelligence":
        "📚 A calm mind wins every argument before it begins. Today, practice responding to frustration with wisdom and kindness.",
    "Courage":
        "🦁 It takes strength to stay kind when frustrated. Be bold, take control, and turn anger into grace today.",
    "Masterful":
        "🎩 True mastery lies in self-discipline. Today, let your patience and kindness be the mark of a refined soul."
  },
  "Forgive someone today.": {
    "Funny":
        "😂 Forgive someone today—yes, even that friend who still hasn't returned your charger from 2019.",
    "Community":
        "🤝 Healing starts with forgiveness! Let go of a grudge today and make space for peace and connection.",
    "Creative":
        "🎨 Turn forgiveness into an art—write a letter, send a message, or express it in a unique way that brings closure.",
    "Genius":
        "🧠 Forgiveness isn't about them—it's about freeing up mental RAM. Clear out old grudges today and optimize your emotional processing speed.",
    "Roleplay":
        "🛡️ You are the noble ruler of your heart's kingdom. Show mercy today and grant forgiveness to an old foe!",
    "Gamified":
        "🏆 Achievement unlocked: 'The Peacemaker' — Forgive someone today and gain +200 XP in inner peace.",
    "Shakespeare":
        "🎭 What weight dost thou bear upon thy heart? Cast it off, and with noble grace, grant pardon this day!",
    "Intelligence":
        "📚 Forgiving isn't forgetting—it's choosing to move forward wisely. Show strength today by letting go of past grievances.",
    "Courage":
        "🦁 It takes true bravery to forgive. Today, be bold enough to release resentment and choose peace.",
    "Masterful":
        "🎩 A masterful soul knows that forgiveness is a gift to oneself. Grant it freely today and walk lighter."
  },
  "Make dua for the forgiveness of the Ummah": {
    "Funny":
        "😂 Make dua for the Ummah today—because let's be real, we all need it (yes, even that one uncle who argues at every iftar).",
    "Community":
        "🤝 Your dua can uplift millions! Take a moment to pray for the forgiveness and unity of the Ummah today.",
    "Creative":
        "🎨 Write or voice-record a heartfelt dua for the Ummah. Make it personal, poetic, or beautifully expressive—let it come from the heart!",
    "Genius":
        "🧠 A single sincere dua can change destinies. Maximize impact: Pray for the entire Ummah today with deep focus and intention.",
    "Roleplay":
        "🛡️ You are a guardian of faith, lifting your hands to the heavens for the strength and forgiveness of the Ummah—your prayer is your power!",
    "Gamified":
        "🏆 Daily Quest: Make dua for the Ummah. Bonus XP if you also include those who've wronged you—it's next-level forgiveness mode!",
    "Shakespeare":
        "🎭 Oh Lord of Mercy, with gentle grace, forgive Thy servants in every place!",
    "Intelligence":
        "📚 Dua is the most powerful tool in your hands. Use it today to seek mercy for the Ummah and strengthen the bond of faith.",
    "Courage":
        "🦁 True strength lies in praying not just for yourself, but for the whole Ummah. Be bold—ask Allah to shower His mercy upon all today!",
    "Masterful":
        "🎩 A true leader prays for their people. Take a moment to make sincere dua for the Ummah's forgiveness, guidance, and unity."
  },
  "Strive to pray at least one prayer in congregation.": {
    "Funny":
        "😂 Pray at least one salah in congregation today—because let's be honest, the barakah is great, and the unplanned post-prayer hangout is even better.",
    "Community":
        "🤝 There's power in praying together! Strengthen your connection with others and Allah by joining at least one congregational prayer today.",
    "Creative":
        "🎨 Make your prayer in congregation a special moment—invite a friend, family member, or even a stranger to join you in this act of worship!",
    "Genius":
        "🧠 Studies show that habits form stronger in groups. Boost your consistency by praying at least one salah in congregation today!",
    "Roleplay":
        "🛡️ You are a warrior of faith—gather your fellow believers and stand shoulder to shoulder in unity for at least one prayer today!",
    "Gamified":
        "🏆 Challenge unlocked: Pray at least one salah in congregation today! Bonus points if you bring someone along.",
    "Shakespeare":
        "🎭 Gather thee with thy brethren in solemn ranks, and let thy voices rise in prayer as one!",
    "Intelligence":
        "📚 Congregational prayer multiplies rewards and strengthens discipline. Make the smart choice—pray at least one salah with others today!",
    "Courage":
        "🦁 Step outside your comfort zone—whether at the masjid, at work, or with family, take the initiative to pray in congregation today!",
    "Masterful":
        "🎩 Discipline and devotion define greatness. Elevate your worship by praying at least one salah in congregation today."
  },
  "Go outside and appreciate nature as a sign of Allah's creation.": {
    "Funny":
        "😂 Step outside and appreciate nature today—yes, even if it's just staring at a tree for five minutes like a wise philosopher.",
    "Community":
        "🤝 Take a moment to connect—with nature and with others. Step outside, breathe deeply, and reflect on Allah's beautiful creation.",
    "Creative":
        "🎨 Nature is Allah's canvas—go outside and find the masterpiece hidden in the trees, the sky, or even the smallest flower!",
    "Genius":
        "🧠 The universe is mathematically perfect, and nature is its proof. Observe the signs of Allah in the symmetry, patterns, and order of creation today.",
    "Roleplay":
        "🛡️ You are an explorer on a sacred quest! Venture outside, seek the signs of Allah in nature, and return with newfound wisdom.",
    "Gamified":
        "🏆 Side quest unlocked: Step outside and find at least three signs of Allah's creation. Bonus XP if you capture the moment in a journal or photo!",
    "Shakespeare":
        "🎭 Dost thou not see the splendor of the earth? Go forth, gaze upon the heavens, and marvel at the artistry of thy Lord!",
    "Intelligence":
        "📚 From the vast cosmos to the smallest leaf, every piece of nature is a sign. Step outside, observe deeply, and reflect on Allah's creation.",
    "Courage":
        "🦁 Break free from the walls of routine! Step into nature, let the fresh air fill your lungs, and witness the majesty of Allah's creation.",
    "Masterful":
        "🎩 A true seeker of wisdom recognizes the lessons in every leaf and cloud. Go outside today and let nature remind you of Allah's greatness."
  },
  "Spend the evening in quiet reflection instead of entertainment.": {
    "Funny":
        "😂 Tonight, swap Netflix for nostalgia, TikTok for tranquility, and memes for mindfulness. Your brain will thank you tomorrow!",
    "Community":
        "🤝 Spend the evening in quiet reflection—disconnect from distractions and reconnect with yourself, your faith, and your purpose.",
    "Creative":
        "🎨 Turn reflection into an art—journal your thoughts, sketch your emotions, or write a letter to your future self instead of scrolling endlessly.",
    "Genius":
        "🧠 Your mind is your greatest asset. Give it space to breathe tonight—reflect, strategize, and let the best ideas surface!",
    "Roleplay":
        "🛡️ You are a seeker of wisdom, embarking on a night of contemplation. Put aside distractions and unlock the secrets of self-discovery!",
    "Gamified":
        "🏆 Hard mode unlocked: No entertainment tonight. Instead, engage in deep reflection and gain +100 XP in wisdom and clarity!",
    "Shakespeare":
        "🎭 Forsake the revelry of fleeting amusements, and in stillness, find the whispers of wisdom!",
    "Intelligence":
        "📚 Your mind is constantly absorbing—tonight, give it a moment to process. Step away from distractions and embrace quiet reflection.",
    "Courage":
        "🦁 It takes strength to sit with your thoughts instead of drowning them in noise. Face the silence and embrace what it teaches you.",
    "Masterful":
        "🎩 A mind at peace is a mind in control. Master your evening by trading entertainment for deep reflection and self-awareness."
  },
  "Make the intention to wake up up for the night prayer (tahajjud) for the next day.":
      {
    "Funny":
        "😂 Set your alarm, make dua, and mentally prepare yourself to win the ultimate boss battle: waking up for tahajjud!",
    "Community":
        "🤝 The Ummah rises in the quiet of the night for blessings—make your intention to join them in seeking Allah's mercy at tahajjud.",
    "Creative":
        "🎨 Think of tahajjud as an exclusive, invite-only event where the guest list is small, but the rewards are infinite. Set your intention to be there!",
    "Genius":
        "🧠 Science says early risers are more productive. Faith says tahajjud brings barakah. Set your intention and unlock both benefits tomorrow!",
    "Roleplay":
        "🛡️ You are a warrior of the night, rising in secret to gain divine strength. Make your intention now and prepare for the battle against sleep!",
    "Gamified":
        "🏆 Side quest: Commit to waking up for tahajjud. Bonus points if you actually hear your alarm and don't hit snooze!",
    "Shakespeare":
        "🎭 As the world slumbers, thou shalt rise, whispering prayers that reach the heavens. Make thy noble intention tonight!",
    "Intelligence":
        "📚 Tahajjud is a proven habit of the most disciplined and successful. Make the intention to wake up and experience its transformative power!",
    "Courage":
        "🦁 It takes real strength to sacrifice sleep for worship. Make your intention now and prepare to rise before the world awakens!",
    "Masterful":
        "🎩 The night is silent, the rewards are immense. A master of discipline prepares in advance—make your intention for tahajjud tonight."
  },
  "Repent to Allah and ask for forgiveness.": {
    "Funny":
        "😂 Time to clear your spiritual browser history—repent and refresh your soul with Allah's mercy!",
    "Community":
        "🤝 We all slip, but Allah's mercy is endless. Take a moment today to sincerely repent and ask for forgiveness.",
    "Creative":
        "🎨 Imagine your sins being washed away like ink in water—repent sincerely today and start fresh with a clean slate.",
    "Genius":
        "🧠 Error detected. Solution: Sincere repentance. Execute now for a system reset and unlimited divine mercy.",
    "Roleplay":
        "🛡️ You are a traveler on the road to Jannah—drop the burdens of your past and seek forgiveness to walk lighter.",
    "Gamified":
        "🏆 Achievement unlocked: 'The Repentant.' Seek Allah's forgiveness today and gain unlimited mercy buffs!",
    "Shakespeare":
        "🎭 Cast thy burdens upon the Most Merciful, and with a heart sincere, seek His pardon anon!",
    "Intelligence":
        "📚 Logical conclusion: If Allah loves those who repent, then repenting = earning divine love. Don't miss out—ask for forgiveness today!",
    "Courage":
        "🦁 Owning up to mistakes takes strength—seek Allah's mercy today and walk forward with a fearless heart.",
    "Masterful":
        "🎩 The wise know that true mastery begins with humility. Repent today and elevate your soul with Allah's mercy."
  },
  "Send salawat upon the Prophet Muhammad (SAW).": {
    "Funny":
        "😂 One salawat = blessings. More salawat = even MORE blessings. Basically, an unlimited reward glitch—take advantage now!",
    "Community":
        "🤝 Join millions across the world in sending salawat upon the Prophet (SAW) today—your love and dua connect us all!",
    "Creative":
        "🎨 Each salawat is like adding a brushstroke to a masterpiece of blessings—send yours today and watch the beauty unfold!",
    "Genius":
        "🧠 Salawat: A high-reward, zero-cost action with infinite ROI. Optimize your time—send blessings upon the Prophet (SAW) now!",
    "Roleplay":
        "🛡️ You are a devoted follower of the Prophet (SAW), spreading light through your words. Send salawat and increase your ranks!",
    "Gamified":
        "🏆 Daily quest unlocked: Send salawat upon the Prophet (SAW). Bonus XP if you make it a habit today!",
    "Shakespeare":
        "🎭 Let thy lips utter words of praise, and upon the Prophet (SAW), send blessings in endless ways!",
    "Intelligence":
        "📚 A single salawat earns you Allah's mercy and tenfold rewards. The logical move? Send as many as you can today!",
    "Courage":
        "🦁 The bravest hearts love deeply—send salawat today and honor the Prophet (SAW) with your words and devotion!",
    "Masterful":
        "🎩 A true believer knows the value of salawat. Elevate your status in this world and the next—begin now."
  },
  "Intimately learn one name of Allah and try to apply it.": {
    "Funny":
        "😂 Allah has 99 names, and you only know a few? Time to upgrade your knowledge—pick one today and actually use it!",
    "Community":
        "🤝 Strengthen your connection with Allah by learning one of His beautiful names today—and find a way to live by it!",
    "Creative":
        "🎨 Allah's names are like 99 colors on a divine palette—choose one, reflect on its meaning, and paint your actions with it today!",
    "Genius":
        "🧠 Allah's names hold deep wisdom. Select one, analyze its impact, and integrate its meaning into your daily routine—experiment starts now!",
    "Roleplay":
        "🛡️ You are on a quest for divine knowledge. Learn a name of Allah today, embody its meaning, and level up in faith!",
    "Gamified":
        "🏆 New challenge: Pick one name of Allah, learn its meaning, and apply it in real life today. Bonus points if you teach someone else!",
    "Shakespeare":
        "🎭 Dost thou not know the majesty of thy Lord's names? Choose but one, embrace its essence, and let it guide thy heart this day!",
    "Intelligence":
        "📚 Deep thinkers reflect on divine attributes. Study one name of Allah today and find a practical way to incorporate it into your life!",
    "Courage":
        "🦁 It takes strength to transform knowledge into action. Learn a name of Allah today and challenge yourself to embody it!",
    "Masterful":
        "🎩 A true seeker applies wisdom. Choose one name of Allah, learn it intimately, and let it refine your character today."
  },
  "Deeply explore the story of a prophet you resonate with.": {
    "Funny":
        "😂 You think your life is dramatic? Wait till you read about Yunus (AS) in the belly of a whale. Pick a prophet's story and dive in!",
    "Community":
        "🤝 The struggles of the prophets (AS) hold lessons for all of us. Find one whose journey speaks to your heart and reflect on it today!",
    "Creative":
        "🎨 Every prophet's story is a masterpiece of resilience and faith. Pick one, absorb the wisdom, and let it shape your own narrative!",
    "Genius":
        "🧠 Prophetic stories are case studies in patience, wisdom, and perseverance. Choose one, analyze its lessons, and apply them today!",
    "Roleplay":
        "🛡️ You are walking the path of the prophets—choose one to study today and see how their trials and triumphs guide your own journey!",
    "Gamified":
        "🏆 Story Mode: Unlocked. Pick a prophet's journey, immerse yourself in their trials, and uncover lessons that level up your life!",
    "Shakespeare":
        "🎭 Lo, the tales of the prophets hold wisdom untold! Delve deep into their trials and triumphs, and let their virtue light thy way!",
    "Intelligence":
        "📚 Great leaders study history. Choose a prophet's story today, extract its lessons, and apply them to your personal growth!",
    "Courage":
        "🦁 The prophets endured hardships beyond imagination. Find one whose story inspires you, and channel their strength today!",
    "Masterful":
        "🎩 Wisdom is found in the footsteps of the prophets. Choose one today, study their resilience, and embody their lessons in your life."
  },
  "Make a list of personal habits you want to continue after Ramadan.": {
    "Funny":
        "😂 You've been on your best behavior this Ramadan—don't let it be a limited-time offer! Make a list of habits to keep!",
    "Community":
        "🤝 Ramadan might end, but its blessings don't have to. Write down the habits you want to carry forward and stay consistent!",
    "Creative":
        "🎨 Think of Ramadan as a training arc. What habits have you mastered? List them down so you don't lose your progress!",
    "Genius":
        "🧠 Your brain has been rewired for self-discipline—don't waste it! List the habits you want to sustain and strategize for long-term success.",
    "Roleplay":
        "🛡️ You've leveled up this Ramadan—now don't lose your XP! Write down the habits that will keep you strong after the month ends!",
    "Gamified":
        "🏆 Endgame unlocked: Ramadan may be ending, but your streak doesn't have to! Write down your best habits and keep the rewards rolling!",
    "Shakespeare":
        "🎭 Dost thou wish to preserve the light of Ramadan? Pen thy noble habits, lest they fade into the winds of forgetfulness!",
    "Intelligence":
        "📚 Behavioral science says habits stick better when written down. Make a list and set yourself up for long-term spiritual success!",
    "Courage":
        "🦁 True strength is carrying Ramadan's discipline into the rest of the year. List the habits that will keep you on the right path!",
    "Masterful":
        "🎩 A wise person builds lasting change. Reflect, list your best habits, and ensure Ramadan's lessons stay with you beyond the month."
  },
  "Set a goal for after Ramadan and plan how to achieve it.": {
    "Funny":
        "😂 Ramadan you is on fire! Don't let post-Ramadan you drop the ball—set a goal now before the Eid snacks distract you!",
    "Community":
        "🤝 Great things happen with intention! Set a goal for after Ramadan and plan how to keep growing with your community's support.",
    "Creative":
        "🎨 Think of Ramadan as the prologue to your next big chapter. What's your next goal? Sketch it out and design a plan to achieve it!",
    "Genius":
        "🧠 Goals without plans are just wishes. Use that post-Ramadan motivation to set a clear objective and a roadmap to get there!",
    "Roleplay":
        "🛡️ You've trained all Ramadan—now what's your next quest? Set a goal and strategize your victory like a true hero!",
    "Gamified":
        "🏆 Mission unlocked: 'Level Up After Ramadan!' Set your next goal, break it into achievable steps, and keep stacking rewards!",
    "Shakespeare":
        "🎭 Let not thy newfound strength wane! Set forth a noble aim, chart thy course, and let thy soul strive beyond Ramadan's days!",
    "Intelligence":
        "📚 High performers always plan ahead. Set a post-Ramadan goal, map out your action steps, and track your progress!",
    "Courage":
        "🦁 Ramadan has strengthened your will—now channel that strength! Set a bold goal and commit to making it happen!",
    "Masterful":
        "🎩 A true master of self-improvement doesn't stop at Ramadan. Define your next goal, craft a strategy, and execute with excellence."
  },
  "Reflect on what you've learned this Ramadan and share one insight.": {
    "Funny":
        "😂 Lesson #1: You're way stronger than you thought. Lesson #2: Suhoor hits different when you actually plan it. What's your Ramadan takeaway?",
    "Community":
        "🤝 Ramadan teaches us all something different—what's one lesson that stuck with you? Share it and inspire someone today!",
    "Creative":
        "🎨 Ramadan is like a beautiful tapestry woven with lessons—what's one thread that stands out to you? Reflect and share!",
    "Genius":
        "🧠 The best learners reflect and share. What's one powerful lesson from Ramadan that you'll carry forward? Teach someone today!",
    "Roleplay":
        "🛡️ You've journeyed through Ramadan's trials—what wisdom have you gained? Share your insight like a true seeker of truth!",
    "Gamified":
        "🏆 Achievement unlocked: 'Ramadan Wisdom.' Reflect on what you've learned and share one insight to level up someone else's journey!",
    "Shakespeare":
        "🎭 What wisdom hath this blessed month bestowed upon thee? Speak, that thy words may kindle light in another's soul!",
    "Intelligence":
        "📚 Knowledge grows when shared. What's one lesson from Ramadan that changed your mindset? Reflect and pass it on!",
    "Courage":
        "🦁 True strength comes from reflection. What's one lesson Ramadan taught you that will help you in life's challenges? Share it boldly!",
    "Masterful":
        "🎩 A wise person reflects, and a leader shares. What's one Ramadan lesson that transformed you? Inspire someone with your insight!"
  },
};

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
        "Make the intention to wake up up for the night prayer (tahajjud) for the next day.",
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
  "A blessed day await    `s! But hey, no pressure, right? Complete today's task!",
  "Don't miss out on today's rewards! Or do… but don't blame us later. A small deed goes a long way!",
  "Jannah is within reach! Unlike your phone when you conveniently “forget” to check the app… Take action today!"
];

final List<Map<String, String>> quranAndDuaList = [
  {
    "transliteration":
        "Allahumma Ijal 'Amalee kullahou saulihaa, waj'alhu li-Wajhika khaalisan, wa la taj'al li-ahadin feehi shay'an.",
    "translation":
        "O Allah, make all my work righteous, and make it purely for seeking Your Face, and do not make anything in it for someone (other than You).",
    "dua":
        "اللَّهُمَّ اجْعَلْ عَمَلِي كُلَّهُ صَالِحًا، وَاجْعَلْهُ لِوَجْهِكَ خَالِصًا، وَلَا تَجْعَلْ لِأَحَدٍ فِيهِ شَيْئًا",
    "quran":
        "وَبَشِّرِ ٱلَّذِينَ ءَامَنُوا۟ وَعَمِلُوا۟ ٱلصَّـٰلِحَـٰتِ أَنَّ لَهُمْ جَنَّـٰتٍۢ تَجْرِى مِن تَحْتِهَا ٱلْأَنْهَـٰرُ ۖ كُلَّمَا رُزِقُوا۟ مِنْهَا مِن ثَمَرَةٍۢ رِّزْقًۭا ۙ قَالُوا۟ هَـٰذَا ٱلَّذِى رُزِقْنَا مِن قَبْلُ ۖ وَأُتُوا۟ بِهِۦ مُتَشَـٰبِهًۭا ۖ وَلَهُمْ فِيهَآ أَزْوَٰجٌۭ مُّطَهَّرَةٌۭ ۖ وَهُمْ فِيهَا خَـٰلِدُونَ",
    "interpretation":
        "Give good news ˹O Prophet˺ to those who believe and do good that they will have Gardens under which rivers flow. Whenever provided with fruit, they will say, “This is what we were given before,” for they will be served fruit that looks similar ˹but tastes different˺. They will have pure spouses, and they will be there forever. Quran 2:25"
  },
  {
    "transliteration":
        "Allahumma Ya Muqallib al Quloob thabbit Qulūbana 'alaa Deenik. Wa Ya Musarrifal-Qulūbi Sarrif Qulūbana 'alā Tā'atika.",
    "translation":
        "O Changer of the hearts, make our heart firm upon Your Religion. O Controller of the hearts, direct our hearts to Your obedience.",
    "dua":
        "اللَّهُمَّ يا مُقَلِّبَ القُلُوبِ ثَبِّتْ قُلُوبَنَا على دِيْنِكَ، ويا مُصَرِّفَ القُلُوبِ صَرِّفْ قُلُوْبَنَا على طَاعَتِك",
    "quran":
        "وَإِذَا سَأَلَكَ عِبَادِى عَنِّى فَإِنِّى قَرِيبٌ ۖ أُجِيبُ دَعْوَةَ ٱلدَّاعِ إِذَا دَعَانِ ۖ فَلْيَسْتَجِيبُوا۟ لِى وَلْيُؤْمِنُوا۟ بِى لَعَلَّهُمْ يَرْشُدُونَ",
    "interpretation":
        "When My servants ask you ˹O Prophet˺ about Me: I am truly near. I respond to one's prayer when they call upon Me. So let them respond ˹with obedience˺ to Me and believe in Me, perhaps they will be guided ˹to the Right Way˺. Quran 2:186"
  },
  {
    "transliteration":
        "Allahumma tahhir qalbi minan nifaq, wa 'amali minar riya, wa lisani minal kadhib, wa 'ayni minal khiyana. Fa inaka t'alamu khainatal a'ayuni wa ma tukhfis sudur.",
    "translation":
        "O Allah, purify my heart from hypocrisy, my actions from showing off, my tongue from lies, and my eyes from deception (evil glances). For surely, You are fully aware of the deception of the eyes and all that the chest conceals.",
    "dua":
        "اللَّهُمَّ طَهِّرْ قَلْبِي مِنَ النِّفَاقِ وَعَمَلِي مِنَ الرِّيَاءِ وَلِسَانِي مِنَ الْكَذِبِ وَعَيْنِي مِنَ الْخِيَانَةِ، فَإِنَّكَ تَعْلَمُ خَائِنَةَ الأَعْيُنِ وَمَا تُخْفِي الصُّدُورُ",
    "quran":
        "رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِن لَّدُنكَ رَحْمَةً ۚ إِنَّكَ أَنتَ ٱلْوَهَّابُ",
    "interpretation":
        "˹They say,˺ “Our Lord! Do not let our hearts deviate after you have guided us. Grant us Your mercy. You are indeed the Giver ˹of all bounties˺. Quran 3:8"
  },
  {
    "transliteration":
        "Allahumma inni as'aluka 'Ilman naafi'an, wa rizqan tayyiban, wa 'amalan mutaqabbalan.",
    "translation":
        "O Allah! I ask You for knowledge that is of benefit, a good provision and deeds that will be accepted.",
    "dua":
        "اَللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَ رِزْقًا طَيَّبًا، وَعَمَلاً مُتَقَبَّلاً",
    "quran":
        "يَـٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا۟ ٱتَّقُوا۟ ٱللَّهَ حَقَّ تُقَاتِهِۦ وَلَا تَمُوتُنَّ إِلَّا وَأَنتُم مُّسْلِمُونَ",
    "interpretation":
        "O believers! Be mindful of Allah in the way He deserves, and do not die except in ˹a state of full˺ submission ˹to Him. Quran 3:102"
  },
  {
    "transliteration":
        "Allahumma inni as'alukal-huda, wat-tuqa, wal-'afafa, wal-ghina.",
    "translation":
        "O Allah! I beseech You for guidance, piety, chastity, and contentment.",
    "dua":
        "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْهُدَى وَالتُّقَى وَالْعَفَافَ وَالْغِنَى",
    "quran":
        "وَٱللَّهُ يُرِيدُ أَن يَتُوبَ عَلَيْكُمْ وَيُرِيدُ ٱلَّذِينَ يَتَّبِعُونَ ٱلشَّهَوَٰتِ أَن تَمِيلُوا۟ مَيْلًا عَظِيمًۭا",
    "interpretation":
        "And it is Allah's Will to turn to you in grace, but those who follow their desires wish to see you deviate entirely ˹from Allah's Way˺. Quran 4:27"
  },
  {
    "transliteration":
        "Allahumma, 'aati nafsi taqwaaha, wa zakkihaa Anta khairu man zakkaahaa, Anta waliyyuhaa wa maulaaha.",
    "translation":
        "O Allah! Grant my soul its piety and purify it, for You are the Best to purify it. You are its Protector and Guardian.",
    "dua":
        "اللَّهُمَّ آتِ نَفْسِي تَقْوَاهَا وَزَكِّهَا أَنْتَ خَيْرُ مَنْ زَكَّاهَا أَنْتَ وَلِيُّهَا وَمَوْلَاهَا",
    "quran":
        "وَعَدَ ٱللَّهُ ٱلَّذِينَ ءَامَنُوا۟ وَعَمِلُوا۟ ٱلصَّـٰلِحَـٰتِ ۙ لَهُم مَّغْفِرَةٌۭ وَأَجْرٌ عَظِيمٌۭ",
    "interpretation":
        "Allah has promised those who believe and do good ˹His˺ forgiveness and a great reward. Quran 5:9"
  },
  {
    "transliteration":
        "Allahumma ihdinaa, wahdi binaa, waj 'alnaa sababan limanihtadaa.",
    "translation":
        "O Allah! Guide us, guide others through us, and make us a means/cause for all those who are rightly guided.",
    "dua": "اللَّهُمَّ اهْدِناَ واهْدِ بِناَ واجْعَلناَ سَبَباً لِمَنِ اهتَدى",
    "quran":
        "ٱلْحَمْدُ لِلَّهِ ٱلَّذِى خَلَقَ ٱلسَّمَـٰوَٰتِ وَٱلْأَرْضَ وَجَعَلَ ٱلظُّلُمَـٰتِ وَٱلنُّورَ ۖ ثُمَّ ٱلَّذِينَ كَفَرُوا۟ بِرَبِّهِمْ يَعْدِلُونَ",
    "interpretation":
        "All praise is for Allah Who created the heavens and the earth and made darkness and light.1 Yet the disbelievers set up equals to their Lord ˹in worship˺ Quran 6:1"
  },
  {
    "transliteration":
        "Allahumma 'afini fi badani, Allahumma afini fi sam'i, Allahumma 'afini fi basari, Allahumma inni a'udhu bika min al-kufri wa-l-faqr, Allahumma inni a'udhu bika min 'adhabi-l-qabr, la 'ilahi illa Ant.",
    "translation":
        "O Allah, give me health in my body, O Allah, give me health in my hearing, Allah, give me health in my sight. O Allah, I seek your protection in You from disbelief and poverty. O Allah, I seek protection in You from punishment in the grave. There is no god but You.",
    "dua":
        "اَللَّهُمَّ عَافِنِي فِي بَدَنِي، اَللَّهُمَّ عَافِنِي فِي سَمْعِي، اَللَّهُمَّ عَافِنِي فِي بَصَرِي، اَللَّهُمَ إنِّي أَعُوذَ بِكَ مِنْ الكُفْرِ وَالفَقْرِ، اَللَّهُمَ إنِّي أَعُوذَ بِكَ مِنْ عَذَابِ القَبْرِ، لَآ إِلَهَ إِلَّا أَنْتَ",
    "quran": "مَا وَدَّعَكَ رَبُّكَ وَمَا قَلَىٰ",
    "interpretation":
        "Your Lord has not abandoned you, nor has He become hateful ˹of you˺. Quran 93:3"
  },
  {
    "transliteration":
        "Allahumma inni as`aluka hubbaka wa hubba man yuhibbuka wal amalal ladzi yuballighuni hubbaka. Allahumaj 'al hubbaka ahabba ilayya min nafsi wa ahli wa minal ma'il barid.",
    "translation":
        "Oh Allah, I ask You for Your love and the love of those who love You, and I ask You for the actions that will lead me to Your love. Oh Allah make Your love more beloved to me than myself, my family, and the cold water.",
    "dua":
        "اللَّهُمَّ إِنِّي أَسْأَلُكَ حُبَّكَ وَحُبَّ مَنْ يُحِبُّكَ وَالْعَمَلَ الَّذِيْ يُبَلِّغُنِي حُبَّكَ اللَّهُمَّ اجْعَلْ حُبَّكَ أََحَبَّ إِلَيَّ مِنْ نَفْسِيْ وَأَهْلِيْ وَمِنَ الْمَاءِ الْبَارِدِ",
    "quran":
        "لَهُمْ دَارُ ٱلسَّلَـٰمِ عِندَ رَبِّهِمْ ۖ وَهُوَ وَلِيُّهُم بِمَا كَانُوا۟ يَعْمَلُونَ",
    "interpretation":
        "They will have the Home of Peace with their Lord, Who will be their Guardian because of what they used to do. Quran 6:127"
  },
  {
    "transliteration":
        "Rabbana hablana min azwajina wadhurriyyatina qurrata a'yunin wajaalna lilmuttaqeena imamaa.",
    "translation":
        "Our Lord! Bless us with ˹pious˺ spouses and offspring who will be the joy of our hearts, and make us models for the righteous.",
    "dua":
        "رَبَّنَا هَبْ لَنَا مِنْ أَزْوَٰجِنَا وَذُرِّيَّـٰتِنَا قُرَّةَ أَعْيُنٍۢ وَٱجْعَلْنَا لِلْمُتَّقِينَ إِمَامًا",
    "quran":
        "وَلِلَّهِ ٱلْأَسْمَآءُ ٱلْحُسْنَىٰ فَٱدْعُوهُ بِهَا ۖ وَذَرُوا۟ ٱلَّذِينَ يُلْحِدُونَ فِىٓ أَسْمَـٰٓئِهِۦ ۚ سَيُجْزَوْنَ مَا كَانُوا۟ يَعْمَلُونَ",
    "interpretation":
        "Allah has the Most Beautiful Names. So call upon Him by them, and keep away from those who abuse His Names. They will be punished for what they used to do. Quran 7:180"
  },
  {
    "transliteration":
        "Rabbana atina fid dunya hasanatan wa fil Aakhirati hasanatan waqina 'adhaban-nar.",
    "translation":
        "Our Lord, give us in this world [that which is] good and in the Hereafter [that which is] good and protect us from the punishment of the Fire.",
    "dua":
        "رَبَّنَآ ءَاتِنَا فِى ٱلدُّنْيَا حَسَنَةًۭ وَفِى ٱلـَٔاخِرَةِ حَسَنَةًۭ وَقِنَا عَذَابَ ٱلنَّارِ",
    "quran":
        "إِنَّمَا ٱلصَّدَقَـٰتُ لِلْفُقَرَآءِ وَٱلْمَسَـٰكِينِ وَٱلْعَـٰمِلِينَ عَلَيْهَا وَٱلْمُؤَلَّفَةِ قُلُوبُهُمْ وَفِى ٱلرِّقَابِ وَٱلْغَـٰرِمِينَ وَفِى سَبِيلِ ٱللَّهِ وَٱبْنِ ٱلسَّبِيلِ ۖ فَرِيضَةًۭ مِّنَ ٱللَّهِ ۗ وَٱللَّهُ عَلِيمٌ حَكِيمٌۭ",
    "interpretation":
        "Alms-tax is only for the poor and the needy, for those employed to administer it, for those whose hearts are attracted ˹to the faith˺, for ˹freeing˺ slaves, for those in debt, for Allah's cause, and for ˹needy˺ travellers. ˹This is˺ an obligation from Allah. And Allah is All-Knowing, All-Wise. Quran 9:60"
  },
  {
    "transliteration":
        "Allahumma Ya Mua'allima Adama wa Ibraahima 'Allimnaa. Wa Ya Mufah-hima Sulayman Fah-himnaa.",
    "translation":
        "O Allah, O the One Who taught Adam and Abraham, teach us. O the One Who granted Solomon understanding, grant us understanding.",
    "dua":
        "اللهمّ يا مُعَلِّم آدم و إبراهيم، عَلِّمْنَا، ويا مُفَهِّم سُلَيْمَان، فهمنا",
    "quran":
        "إِنَّ ٱلَّذِينَ ءَامَنُوا۟ وَعَمِلُوا۟ ٱلصَّـٰلِحَـٰتِ يَهْدِيهِمْ رَبُّهُم بِإِيمَـٰنِهِمْ ۖ تَجْرِى مِن تَحْتِهِمُ ٱلْأَنْهَـٰرُ فِى جَنَّـٰتِ ٱلنَّعِيمِ",
    "interpretation":
        "Surely those who believe and do good, their Lord will guide them ˹to Paradise˺ through their faith, rivers will flow under their feet in the Gardens of Bliss. Quran 10:09"
  },
  {
    "transliteration":
        "Allahumma ij'alna min ahlil-Qur'ani alladhīna hum ahluka wa khāṣṣataka, bi-raḥmatika yā arḥama ar-rāḥimīn.",
    "translation":
        "O Allah! Make us among the people of the Quran who are Your special people, by Your mercy, O Most Merciful of the Merciful.",
    "dua":
        "اللَّهُمَّ اجْعَلْنَا مِنْ أَهْلِ الْقُرْآنِ الَّذِينَ هُمْ أَهْلُكَ وَخَاصَّتَكَ بِرَحْمَتِكَ يَا أَرْحَمَ الرَّاحِمِينَ",
    "quran":
        "وَأَقِمِ ٱلصَّلَوٰةَ طَرَفَىِ ٱلنَّهَارِ وَزُلَفًۭا مِّنَ ٱلَّيْلِ ۚ إِنَّ ٱلْحَسَنَـٰتِ يُذْهِبْنَ ٱلسَّيِّـَٔاتِ ۚ ذَٰلِكَ ذِكْرَىٰ لِلذَّٰكِرِينَ",
    "interpretation":
        "Establish prayer ˹O Prophet˺ at both ends of the day and in the early part of the night.1 Surely good deeds wipe out evil deeds. That is a reminder for the mindful. Quran 11:114"
  },
  {
    "transliteration":
        "Yā ḥayyu yā qayyūmu bi-raḥmatika astaghīthu aṣliḥ lī sha'nī kullahu walā takilnī ilā nafsī ṭarfata 'aynin.",
    "translation":
        "O Ever Living One, O Sustainer of all, by Your mercy I call on You to set right all my affairs. Do not place me in charge of my soul even for the blinking of an eye.",
    "dua":
        "يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ أَصْلِحْ لِي شَأْنِي كُلَّهُ وَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ",
    "quran":
        "رَبِّ قَدْ ءَاتَيْتَنِى مِنَ ٱلْمُلْكِ وَعَلَّمْتَنِى مِن تَأْوِيلِ ٱلْأَحَادِيثِ ۚ فَاطِرَ ٱلسَّمَـٰوَٰتِ وَٱلْأَرْضِ أَنتَ وَلِىِّۦ فِى ٱلدُّنْيَا وَٱلْـَٔاخِرَةِ ۖ تَوَفَّنِى مُسْلِمًۭا وَأَلْحِقْنِى بِٱلصَّـٰلِحِينَ",
    "interpretation":
        "“My Lord! You have surely granted me authority and taught me the interpretation of dreams. ˹O˺ Originator of the heavens and the earth! You are my Guardian in this world and the Hereafter. Allow me to die as one who submits1 and join me with the righteous.” Quran 12:101"
  },
  {
    "transliteration":
        "Allahumma ij'al awwala yawmina hadha salahan, wa awsatahu falahan, wa akhirahu najahan, wa na'udhu bika min yawmi awwaluhu faza'u, wa awsatuhu jaza'un, wa akhiruhu waja'un.",
    "translation":
        "O Allah, make the beginning of our day righteous, its middle successful, and its end victorious. We seek refuge in You from the distress of its beginning, the anxiety of its middle, and the pain of its end.",
    "dua":
        "اللَّهُمَّ اجْعَلْ أَوَّلَ يَوْمِنا هذَا صَلاحًا، وَأَوْسَطَهُ فَلاحًا، وَآخِرَهُ نَجاحًا، وَنعُوذُ بِكَ مِنْ يَوْم أَوَّلُهُ فَزَعُ، وَأَوْسَطُهُ جَزَعٌ، وَآخِرُهُ وَجَعٌ",
    "quran":
        "إِنَّ ٱللَّهَ يَأْمُرُ بِٱلْعَدْلِ وَٱلْإِحْسَـٰنِ وَإِيتَآئِ ذِى ٱلْقُرْبَىٰ وَيَنْهَىٰ عَنِ ٱلْفَحْشَآءِ وَٱلْمُنكَرِ وَٱلْبَغْىِ ۚ يَعِظُكُمْ لَعَلَّكُمْ تَذَكَّرُونَ",
    "interpretation":
        "Indeed, Allah commands justice, grace, as well as generosity to close relatives. He forbids indecency, wickedness, and aggression. He instructs you so perhaps you will be mindful. Quran 16:90 "
  },
  {
    "transliteration":
        "Allahumma Taqabbal minna siyamana fi ramadan, wa qiyamana wa rukoo'ana wa sujoodana bi Rahmatika Ya Arhamar Rahimeen.",
    "translation":
        "O Allah, accept from us our fasts in Ramadan and our Qiyam (nightly prayers) and our bowing and prostrations by Your grace, O You Who is the Most Gracious.",
    "dua":
        "اللَّهُمَّ تَقَبَّل مِنَّا صِيَامَنَا فِي رَمَضَان وَقِيَامَنا وَ رُكُوعنا وسُجُودنا بِرَحْمَتِكَ يا أَرْحَمَ الرَّاحِمِيْن",
    "quran":
        "وَلَقَدْ كَرَّمْنَا بَنِىٓ ءَادَمَ وَحَمَلْنَـٰهُمْ فِى ٱلْبَرِّ وَٱلْبَحْرِ وَرَزَقْنَـٰهُم مِّنَ ٱلطَّيِّبَـٰتِ وَفَضَّلْنَـٰهُمْ عَلَىٰ كَثِيرٍۢ مِّمَّنْ خَلَقْنَا تَفْضِيلًۭا",
    "interpretation":
        "Indeed, We have dignified the children of Adam, carried them on land and sea, granted them good and lawful provisions, and privileged them far above many of Our creatures. Quran 17:70"
  },
  {
    "transliteration":
        "A'udhu bi kalimaatil-lahit- tammati, min kulli shaitanin wa haammah, wa min kulli 'aynin laammah.",
    "translation":
        "I seek refuge in the Perfect Words of Allah, from every devil and every poisonous pests, and from every evil eye.",
    "dua":
        "أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّةِ مِنْ كُلِّ شَيْطَانٍ وَهَامَّةٍ وَمِنْ كُلِّ عَيْنٍ لاَمَّةٍ",
    "quran":
        "إِنَّ ٱلَّذِينَ ءَامَنُوا۟ وَعَمِلُوا۟ ٱلصَّـٰلِحَـٰتِ سَيَجْعَلُ لَهُمُ ٱلرَّحْمَـٰنُ وُدًّۭا",
    "interpretation":
        "As for those who believe and do good, the Most Compassionate will ˹certainly˺ bless them with ˹genuine˺ love. Quran 19:96"
  },
  {
    "transliteration":
        "Allahumma waffiqni lima tuhibbu wa tarda min al-qawl wal-amal wan-niyyah wal-huda, innaka 'ala kulli shay'in qadeer.",
    "translation":
        "O Allah, grant me success in what You love and are pleased with, of speech, action, intention, and guidance. Surely, You are capable of everything.",
    "dua":
        "اللَّهُمَّ وَفِّقْنِي لِمَا تُحِبُّ وَتَرْضَى مِنَ الْقَوْلِ وَالْعَمَلِ وَالنِّيَّةِ وَالْهُدَى إِنَّكَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ",
    "quran": "وَمَآ أَرْسَلْنَـٰكَ إِلَّا رَحْمَةًۭ لِّلْعَـٰلَمِينَ",
    "interpretation":
        "We have sent you ˹O Prophet˺ only as a mercy for the whole world. Quran 21:107"
  },
  {
    "transliteration":
        "Allāhumma innī a'ūdhu bika an ushrika bika wa anā a'lam, wa astaghfiruka limā lā a'lam.",
    "translation":
        "O Allah, I seek refuge in You lest I associate anything with You knowingly, and I seek Your forgiveness for what I know not.",
    "dua":
        "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ أَنْ أُشْرِكَ بِكَ وَأَنَا أَعْلَمُ، وَأَسْتَغْفِرُكَ لِمَا لا أَعْلَمُ",
    "quran":
        "وَلَقَدْ أَنزَلْنَآ إِلَيْكُمْ ءَايَـٰتٍۢ مُّبَيِّنَـٰتٍۢ وَمَثَلًۭا مِّنَ ٱلَّذِينَ خَلَوْا۟ مِن قَبْلِكُمْ وَمَوْعِظَةًۭ لِّلْمُتَّقِينَ",
    "interpretation":
        "Indeed, We have sent down to you clear revelations, along with examples of those who had gone before you, and a lesson to the God-fearing. Quran 24:34"
  },
  {
    "transliteration":
        "Allahumma inni a'udhu bika min munkaratil-akhlaqi, wal-a'mali, wal- ahwa'i.",
    "translation":
        "O Allah! I seek refuge in You from undesirable manners, deeds, and aspirations.",
    "dua":
        "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِن منْكَرَاتِ الأَخلاقِ، والأعْمَالِ والأَهْواءِ",
    "quran":
        "وَعِبَادُ ٱلرَّحْمَـٰنِ ٱلَّذِينَ يَمْشُونَ عَلَى ٱلْأَرْضِ هَوْنًۭا وَإِذَا خَاطَبَهُمُ ٱلْجَـٰهِلُونَ قَالُوا۟ سَلَـٰمًۭا",
    "interpretation":
        "The ˹true˺ servants of the Most Compassionate are those who walk on the earth humbly, and when the foolish address them ˹improperly˺, they only respond with peace. Quran 25:63"
  },
  {
    "transliteration":
        "Allaahumma innee as-aluka Ridaak wal Jannah wa A'udhu Bika min sakhatik wan-naar.",
    "translation":
        "O Allah, I ask of Your pleasure and for Paradise, and I seek refuge from Your displeasure and from the Hellfire.",
    "dua":
        "اللَّهُمَّ إِنِّي أَسْأَلُكَ رِضَاكَ وَالجَنَّةَ، وَأَعُوذُ بِكَ مِنْ سَخَطِكَ وَالنَّارِ",
    "quran":
        "مَن جَآءَ بِٱلْحَسَنَةِ فَلَهُۥ خَيْرٌۭ مِّنْهَا وَهُم مِّن فَزَعٍۢ يَوْمَئِذٍ ءَامِنُونَ",
    "interpretation":
        "Whoever comes with a good deed will be rewarded with what is better, and they will be secure from the horror on that Day. Quran 28:89"
  },
  {
    "transliteration":
        "Rabbanaghfirli wali waalidayyah wa lil mumineena yawmah yaqoomul hisaab.",
    "translation":
        "Our Lord! Forgive me, my parents, and the believers on the Day when the judgment will come to pass.",
    "dua":
        "رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ",
    "quran":
        "ٱتْلُ مَآ أُوحِىَ إِلَيْكَ مِنَ ٱلْكِتَـٰبِ وَأَقِمِ ٱلصَّلَوٰةَ ۖ إِنَّ ٱلصَّلَوٰةَ تَنْهَىٰ عَنِ ٱلْفَحْشَآءِ وَٱلْمُنكَرِ ۗ وَلَذِكْرُ ٱللَّهِ أَكْبَرُ ۗ وَٱللَّهُ يَعْلَمُ مَا تَصْنَعُونَ",
    "interpretation":
        "Recite what has been revealed to you of the Book and establish prayer. Indeed, ˹genuine˺ prayer should deter ˹one˺ from indecency and wickedness. The remembrance of Allah is ˹an˺ even greater ˹deterrent˺. And Allah ˹fully˺ knows what you ˹all˺ do. Quran 29:45"
  },
  {
    "transliteration":
        "Allāhumma innā naʿūdhu bika min fitnati-l-qawli kamā naʿūdhu bika min fitnati-l-ʿamali, wa-naʿūdhu bika min at-takallufi limā lā nuḥsin kamā naʿūdhu bika min al-ʿujbi bimā nuḥsin.",
    "translation":
        "O Allah, we seek refuge in You from the temptation of words as we seek refuge from the temptation of deeds. And we seek refuge from taking up what we are not good at as we seek refuge from being arrogant of what we are good at.",
    "dua":
        "اللَّهُمَّ إِنَّا نَعُوذُ بِكَ مِن فِتْنَةِ القَوْلِ كَمَا نَعُوذُ بِكَ مِن فِتْنَةِ العَمَلِ، وَنَعُوذُ بِكَ مِنَ التَّكَلُّفِ لِمَا لَا نُحْسِنُ كَمَا نَعُوذُ بِكَ مِنَ العُجْبِ بِمَا نُحْسِنُ",
    "quran":
        "إِنَّ ٱللَّهَ وَمَلَـٰٓئِكَتَهُۥ يُصَلُّونَ عَلَى ٱلنَّبِىِّ ۚ يَـٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا۟ صَلُّوا۟ عَلَيْهِ وَسَلِّمُوا۟ تَسْلِيمًا",
    "interpretation":
        "Indeed, Allah showers His blessings upon the Prophet, and His angels pray for him. O  believers! Invoke Allah's blessings upon him, and salute him with worthy greetings of peace. Quran 33:56"
  },
  {
    "transliteration":
        "Allahumma anta waliyi fid-dunya wal akhirah. Tawaffanee musliman wa alhiqnee bis-saaliheen.",
    "translation":
        "O' Allah, You are my Protector in this world and in the Hereafter. Cause me to die a Muslim and join me with the righteous.",
    "dua":
        "اللهم أَنْتَ وَلِيِّي فِي الدُّنْيَا وَالْآخِرَةِ ۖ تَوَفَّنِي مُسْلِمًا وَأَلْحِقْنِي بِالصَّالِحِينَ",
    "quran":
        "كِتَـٰبٌ أَنزَلْنَـٰهُ إِلَيْكَ مُبَـٰرَكٌۭ لِّيَدَّبَّرُوٓا۟ ءَايَـٰتِهِۦ وَلِيَتَذَكَّرَ أُو۟لُوا۟ ٱلْأَلْبَـٰبِ",
    "interpretation":
        "˹This is˺ a blessed Book which We have revealed to you ˹O Prophet˺ so that they may contemplate its verses, and people of reason may be mindful. Quran 38:29"
  },
  {
    "transliteration":
        "Allahumma usturna fawqa al-ard, wa tahta al-ard, wa yawm al-'ardhi 'alayk.",
    "translation":
        "O Allah, conceal (our faults and shortcomings) & protect us while we are on Earth & when we are beneath the Earth & on the Day our deeds are presented to You.",
    "dua":
        "اللَّهُمَّ اسْتُرْنَا فَوْقَ الأرض، وَتَحْتَ الأرض، وَيَوْمَ الْعَرْضِ عَلَيْكَ",
    "quran":
        "وَلَا تَسْتَوِى ٱلْحَسَنَةُ وَلَا ٱلسَّيِّئَةُ ۚ ٱدْفَعْ بِٱلَّتِى هِىَ أَحْسَنُ فَإِذَا ٱلَّذِى بَيْنَكَ وَبَيْنَهُۥ عَدَٰوَةٌۭ كَأَنَّهُۥ وَلِىٌّ حَمِيمٌۭ",
    "interpretation":
        "Good and evil cannot be equal. Respond ˹to evil˺ with what is best, then the one you are in a feud with will be like a close friend. Quran 41:34"
  },
  {
    "transliteration":
        "Allahumma inni as'aluka elman naafi'an, wa rizqan waasi'an tayyiban, wa 'amalan mutaqabbalan.",
    "translation":
        "O Allah, I ask You for beneficial knowledge, abundant and pure sustenance, and accepted deeds.",
    "dua":
        "اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا وَاسِعًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا",
    "quran":
        "إِنَّآ أَنزَلْنَـٰهُ فِى لَيْلَةٍۢ مُّبَـٰرَكَةٍ ۚ إِنَّا كُنَّا مُنذِرِينَ",
    "interpretation":
        "Indeed, We sent it [the Quran] down on a blessed night, for We always warn ˹against evil˺. Quran 44:3"
  },
  {
    "transliteration":
        "Allahumma Alimna ma yanfa unii, wan fa'ana bimaa allamtana warzuqna fahman wal ikhlas.",
    "translation":
        "O Allah, teach us what benefits us, and benefit us with what You have taught us, and grant us understanding and sincerity.",
    "dua":
        "اللَّهُمَّ عَلِّمْنَا مَا يَنْفَعُنَا، وَانْفَعْنَا بِمَا عَلَّمْتَنَا، وَارْزُقْنَا فَهْمًا وَالإِخْلَاصَ",
    "quran":
        "يَـٰٓأَيُّهَا ٱلنَّاسُ إِنَّا خَلَقْنَـٰكُم مِّن ذَكَرٍۢ وَأُنثَىٰ وَجَعَلْنَـٰكُمْ شُعُوبًۭا وَقَبَآئِلَ لِتَعَارَفُوٓا۟ ۚ إِنَّ أَكْرَمَكُمْ عِندَ ٱللَّهِ أَتْقَىٰكُمْ ۚ إِنَّ ٱللَّهَ عَلِيمٌ خَبِيرٌۭ",
    "interpretation":
        "O humanity! Indeed, We created you from a male and a female, and made you into peoples and tribes so that you may ˹get to˺ know one another. Surely the most noble of you in the sight of Allah is the most righteous among you. Allah is truly All-Knowing, All-Aware. Quran 49:13"
  },
  {
    "transliteration": "Allahumma aslih niyyatina wa dhuriyyaatinaa.",
    "translation": "O Allah, rectify our intentions and our offspring.",
    "dua": "اللَّهُمَّ أَصْلِحْ نِيَّاتِنَا وَذُرِّيَّاتِنَا",
    "quran":
        "يَوْمَ تَرَى ٱلْمُؤْمِنِينَ وَٱلْمُؤْمِنَـٰتِ يَسْعَىٰ نُورُهُم بَيْنَ أَيْدِيهِمْ وَبِأَيْمَـٰنِهِم بُشْرَىٰكُمُ ٱلْيَوْمَ جَنَّـٰتٌۭ تَجْرِى مِن تَحْتِهَا ٱلْأَنْهَـٰرُ خَـٰلِدِينَ فِيهَا ۚ ذَٰلِكَ هُوَ ٱلْفَوْزُ ٱلْعَظِيمُ",
    "interpretation":
        "On that Day you will see believing men and women with their light shining ahead of them and on their right. ˹They will be told,˺ “Today you have good news of Gardens, under which rivers flow, ˹for you˺ to stay in forever. This is ˹truly˺ the ultimate triumph.” Quran 57:12"
  },
  {
    "transliteration":
        "Allāhumma innā nas'aluka fi'lal-khayrāt, wa tarkal-munkarāt, wa ḥubba al-masākīn.",
    "translation":
        "O Allah, we ask You for the ability to do good deeds, to abstain from evil, and to love the poor.",
    "dua":
        "اللَّهُمَّ إِنَّا نَسْأَلُكَ فِعْلَ الْخَيْرَاتِ، وَتَرْكَ الْمُنْكَرَاتِ، وَحُبَّ الْمَسَاكِينِ",
    "quran":
        "رَبَّنَا لَا تَجْعَلْنَا فِتْنَةًۭ لِّلَّذِينَ كَفَرُوا۟ وَٱغْفِرْ لَنَا رَبَّنَآ ۖ إِنَّكَ أَنتَ ٱلْعَزِيزُ ٱلْحَكِيمُ",
    "interpretation":
        "Our Lord! Do not subject us to the persecution of the disbelievers. Forgive us, our Lord! You ˹alone˺ are truly the Almighty, All-Wise.” Quran 60:5"
  },
  {
    "transliteration":
        "Allahumma inna nas'aluka husnal khaatimah, wa nauthbika min su'il khaatimah.",
    "translation":
        "O Allah, we ask You for a good ending, and we seek refuge in You from a bad ending.",
    "dua":
        "اللَّهُمَّ إِنَّا نَسْأَلُكَ حُسْنَ الْخَاتِمَةِ، وَنَعُوذُ بِكَ مِنْ سُوءِ الْخَاتِمَةِ",
    "quran": "فَقُلْتُ ٱسْتَغْفِرُوا۟ رَبَّكُمْ إِنَّهُۥ كَانَ غَفَّارًۭا",
    "interpretation":
        "I said (to them): Ask forgiveness from your Lord, ˹for˺ He is truly Most Forgiving. Quran 71:10"
  }
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
