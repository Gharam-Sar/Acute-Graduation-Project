import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> create_meal1_notification(String t, int d) async {
  List time = t.split(":");
  print(DateTime.now().hour);
  print(time[0]);
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'meal1_timer',
      title:
          '${Emojis.food_croissant + Emojis.food_blueberries} Meal 1 reminder',
      body:
          'Don\'t forget to eat your meal${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_meal2_notification(String t, int d) async {
  List time = t.split(":");
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 2,
      channelKey: 'meal2_timer',
      title: '${Emojis.food_hamburger + Emojis.food_olive}Meal 2 reminder',
      body:
          'Don\'t forget to eat your meal${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_meal3_notification(String t, int d) async {
  List time = t.split(":");
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 3,
      channelKey: 'meal3_timer',
      title: '${Emojis.food_strawberry + Emojis.food_ice_cream}Meal3 reminder',
      body:
          'Don\'t forget to eat your meal${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_meal4_notification(String t, int d) async {
  List time = t.split(":");
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 4,
      channelKey: 'meal4_timer',
      title: '${Emojis.food_sandwich + Emojis.food_cut_of_meat}Meal4 reminder',
      body:
          'Don\'t forget to eat your meal${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_meal5_notification(String t, int d) async {
  List time = t.split(":");
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 5,
      channelKey: 'meal5_timer',
      title:
          '${Emojis.food_green_salad + Emojis.food_french_fries}Meal5 reminder',
      body:
          'Don\'t forget to eat your meal${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass1_notification(String t, int d) async {
  List time = t.split(":");

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 6,
      channelKey: 'water1_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass2_notification(String t, int d) async {
  List time = t.split(":");

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 7,
      channelKey: 'water2_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass3_notification(String t, int d) async {
  List time = t.split(":");

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 8,
      channelKey: 'water3_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass4_notification(String t, int d) async {
  List time = t.split(":");
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 9,
      channelKey: 'water4_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass5_notification(String t, int d) async {
  List time = t.split(":");

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 10,
      channelKey: 'water5_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass6_notification(String t, int d) async {
  List time = t.split(":");

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 11,
      channelKey: 'water6_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass7_notification(String t, int d) async {
  List time = t.split(":");

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 12,
      channelKey: 'water7_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass8_notification(String t, int d) async {
  List time = t.split(":");

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 13,
      channelKey: 'water8_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass9_notification(String t, int d) async {
  List time = t.split(":");

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 14,
      channelKey: 'water9_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass10_notification(String t, int d) async {
  List time = t.split(":");

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 15,
      channelKey: 'water10_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass11_notification(String t, int d) async {
  List time = t.split(":");
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 16,
      channelKey: 'water11_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass12_notification(String t, int d) async {
  List time = t.split(":");

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 17,
      channelKey: 'water12_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass13_notification(String t, int d) async {
  List time = t.split(":");

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 18,
      channelKey: 'water13_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_glass14_notification(String t, int d) async {
  List time = t.split(":");

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 19,
      channelKey: 'water14_timer',
      title: '${Emojis.wheater_droplet}Water reminder',
      body: 'Don\'t forget to drink water!${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: int.parse(time[0]),
      minute: int.parse(time[1]),
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_calorie_notification(int d) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 20,
      channelKey: 'calorie',
      title: '${Emojis.symbols_warning}Calorie Warning',
      body:
          'Your intake of calories is higher than it should be! ${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: DateTime.now().hour,
      minute: DateTime.now().minute + 1,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_dis_notification(int d) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 21,
      channelKey: 'Health',
      title: '${Emojis.symbols_warning} Health Alert',
      body:
          'Please don\'t consume anything else with cholestrol,you have reached your limit! ${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: DateTime.now().hour,
      minute: DateTime.now().minute + 1,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_dis2_notification(int d) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 22,
      channelKey: 'Health2',
      title: '${Emojis.symbols_warning} Health Alert',
      body:
          'Please don\'t consume anything else with protein,you have reached your limit! ${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: DateTime.now().hour,
      minute: DateTime.now().minute + 1,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_dis3_notification(int d) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 23,
      channelKey: 'Health3',
      title: '${Emojis.symbols_warning} Health Alert',
      body:
          'Please don\'t consume anything else with sugar,you have reached your limit! ${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: DateTime.now().hour,
      minute: DateTime.now().minute + 1,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}

Future<void> create_dis4_notification(int d) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 24,
      channelKey: 'Health4',
      title: '${Emojis.symbols_warning} Health Alert',
      body:
          'Please don\'t consume anything else with sodium,you have reached your limit! ${Emojis.smile_face_with_open_mouth}',
      notificationLayout: NotificationLayout.Default,
      wakeUpScreen: true,
    ),
    schedule: NotificationCalendar(
      weekday: d,
      hour: DateTime.now().hour,
      minute: DateTime.now().minute + 1,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}
