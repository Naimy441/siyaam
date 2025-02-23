
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
  "A blessed day await    `s! But hey, no pressure, right? Complete today's task!", 
  "Don't miss out on today's rewards! Or do… but don't blame us later. A small deed goes a long way!", 
  "Jannah is within reach! Unlike your phone when you conveniently “forget” to check the app… Take action today!"
];

final List<Map<String, String>> quranAndDuaList = [
{
        "transliteration": "Allahumma Ijal 'Amalee kullahou saulihaa, waj'alhu li-Wajhika khaalisan, wa la taj'al li-ahadin feehi shay'an.",
        "translation": "O Allah, make all my work righteous, and make it purely for seeking Your Face, and do not make anything in it for someone (other than You).",
        "dua": "اللَّهُمَّ اجْعَلْ عَمَلِي كُلَّهُ صَالِحًا، وَاجْعَلْهُ لِوَجْهِكَ خَالِصًا، وَلَا تَجْعَلْ لِأَحَدٍ فِيهِ شَيْئًا"
    },
    {
        "transliteration": "Allahumma Ya Muqallib al Quloob thabbit Qulūbana 'alaa Deenik. Wa Ya Musarrifal-Qulūbi Sarrif Qulūbana 'alā Tā'atika.",
        "translation": "O Changer of the hearts, make our heart firm upon Your Religion. O Controller of the hearts, direct our hearts to Your obedience.",
        "dua": "اللَّهُمَّ يا مُقَلِّبَ القُلُوبِ ثَبِّتْ قُلُوبَنَا على دِيْنِكَ، ويا مُصَرِّفَ القُلُوبِ صَرِّفْ قُلُوْبَنَا على طَاعَتِك"
    },
    {
        "transliteration": "Allahumma tahhir qalbi minan nifaq, wa 'amali minar riya, wa lisani minal kadhib, wa 'ayni minal khiyana. Fa inaka t'alamu khainatal a'ayuni wa ma tukhfis sudur.",
        "translation": "O Allah, purify my heart from hypocrisy, my actions from showing off, my tongue from lies, and my eyes from deception (evil glances). For surely, You are fully aware of the deception of the eyes and all that the chest conceals.",
        "dua": "اللَّهُمَّ طَهِّرْ قَلْبِي مِنَ النِّفَاقِ وَعَمَلِي مِنَ الرِّيَاءِ وَلِسَانِي مِنَ الْكَذِبِ وَعَيْنِي مِنَ الْخِيَانَةِ، فَإِنَّكَ تَعْلَمُ خَائِنَةَ الأَعْيُنِ وَمَا تُخْفِي الصُّدُورُ"
    },
    {
        "transliteration": "Allahumma inni as'aluka 'Ilman naafi'an, wa rizqan tayyiban, wa 'amalan mutaqabbalan.",
        "translation": "O Allah! I ask You for knowledge that is of benefit, a good provision and deeds that will be accepted.",
        "dua": "اَللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَ رِزْقًا طَيَّبًا، وَعَمَلاً مُتَقَبَّلاً"
    },
    {
        "transliteration": "Allahumma inni as'alukal-huda, wat-tuqa, wal-'afafa, wal-ghina.",
        "translation": "O Allah! I beseech You for guidance, piety, chastity, and contentment.",
        "dua": "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْهُدَى وَالتُّقَى وَالْعَفَافَ وَالْغِنَى"
    },
    {
        "transliteration": "Allahumma, 'aati nafsi taqwaaha, wa zakkihaa Anta khairu man zakkaahaa, Anta waliyyuhaa wa maulaaha.",
        "translation": "O Allah! Grant my soul its piety and purify it, for You are the Best to purify it. You are its Protector and Guardian.",
        "dua": "اللَّهُمَّ آتِ نَفْسِي تَقْوَاهَا وَزَكِّهَا أَنْتَ خَيْرُ مَنْ زَكَّاهَا أَنْتَ وَلِيُّهَا وَمَوْلَاهَا"
    },
    {
        "transliteration": "Allahumma ihdinaa, wahdi binaa, waj 'alnaa sababan limanihtadaa.",
        "translation": "O Allah! Guide us, guide others through us, and make us a means/cause for all those who are rightly guided.",
        "dua": "اللَّهُمَّ اهْدِناَ واهْدِ بِناَ واجْعَلناَ سَبَباً لِمَنِ اهتَدى"
    },
    {
        "transliteration": "Allahumma 'afini fi badani, Allahumma afini fi sam'i, Allahumma 'afini fi basari, Allahumma inni a'udhu bika min al-kufri wa-l-faqr, Allahumma inni a'udhu bika min 'adhabi-l-qabr, la 'ilahi illa Ant.",
        "translation": "O Allah, give me health in my body, O Allah, give me health in my hearing, Allah, give me health in my sight. O Allah, I seek your protection in You from disbelief and poverty. O Allah, I seek protection in You from punishment in the grave. There is no god but You.",
        "dua": "اَللَّهُمَّ عَافِنِي فِي بَدَنِي، اَللَّهُمَّ عَافِنِي فِي سَمْعِي، اَللَّهُمَّ عَافِنِي فِي بَصَرِي، اَللَّهُمَ إنِّي أَعُوذَ بِكَ مِنْ الكُفْرِ وَالفَقْرِ، اَللَّهُمَ إنِّي أَعُوذَ بِكَ مِنْ عَذَابِ القَبْرِ، لَآ إِلَهَ إِلَّا أَنْتَ"
    },
    {
        "transliteration": "Allahumma inni as`aluka hubbaka wa hubba man yuhibbuka wal amalal ladzi yuballighuni hubbaka. Allahumaj 'al hubbaka ahabba ilayya min nafsi wa ahli wa minal ma'il barid.",
        "translation": "Oh Allah, I ask You for Your love and the love of those who love You, and I ask You for the actions that will lead me to Your love. Oh Allah make Your love more beloved to me than myself, my family, and the cold water.",
        "dua": "اللَّهُمَّ إِنِّي أَسْأَلُكَ حُبَّكَ وَحُبَّ مَنْ يُحِبُّكَ وَالْعَمَلَ الَّذِيْ يُبَلِّغُنِي حُبَّكَ اللَّهُمَّ اجْعَلْ حُبَّكَ أََحَبَّ إِلَيَّ مِنْ نَفْسِيْ وَأَهْلِيْ وَمِنَ الْمَاءِ الْبَارِدِ"
    },
    {
        "transliteration": "Rabbana hablana min azwajina wadhurriyyatina qurrata a'yunin wajaalna lilmuttaqeena imamaa.",
        "translation": "Our Lord! Bless us with ˹pious˺ spouses and offspring who will be the joy of our hearts, and make us models for the righteous.",
        "dua": "رَبَّنَا هَبْ لَنَا مِنْ أَزْوَٰجِنَا وَذُرِّيَّـٰتِنَا قُرَّةَ أَعْيُنٍۢ وَٱجْعَلْنَا لِلْمُتَّقِينَ إِمَامًا"
    },
    {
        "transliteration": "Rabbana atina fid dunya hasanatan wa fil Aakhirati hasanatan waqina 'adhaban-nar.",
        "translation": "Our Lord, give us in this world [that which is] good and in the Hereafter [that which is] good and protect us from the punishment of the Fire.",
        "dua": "رَبَّنَآ ءَاتِنَا فِى ٱلدُّنْيَا حَسَنَةًۭ وَفِى ٱلـَٔاخِرَةِ حَسَنَةًۭ وَقِنَا عَذَابَ ٱلنَّارِ"
    },
    {
        "transliteration": "Allahumma Ya Mua'allima Adama wa Ibraahima 'Allimnaa. Wa Ya Mufah-hima Sulayman Fah-himnaa.",
        "translation": "O Allah, O the One Who taught Adam and Abraham, teach us. O the One Who granted Solomon understanding, grant us understanding.",
        "dua": "اللهمّ يا مُعَلِّم آدم و إبراهيم، عَلِّمْنَا، ويا مُفَهِّم سُلَيْمَان، فهمنا"
    },
    {
        "transliteration": "Allahumma ij'alna min ahlil-Qur'ani alladhīna hum ahluka wa khāṣṣataka, bi-raḥmatika yā arḥama ar-rāḥimīn.",
        "translation": "O Allah! Make us among the people of the Quran who are Your special people, by Your mercy, O Most Merciful of the Merciful.",
        "dua": "اللَّهُمَّ اجْعَلْنَا مِنْ أَهْلِ الْقُرْآنِ الَّذِينَ هُمْ أَهْلُكَ وَخَاصَّتَكَ بِرَحْمَتِكَ يَا أَرْحَمَ الرَّاحِمِينَ"
    },
    {
        "transliteration": "Yā ḥayyu yā qayyūmu bi-raḥmatika astaghīthu aṣliḥ lī sha'nī kullahu walā takilnī ilā nafsī ṭarfata 'aynin.",
        "translation": "O Ever Living One, O Sustainer of all, by Your mercy I call on You to set right all my affairs. Do not place me in charge of my soul even for the blinking of an eye.",
        "dua": "يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ أَصْلِحْ لِي شَأْنِي كُلَّهُ وَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ"
    },
    {
        "transliteration": "Allahumma ij'al awwala yawmina hadha salahan, wa awsatahu falahan, wa akhirahu najahan, wa na'udhu bika min yawmi awwaluhu faza'u, wa awsatuhu jaza'un, wa akhiruhu waja'un.",
        "translation": "O Allah, make the beginning of our day righteous, its middle successful, and its end victorious. We seek refuge in You from the distress of its beginning, the anxiety of its middle, and the pain of its end.",
        "dua": "اللَّهُمَّ اجْعَلْ أَوَّلَ يَوْمِنا هذَا صَلاحًا، وَأَوْسَطَهُ فَلاحًا، وَآخِرَهُ نَجاحًا، وَنعُوذُ بِكَ مِنْ يَوْم أَوَّلُهُ فَزَعُ، وَأَوْسَطُهُ جَزَعٌ، وَآخِرُهُ وَجَعٌ"
    },
    {
        "transliteration": "Allahumma Taqabbal minna siyamana fi ramadan, wa qiyamana wa rukoo'ana wa sujoodana bi Rahmatika Ya Arhamar Rahimeen.",
        "translation": "O Allah, accept from us our fasts in Ramadan and our Qiyam (nightly prayers) and our bowing and prostrations by Your grace, O You Who is the Most Gracious.",
        "dua": "اللَّهُمَّ تَقَبَّل مِنَّا صِيَامَنَا فِي رَمَضَان وَقِيَامَنا وَ رُكُوعنا وسُجُودنا بِرَحْمَتِكَ يا أَرْحَمَ الرَّاحِمِيْن"
    },
    {
        "transliteration": "A'udhu bi kalimaatil-lahit- tammati, min kulli shaitanin wa haammah, wa min kulli 'aynin laammah.",
        "translation": "I seek refuge in the Perfect Words of Allah, from every devil and every poisonous pests, and from every evil eye.",
        "dua": "أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّةِ مِنْ كُلِّ شَيْطَانٍ وَهَامَّةٍ وَمِنْ كُلِّ عَيْنٍ لاَمَّةٍ"
    },
    {
        "transliteration": "Allahumma waffiqni lima tuhibbu wa tarda min al-qawl wal-amal wan-niyyah wal-huda, innaka 'ala kulli shay'in qadeer.",
        "translation": "O Allah, grant me success in what You love and are pleased with, of speech, action, intention, and guidance. Surely, You are capable of everything.",
        "dua": "اللَّهُمَّ وَفِّقْنِي لِمَا تُحِبُّ وَتَرْضَى مِنَ الْقَوْلِ وَالْعَمَلِ وَالنِّيَّةِ وَالْهُدَى إِنَّكَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ"
    },
    {
        "transliteration": "Allāhumma innī a'ūdhu bika an ushrika bika wa anā a'lam, wa astaghfiruka limā lā a'lam.",
        "translation": "O Allah, I seek refuge in You lest I associate anything with You knowingly, and I seek Your forgiveness for what I know not.",
        "dua": "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ أَنْ أُشْرِكَ بِكَ وَأَنَا أَعْلَمُ، وَأَسْتَغْفِرُكَ لِمَا لا أَعْلَمُ"
    },
    {
        "transliteration": "Allahumma inni a'udhu bika min munkaratil-akhlaqi, wal-a'mali, wal- ahwa'i.",
        "translation": "O Allah! I seek refuge in You from undesirable manners, deeds, and aspirations.",
        "dua": "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِن منْكَرَاتِ الأَخلاقِ، والأعْمَالِ والأَهْواءِ"
    },
    {
        "transliteration": "Allaahumma innee as-aluka Ridaak wal Jannah wa A'udhu Bika min sakhatik wan-naar.",
        "translation": "O Allah, I ask of Your pleasure and for Paradise, and I seek refuge from Your displeasure and from the Hellfire.",
        "dua": "اللَّهُمَّ إِنِّي أَسْأَلُكَ رِضَاكَ وَالجَنَّةَ، وَأَعُوذُ بِكَ مِنْ سَخَطِكَ وَالنَّارِ"
    },
    {
        "transliteration": "Rabbanaghfirli wali waalidayyah wa lil mumineena yawmah yaqoomul hisaab.",
        "translation": "Our Lord! Forgive me, my parents, and the believers on the Day when the judgment will come to pass.",
        "dua": "رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ"
    },
    {
        "transliteration": "Allāhumma innā naʿūdhu bika min fitnati-l-qawli kamā naʿūdhu bika min fitnati-l-ʿamali, wa-naʿūdhu bika min at-takallufi limā lā nuḥsin kamā naʿūdhu bika min al-ʿujbi bimā nuḥsin.",
        "translation": "O Allah, we seek refuge in You from the temptation of words as we seek refuge from the temptation of deeds. And we seek refuge from taking up what we are not good at as we seek refuge from being arrogant of what we are good at.",
        "dua": "اللَّهُمَّ إِنَّا نَعُوذُ بِكَ مِن فِتْنَةِ القَوْلِ كَمَا نَعُوذُ بِكَ مِن فِتْنَةِ العَمَلِ، وَنَعُوذُ بِكَ مِنَ التَّكَلُّفِ لِمَا لَا نُحْسِنُ كَمَا نَعُوذُ بِكَ مِنَ العُجْبِ بِمَا نُحْسِنُ"
    },
    {
        "transliteration": "Allahumma anta waliyi fid-dunya wal akhirah. Tawaffanee musliman wa alhiqnee bis-saaliheen.",
        "translation": "O' Allah, You are my Protector in this world and in the Hereafter. Cause me to die a Muslim and join me with the righteous.",
        "dua": "اللهم أَنْتَ وَلِيِّي فِي الدُّنْيَا وَالْآخِرَةِ ۖ تَوَفَّنِي مُسْلِمًا وَأَلْحِقْنِي بِالصَّالِحِينَ"
    },
    {
        "transliteration": "Allahumma usturna fawqa al-ard, wa tahta al-ard, wa yawm al-'ardhi 'alayk.",
        "translation": "O Allah, conceal (our faults and shortcomings) & protect us while we are on Earth & when we are beneath the Earth & on the Day our deeds are presented to You.",
        "dua": "اللَّهُمَّ اسْتُرْنَا فَوْقَ الأرض، وَتَحْتَ الأرض، وَيَوْمَ الْعَرْضِ عَلَيْكَ"
    },
    {
        "transliteration": "Allahumma inni as'aluka elman naafi'an, wa rizqan waasi'an tayyiban, wa 'amalan mutaqabbalan.",
        "translation": "O Allah, I ask You for beneficial knowledge, abundant and pure sustenance, and accepted deeds.",
        "dua": "اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا وَاسِعًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا"
    },
    {
        "transliteration": "Allahumma Alimna ma yanfa unii, wan fa'ana bimaa allamtana warzuqna fahman wal ikhlas.",
        "translation": "O Allah, teach us what benefits us, and benefit us with what You have taught us, and grant us understanding and sincerity.",
        "dua": "اللَّهُمَّ عَلِّمْنَا مَا يَنْفَعُنَا، وَانْفَعْنَا بِمَا عَلَّمْتَنَا، وَارْزُقْنَا فَهْمًا وَالإِخْلَاصَ"
    },
    {
        "transliteration": "Allahumma aslih niyyatina wa dhuriyyaatinaa.",
        "translation": "O Allah, rectify our intentions and our offspring.",
        "dua": "اللَّهُمَّ أَصْلِحْ نِيَّاتِنَا وَذُرِّيَّاتِنَا"
    },
    {
        "transliteration": "Allāhumma innā nas'aluka fi'lal-khayrāt, wa tarkal-munkarāt, wa ḥubba al-masākīn.",
        "translation": "O Allah, we ask You for the ability to do good deeds, to abstain from evil, and to love the poor.",
        "dua": "اللَّهُمَّ إِنَّا نَسْأَلُكَ فِعْلَ الْخَيْرَاتِ، وَتَرْكَ الْمُنْكَرَاتِ، وَحُبَّ الْمَسَاكِينِ"
    },
    {
        "transliteration": "Allahumma inna nas'aluka husnal khaatimah, wa nauthbika min su'il khaatimah.",
        "translation": "O Allah, we ask You for a good ending, and we seek refuge in You from a bad ending.",
        "dua": "اللَّهُمَّ إِنَّا نَسْأَلُكَ حُسْنَ الْخَاتِمَةِ، وَنَعُوذُ بِكَ مِنْ سُوءِ الْخَاتِمَةِ"
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
