import 'dart:io';

import 'app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'introduction_screen/introduction_animation_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize('resource://drawable/logonavy', [
    NotificationChannel(
      channelKey: 'meal1_timer',
      channelName: 'Meal1 notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      playSound: true,
      channelShowBadge: true,
    ),
    NotificationChannel(
        channelKey: 'meal2_timer',
        channelName: 'Meal2 notification',
        channelDescription: 'Notification channel for basic tests',
        locked: true,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        ledColor: Colors.white),
    NotificationChannel(
        channelKey: 'meal3_timer',
        channelName: 'Meal3 notification',
        channelDescription: 'Notification channel for basic tests',
        locked: true,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        ledColor: Colors.white),
    NotificationChannel(
        channelKey: 'meal4_timer',
        channelName: 'Meal4 notification',
        channelDescription: 'Notification channel for basic tests',
        locked: true,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        ledColor: Colors.white),
    NotificationChannel(
        channelKey: 'meal5_timer',
        channelName: 'Meal5 notification',
        channelDescription: 'Notification channel for basic tests',
        locked: true,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        ledColor: Colors.white),
    NotificationChannel(
      channelKey: 'water1_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water2_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water3_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water4_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water5_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water6_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water7_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water8_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water9_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water10_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water11_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water12_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water13_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'water14_timer',
      channelName: 'Water notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'calorie',
      channelName: 'Claorie notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'Health',
      channelName: 'Health notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'Health2',
      channelName: 'Health notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'Health3',
      channelName: 'Health notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
    NotificationChannel(
      channelKey: 'Health4',
      channelName: 'Health notification',
      channelDescription: 'Notification channel for basic tests',
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    ),
  ]);

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home: IntroductionAnimationScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
