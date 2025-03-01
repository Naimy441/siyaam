import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'chapter.dart';
import 'constants.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  ReminderScreenState createState() => ReminderScreenState();
}

class ReminderScreenState extends State<ReminderScreen>
    with SingleTickerProviderStateMixin {
  TimeOfDay _selectedTime =
      const TimeOfDay(hour: 8, minute: 0); // Default: 8:00 AM
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late AnimationController _controller;

final List<int> _allowedHours = List.generate(18, (index) => index); // 12 AM to 5 PM

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _loadNotificationTime();
    tz.initializeTimeZones();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final InitializationSettings settings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);

    await _notificationsPlugin.initialize(settings);
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS) {
      final iosNotificationsPlugin =
          _notificationsPlugin.resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>();
      await iosNotificationsPlugin?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  Future<void> _loadNotificationTime() async {
    final prefs = await SharedPreferences.getInstance();
    int? hour = prefs.getInt('notification_hour');
    int? minute = prefs.getInt('notification_minute');
    if (hour != null && minute != null) {
      setState(() {
        _selectedTime = TimeOfDay(hour: hour, minute: minute);
      });
    }
  }

  Future<void> _saveNotificationTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('notification_hour', _selectedTime.hour);
    await prefs.setInt('notification_minute', _selectedTime.minute);
    await _scheduleDailyNotification();
  }

  int getDay() {
    final DateTime now = DateTime.now();
    final DateTime startDate = DateTime(2025, 3, 1);
    final int difference = now.difference(startDate).inDays;
    return difference + 1; // Add 1 to include the starting day
  }

  Future<void> _scheduleDailyNotification() async {
    await _requestPermissions(); // Request permissions before scheduling

    final now = tz.TZDateTime.now(tz.local);
    // List<PendingNotificationRequest> pendingNotifications = [];

    for (int i = 0; i < 31 - getDay(); i++) {
      final notificationTime = tz.TZDateTime(
        tz.local,
        now.year,
        now.month,
        now.day,
        _selectedTime.hour,
        _selectedTime.minute,
      ).add(Duration(days: i)); // Ensures proper month/year transitions

      // Ensure notifications list exists
      final String notificationMessage =
          notifications[i % notifications.length];

      // Log scheduling request
      // print(
      //     "Requesting Notification $i -> Expected Date: ${notificationTime.toLocal()} | Message: \"$notificationMessage\"");

      await _notificationsPlugin.zonedSchedule(
        i, // Unique ID for each notification
        'Daily Quest Reminder',
        notificationMessage, // Get message from list
        notificationTime,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'daily_reminder_channel',
            'Daily Reminders',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }

    // Retrieve the actual scheduled notifications
    // await Future.delayed(
    //     Duration(seconds: 2)); // Small delay to ensure scheduling is processed
    // pendingNotifications =
    //     await _notificationsPlugin.pendingNotificationRequests();

    // print("\n--- Confirmed Scheduled Notifications ---");
    // for (var notification in pendingNotifications) {
    //   print(
    //       "ID: ${notification.id} | Title: ${notification.title} | Body: ${notification.body}");
    // }
  }

  void _confirmNotification() async {
    await _saveNotificationTime();
    _navigateToChapter1();
  }

  void _skipNotification() {
    _navigateToChapter1();
  }

  void _navigateToChapter1() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ChapterScreen(chapterNumber: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 134, 211, 250),
                  Color.fromARGB(255, 203, 121, 248)
                ],
              ),
            ),
          ),

          Center(
            child: FadeTransition(
              opacity: _controller,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Set Your Daily Reminder ⏰",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Reminder selection
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
  height: 150, // Adjust height for better UX
  child: CupertinoPicker(
    scrollController: FixedExtentScrollController(
      initialItem: _selectedTime.hour,
    ),
    itemExtent: 40, // Height of each item
    backgroundColor: Colors.transparent,
    onSelectedItemChanged: (index) {
      setState(() {
        _selectedTime = TimeOfDay(hour: _allowedHours[index], minute: 0);
      });
    },
    children: _allowedHours.map((hour) {
      return Center(
        child: Text(
          TimeOfDay(hour: hour, minute: 0).format(context),
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
      );
    }).toList(),
  ),
),
                    ),
                    const SizedBox(height: 40),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _skipNotification,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            backgroundColor: Colors.green.shade600,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _confirmNotification,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            backgroundColor: Colors.blue.shade600,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "✅ Confirm",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
