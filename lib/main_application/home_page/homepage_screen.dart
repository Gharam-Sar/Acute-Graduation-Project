import 'package:intl/intl.dart';
import 'package:test1/http.dart';
import 'package:test1/main_application/home_page/models/tabIcon_data.dart';
import 'package:test1/main_application/home_page/search_foods.dart';
import 'package:test1/main_application/home_page/set_timers.dart';
import 'package:flutter/material.dart';
import '../../notification.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';

import 'calculator.dart';
import 'home_screen/Homepagescreen.dart';
import 'meals_water.dart';

String id = "";

class Homepage_screen extends StatefulWidget {
  List firstlist;
  List Meals2;
  List meal_amount2;
  List images;
  Homepage_screen(
      {Key? key,
      required this.firstlist,
      required this.Meals2,
      required this.meal_amount2,
      required this.images})
      : super(key: key);

  @override
  _Homepage_screenState createState() => _Homepage_screenState();
}

class _Homepage_screenState extends State<Homepage_screen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List m = [];
  List m2 = [];
  List meal_id = [];
  List meal_index = [];
  List date = [];
  List j = [];
  List cholestrol = [];
  List protein = [];
  List sugar = [];
  List sodium = [];
  List Meals = [];
  List indexx = [];
  List amount = [];
  List meal_amount = [];
  List dis = [];
  show_meals() async {
    var result = await http_get("usermeals", {
      "id": widget.firstlist[0],
    });
    m = result.data.split("&");

    for (int i = 0; i < m.length - 1; i++) {
      if (m2.isEmpty || m2.length <= m.length) {
        m2 = m[i].split("^");

        meal_id.add(m2[0]);
        meal_index.add(m2[1]);
        date.add(m2[2]);
        amount.add(m2[3]);
      }
    }
    final DateTime date1 = DateTime.now();

    List<String> d1 = date1.toString().split(" ");

    for (int l = 0; l < date.length; l++) {
      final DateTime date2 = DateTime.parse(date[l]);
      List<String> d2 = date2.toString().split(" ");

      if (d1[0] == d2[0]) {
        if (indexx.isEmpty || indexx.length < meal_index.length)
          indexx.add(meal_index[l]);
        if (meal_amount.isEmpty || meal_amount.length < amount.length)
          meal_amount.add(amount[l]);
        if (j.isEmpty || j.length < date.length) j.add(l);
      }
    }

    for (int l = 0; l < j.length; l++) {
      var result = await http_get("getmealname", {
        "id": meal_id[j[l]],
      });
      var result2 = await http_get("getcholestrol", {
        "id": meal_id[j[l]],
      });
      List t = result2.data.toString().split("^");
      if (Meals.isEmpty || Meals.length < j.length) {
        Meals.add(result.data);
      }
      if (result2.data != "nn") {
        if (cholestrol.isEmpty || cholestrol.length < j.length) {
          double c = (double.parse(meal_amount[l]) * double.parse(t[0])) / 100;
          cholestrol.add(c);
        }
        if (protein.isEmpty || protein.length < j.length) {
          double c2 = (double.parse(meal_amount[l]) * double.parse(t[1])) / 100;
          protein.add(c2);
        }
        if (sugar.isEmpty || sugar.length < j.length) {
          double c3 = (double.parse(meal_amount[l]) * double.parse(t[2])) / 100;
          sugar.add(c3);
        }
        if (sodium.isEmpty || sodium.length < j.length) {
          double c4 = (double.parse(meal_amount[l]) * double.parse(t[3])) / 100;
          sodium.add(c4);
        }
      }
    }
    var result23 = await http_get("disease", {
      "id": widget.firstlist[0],
    });
    dis = result23.data.toString().split("&");
    double chol = 0;
    double pprotein = 0;
    double sugarr = 0;
    double sodiumm = 0;
    if (dis[0] == "1") {
      for (int kk = 0; kk < cholestrol.length; kk++) {
        chol = chol + cholestrol[kk];
      }

      print("cholestrol");
      print(chol);
      if (chol > 200) {
        DateTime date = DateTime.now();
        create_dis_notification(date.weekday);
      }
    }
    var rr = await http_get("info", {
      "id": widget.firstlist[0],
    });
    List myyinfo = rr.data.split("&");
    double wweight = double.parse(myyinfo[2]);
    if (dis[3] == "1") {
      for (int kk = 0; kk < protein.length; kk++) {
        pprotein = pprotein + protein[kk];
      }
      print("pprotein");
      print(pprotein);
      double dd = wweight * 0.8;
      if (pprotein > dd) {
        DateTime date = DateTime.now();
        create_dis2_notification(date.weekday);
      }
    }
    if (dis[4] == "1") {
      for (int kk = 0; kk < sugar.length; kk++) {
        sugarr = sugarr + sugar[kk];
      }
      print("sugar");
      print(sugarr);
      if (sugarr > 25) {
        DateTime date = DateTime.now();
        create_dis3_notification(date.weekday);
      }
    }
    if (dis[5] == "1") {
      for (int kk = 0; kk < sodium.length; kk++) {
        sodiumm = sodiumm + sodium[kk];
      }
      print("sodiumm");
      print(sodiumm);
      if (sodiumm > 1500) {
        DateTime date = DateTime.now();
        create_dis4_notification(date.weekday);
      }
    }
    setState(() {});
  }

  bool meals_found = false;
  int count = 0;
  late int the_count;
  String datef = DateFormat('yyyy-MM-dd').format(DateTime.now());
  double p = 0.0;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: Color.fromARGB(255, 181, 217, 240),
  );

  @override
  void initState() {
    show_meals();
    print("meme");
    print(widget.Meals2);

    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    // tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = Homepagescreen(
      firstlist: [
        id,
        widget.firstlist[1],
        widget.firstlist[2],
        widget.firstlist[3],
        widget.firstlist[4],
      ],
      Meals: widget.Meals2,
      meal_amount: widget.meal_amount2,
      images: widget.images,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    id = widget.firstlist[0];
    print("home_page");
    print(id);

    return Container(
      color: Color.fromARGB(255, 181, 217, 240),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              //////checking meals and water an nutritons
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = meals_waterview(
                    Meals: Meals,
                    indexx: indexx,
                    meal_amount: meal_amount,
                    firstlist: [id],
                  );
                });
              });
            } else if (index == 1) {
              //// notification
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = set_timers_screen(
                    animationController: animationController,
                    firstlist: [id],
                  );
                });
              });
            } else if (index == 2) {
              ////calculater
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = calorie_calc(
                    Meals: Meals,
                    meal_amount: meal_amount,
                    firstlist: [id],
                  );
                });
              });
            } else if (index == 3) {
              /////search
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = serach_foods(
                    animationController: animationController,
                    firstlist: [id],
                  );
                });
              });
            }
          },
          firstlist: [widget.firstlist[0]],
        ),
      ],
    );
  }
}
