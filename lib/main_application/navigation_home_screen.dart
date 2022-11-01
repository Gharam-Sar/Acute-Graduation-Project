import 'package:test1/app_theme.dart';
import 'package:test1/main_application/custom_drawer/aboutUs_screen.dart';
import 'package:test1/main_application/custom_drawer/drawer_user_controller.dart';
import 'package:test1/main_application/custom_drawer/feedback_screen.dart';

import 'package:test1/main_application/custom_drawer/home_drawer.dart';
import 'package:test1/main_application/custom_drawer/progress_screen.dart';
import 'package:test1/main_application/custom_drawer/settings_screen.dart';

import 'package:flutter/material.dart';
import '../http.dart';
import '../notification.dart';
import 'home_page/homepage_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  List firstlist;
  List Meals;
  List meal_amount;
  List images;
  NavigationHomeScreen(
      {Key? key,
      required this.firstlist,
      required this.Meals,
      required this.meal_amount,
      required this.images})
      : super(key: key);

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;
  List timers = [];
  List meal_checked = [];
  List w_timers = [];
  List glasses = [];

  get_calorie() async {
    double e = 0;
    double am = 0;
    var res = await http_get("getgoal", {"id": widget.firstlist[0]});
    for (int n = 0; n < widget.Meals.length; n++) {
      List l = widget.Meals[n].split("^");

      double d = double.parse(widget.meal_amount[n]);
      am = (d * double.parse(l[1])) / 100;

      e = e + am;
    }
    DateTime date = DateTime.now();
    print(e);
    if (e > double.parse(res.data)) {
      print("ll");
      create_calorie_notification(date.weekday);
    }
  }

  get_mealstimers() async {
    var result = await http_get("get_timers_meals", {
      "id": widget.firstlist[0],
    });
    if (result.data == "null")
      timers = [];
    else {
      List myinfo = result.data.split("^");
      if (timers.isEmpty || timers.length < 5) {
        timers.add(myinfo[1]);
        timers.add(myinfo[3]);
        timers.add(myinfo[5]);
        timers.add(myinfo[7]);
        timers.add(myinfo[9]);
      }
      if (meal_checked.isEmpty || meal_checked.length < 5) {
        if (myinfo[0] == "1") {
          meal_checked.add(true);
        } else
          meal_checked.add(false);

        if (myinfo[2] == "1") {
          meal_checked.add(true);
        } else
          meal_checked.add(false);

        if (myinfo[4] == "1") {
          meal_checked.add(true);
        } else
          meal_checked.add(false);

        if (myinfo[6] == "1") {
          meal_checked.add(true);
        } else
          meal_checked.add(false);

        if (myinfo[8] == "1") {
          meal_checked.add(true);
        } else
          meal_checked.add(false);
      }
    }
    print(timers);
    print(meal_checked);
    DateTime date = DateTime.now();

    if (!timers.isEmpty && meal) {
      if (meal_checked[0]) create_meal1_notification(timers[0], date.weekday);
      if (meal_checked[1]) create_meal2_notification(timers[1], date.weekday);
      if (meal_checked[2]) create_meal3_notification(timers[2], date.weekday);
      if (meal_checked[3]) create_meal4_notification(timers[3], date.weekday);
      if (meal_checked[4]) create_meal5_notification(timers[4], date.weekday);
    }
    setState(() {});
  }

  bool pause = false;
  bool meal = true;
  bool water = true;
  update_notif() async {
    var result = await http_post("change-notif", {
      "id": widget.firstlist[0],
      "pause": pause,
      "meal": meal,
      "water": water,
    });
    print(result);
  }

  get_notific() async {
    var res = await http_get("get_notif", {
      "id": widget.firstlist[0],
    });
    List l = res.data.toString().split(" ");
    setState(() {
      if (l[0] == "1")
        pause = true;
      else
        pause = false;
      if (l[1] == "1")
        meal = true;
      else
        meal = false;
      if (l[2] == "1")
        water = true;
      else
        water = false;

      if (pause) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Allow Notifications'),
            content: Text('Our app would like to send you notifications'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Don\'t Allow',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    pause = false;
                    meal = true;
                    water = true;
                  });
                  update_notif();
                  Navigator.pop(context);
                },
                child: Text(
                  'Allow',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  void initState() {
    print(widget.Meals);
    get_notific();
    get_calorie();
    get_mealstimers();
    get_waterstimers();
    drawerIndex = DrawerIndex.HOME;
    screenView = Homepage_screen(
      firstlist: [
        widget.firstlist[0],
        widget.firstlist[1],
        widget.firstlist[2],
        widget.firstlist[3],
        widget.firstlist[4],
      ],
      Meals2: widget.Meals,
      meal_amount2: widget.meal_amount,
      images: widget.images,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
            firstlist: [widget.firstlist[0]],
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = NavigationHomeScreen(
              firstlist: widget.firstlist,
              Meals: widget.Meals,
              meal_amount: widget.meal_amount,
              images: widget.images,
            );
          });
          break;

        case DrawerIndex.FeedBack:
          setState(() {
            screenView = FeedbackScreen(
              firstlist: [widget.firstlist[0]],
            );
          });
          break;
        case DrawerIndex.Settings:
          setState(() {
            screenView = Settings_Screen(
              firstlist: [widget.firstlist[0]],
            );
          });
          break;
        case DrawerIndex.About:
          setState(() {
            screenView = AboutUs_Screen();
          });
          break;
        case DrawerIndex.Progress:
          setState(() {
            screenView = Progress_screen(
              firstlist: [widget.firstlist[0]],
            );
          });
          break;
        default:
          break;
      }
    }
  }

  get_waterstimers() async {
    var result = await http_get("get_timers_water", {
      "id": widget.firstlist[0],
    });
    if (result.data == "null")
      w_timers = [];
    else {
      List myinfo = result.data.split("^");
      if (w_timers.isEmpty || w_timers.length < 14) {
        w_timers.add(myinfo[1]);
        w_timers.add(myinfo[3]);
        w_timers.add(myinfo[5]);
        w_timers.add(myinfo[7]);
        w_timers.add(myinfo[9]);
        w_timers.add(myinfo[11]);
        w_timers.add(myinfo[13]);
        w_timers.add(myinfo[15]);
        w_timers.add(myinfo[17]);
        w_timers.add(myinfo[19]);
        w_timers.add(myinfo[21]);
        w_timers.add(myinfo[23]);
        w_timers.add(myinfo[25]);
        w_timers.add(myinfo[27]);
      }
      if (glasses.isEmpty || glasses.length < 14) {
        if (myinfo[0] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[2] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[4] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[6] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[8] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[10] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[12] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[14] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[16] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[18] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[20] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[22] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[24] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);

        if (myinfo[26] == "1") {
          glasses.add(true);
        } else
          glasses.add(false);
      }
    }
    print(w_timers);
    print(glasses);
    DateTime date = DateTime.now();

    if (!w_timers.isEmpty && water) {
      if (glasses[0]) create_glass1_notification(w_timers[0], date.weekday);
      if (glasses[1]) create_glass2_notification(w_timers[1], date.weekday);
      if (glasses[2]) create_glass3_notification(w_timers[2], date.weekday);
      if (glasses[3]) create_glass4_notification(w_timers[3], date.weekday);
      if (glasses[4]) create_glass5_notification(w_timers[4], date.weekday);
      if (glasses[5]) create_glass6_notification(w_timers[5], date.weekday);
      if (glasses[6]) create_glass7_notification(w_timers[6], date.weekday);
      if (glasses[7]) create_glass8_notification(w_timers[7], date.weekday);
      if (glasses[8]) create_glass9_notification(w_timers[8], date.weekday);
      if (glasses[9]) create_glass10_notification(w_timers[9], date.weekday);
      if (glasses[10]) create_glass11_notification(w_timers[10], date.weekday);
      if (glasses[11]) create_glass12_notification(w_timers[11], date.weekday);
      if (glasses[12]) create_glass13_notification(w_timers[12], date.weekday);
      if (glasses[13]) create_glass14_notification(w_timers[13], date.weekday);
    }
    setState(() {});
  }
}
