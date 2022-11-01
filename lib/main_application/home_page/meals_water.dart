import 'package:intl/intl.dart';
import 'package:test1/main_application/home_page/search/search_2.dart';

import 'package:flutter/material.dart';
import 'package:test1/main_application/home_page/wave_view.dart';
import 'dart:math' as math;

import 'package:velocity_x/velocity_x.dart';

import '../../http.dart';

class meals_waterview extends StatefulWidget {
  List firstlist;
  List Meals;
  List indexx;
  List meal_amount;
  meals_waterview(
      {Key? key,
      required this.firstlist,
      required this.Meals,
      required this.indexx,
      required this.meal_amount})
      : super(key: key);
  @override
  _meals_waterviewState createState() => _meals_waterviewState();
}

class _meals_waterviewState extends State<meals_waterview> {
  bool click = true;
  String st = "";
  String idd = "";
  bool from_meals = false;
  int water_goal = 0;
  int amount_drink = 0;
  int glass_size = 0;
  List meal_checked = [];
  String time = "";
  List l = [5, 4, 3, 2, 1, 0];
  int count = 0;
  get_timers() async {
    var result = await http_get("get_timers_meals", {
      "id": widget.firstlist[0],
    });

    setState(() {
      List myinfo = result.data.split("^");
      if (meal_checked.isEmpty || meal_checked.length < 7) {
        meal_checked.add(false);
        if (myinfo[0] == "1") {
          meal_checked.add(true);
          count++;
        } else
          meal_checked.add(false);

        if (myinfo[2] == "1") {
          meal_checked.add(true);
          count++;
        } else
          meal_checked.add(false);

        if (myinfo[4] == "1") {
          meal_checked.add(true);
          count++;
        } else
          meal_checked.add(false);

        if (myinfo[6] == "1") {
          meal_checked.add(true);
          count++;
        } else
          meal_checked.add(false);

        if (myinfo[8] == "1") {
          meal_checked.add(true);
          count++;
        } else
          meal_checked.add(false);
      }
    });
  }

  get_water() async {
    var result = await http_get("get_water_timer", {
      "id": widget.firstlist[0],
    });

    setState(() {
      List myinfo = result.data.split("^");
      water_goal = int.parse(myinfo[1]);
      glass_size = int.parse(myinfo[0]);
    });
  }

  String datef = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String timef = DateFormat("HH:mm").format(DateTime.now());
  double p = 0.0;
  setwatertimer() async {
    var result = await http_post("water_amount", {
      "id": widget.firstlist[0],
      "drink_amount": amount_drink,
      "time": timef,
      "date": datef,
    });
    print(result);
  }

  get_amount() async {
    var result = await http_get("get_water_amount", {
      "id": widget.firstlist[0],
    });

    setState(() {
      List myinfo = result.data.split("^");
      if (myinfo[0] == "null")
        amount_drink = 0;
      else
        amount_drink = int.parse(myinfo[0]);
      if (myinfo[1] == "null")
        time = "You haven't drank yet";
      else
        time = 'Last drink at ' + myinfo[1] + "     ";

      double p2 = (water_goal - amount_drink) / water_goal;
      p = (1 - p2) * 100;
      p = p.roundToDouble();
    });
  }

  double Top = 0;
  @override
  initState() {
    get_timers();
    get_water();
    get_amount();
    super.initState();
  }

  Widget build(BuildContext context) {
    idd = widget.firstlist[0];
    Size size = MediaQuery.of(context).size;
    if (count == 5) {
      Top = 550;
    }
    if (count == 4) {
      Top = 525;
    }
    if (count == 3) {
      Top = 500;
    }
    if (count == 2) {
      Top = 475;
    }
    if (count == 1) {
      Top = 450;
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 181, 217, 240),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 1,
        title: Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.07,
            child: Image.asset(
              'assets/others/logoNavy.png',
              fit: BoxFit.cover,
            ),

            //
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            click ? _buildRightSection() : _buildSection(st),
            Container(
              height: MediaQuery.of(context).size.height / 1.25,
              width: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color.fromARGB(255, 19, 33, 55),
                        ),
                        onPressed: () {
                          setState(() {
                            click = true;
                            clickindex = [
                              false,
                              false,
                              false,
                              false,
                              false,
                              false
                            ];
                          });
                        },
                      ),
                    ),
                  ]),
            ),
            Positioned(
              top: Top,
              child: Transform.rotate(
                angle: -math.pi / 2,
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      for (int i in l) ...[
                        if (meal_checked.length != 0) ...[
                          if (meal_checked[i] && count == 5)
                            _buildMenu(i).px8(),
                          if (meal_checked[i] && count == 4)
                            _buildMenu(i).px16(),
                          if (meal_checked[i] && count == 3)
                            _buildMenu(i).px24(),
                          if (meal_checked[i] && count == 2)
                            _buildMenu(i).px32(),
                          if (meal_checked[i] && count == 1)
                            _buildMenu(i).px64(),
                        ],
                      ],
                    ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.83,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    child: Text(
                      "Water",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                        letterSpacing: 0.5,
                        color: Color.fromARGB(255, 9, 78, 153),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.height * 0.03,
                        left: MediaQuery.of(context).size.height * 0.03,
                        bottom: MediaQuery.of(context).size.height * 0.3),
                    child: Container(
                      height: size.height * 0.27,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.height * 0.03,
                                    bottom: size.height * 0.02,
                                    top: size.height * 0.035),
                                child: Text(
                                  amount_drink.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                    color: Color.fromARGB(255, 10, 55, 102),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.height * 0.005,
                                    bottom: size.height * 0.0275,
                                    top: size.height * 0.03),
                                child: Text(
                                  'ml',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    letterSpacing: -0.2,
                                    color: Color.fromARGB(255, 10, 55, 102),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left: size.height * 0.03,
                                top: size.height * 0.1,
                              ),
                              child: Text(
                                'of daily goal ' + water_goal.toString() + 'ml',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Color.fromARGB(255, 10, 55, 102),
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                          ]),
                          Padding(
                            padding: EdgeInsets.only(
                              right: size.height * 0.22,
                              top: size.height * 0.16,
                            ),
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 9, 78, 153),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.height * 0.25, ///////////////////////
                              top: size.height * 0.14,
                            ),
                            child: CircleAvatar(
                              backgroundColor:
                                  Color(0xFFFB475F).withOpacity(.65),
                              radius: 20,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                onPressed: () {
                                  setState(() {
                                    amount_drink = amount_drink + glass_size;
                                    setwatertimer();
                                    String timeff = DateFormat("HH:mm")
                                        .format(DateTime.now());
                                    time = 'Last drink at ' + timeff + "     ";

                                    double p2 = (water_goal - amount_drink) /
                                        water_goal;
                                    p = (1 - p2) * 100;
                                    p = p.roundToDouble();
                                  });
                                },
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.height * 0.03,
                                    top: size.height * 0.17),
                                child: Icon(
                                  Icons.access_time,
                                  color: Color(0xFFFB475F).withOpacity(.65),
                                  size: 17,
                                ),
                              ).py24(),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.17),
                                child: Text(
                                  time,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.031,
                                    letterSpacing: 0.0,
                                    color: Color(0xFFFB475F).withOpacity(.65),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.height * 0.05,
                                    right: size.height * 0.03,
                                    top: size.height * 0.024),
                                child: Container(
                                  width: 60,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 181, 217, 240),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(80.0),
                                        bottomLeft: Radius.circular(80.0),
                                        bottomRight: Radius.circular(80.0),
                                        topRight: Radius.circular(80.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          offset: const Offset(2, 2),
                                          blurRadius: 4),
                                    ],
                                  ),
                                  child: WaveView(
                                    percentageValue: p,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<bool> clickindex = [false, false, false, false, false, false];
  int i = 0;
  double w = 270;
  double h = 350;
  double c = 0;

  Widget _buildMenu(int index) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: FlatButton(
        minWidth: 70,
        padding: EdgeInsets.only(top: 10),
        onPressed: () {
          if (index == 5) {
            setState(() {
              click = false;
              i = 5;
              clickindex = [false, false, false, false, false, false];
              clickindex[index] = true;
              st = "Meal " + index.toString();
            });
          }

          if (index == 4)
            setState(() {
              click = false;
              i = 4;
              clickindex = [false, false, false, false, false, false];
              clickindex[index] = true;
              st = "Meal " + index.toString();
            });
          if (index == 3)
            setState(() {
              i = 3;
              click = false;
              clickindex = [false, false, false, false, false, false];
              clickindex[index] = true;
              st = "Meal " + index.toString();
            });
          if (index == 2)
            setState(() {
              i = 2;
              click = false;
              clickindex = [false, false, false, false, false, false];
              clickindex[index] = true;
              st = "Meal " + index.toString();
            });
          if (index == 1)
            setState(() {
              i = 1;
              click = false;
              clickindex = [false, false, false, false, false, false];
              clickindex[index] = true;
              st = "Meal " + index.toString();
            });
        },
        child: Center(
          child: Text(
            "Meal " + index.toString(),
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.018,
                fontWeight: FontWeight.w600,
                color: clickindex[index]
                    ? Color.fromARGB(255, 9, 78, 153)
                    : Color.fromARGB(255, 181, 217, 240)),
          ),
        ),
      ),
    );
  }

  Widget _buildRightSection() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.04),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.1, top: size.height * 0.01),
            child: Text(
              "Meals",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height * 0.04,
                letterSpacing: 0.5,
                color: Color.fromARGB(255, 9, 78, 153),
              ),
            ),
          ),
          foodlist(context),
        ],
      ),
    );
  }

  Widget foodlist(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(left: size.height * 0.01, bottom: size.height * 0.01),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            // Big light background
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Image.asset(
                  'assets/others/think.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String st) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.001),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.1, top: size.height * 0.05),
            child: Text(
              "Meals",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height * 0.04,
                letterSpacing: 0.5,
                color: Color.fromARGB(255, 9, 78, 153),
              ),
            ),
          ).py4(),
          addfood(context, st),
        ],
      ),
    );
  }

  Widget addfood(BuildContext context, String st) {
    Size size = MediaQuery.of(context).size;
    double cc = 0;
    for (int k = 0; k < widget.indexx.length; k++) {
      if (widget.indexx[k] == i.toString()) cc++;
    }

    return Padding(
      padding: EdgeInsets.only(left: size.height * 0.12),
      child: Container(
        height: h + cc * 15,
        width: w,
        child: Stack(
          children: <Widget>[
            // Big light background
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                height: 320 + cc * 15,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            // Food Image
            Positioned(
              top: 0,
              right: -50,
              child: Container(
                  height: 150,
                  width: 250,
                  constraints: BoxConstraints(maxWidth: 400, maxHeight: 400),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/others/image1.gif',
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  )),
            ),
            // Price
            Positioned(
              right: 50,
              top: 295 + cc * 14,
              child: FlatButton(
                minWidth: 120,
                height: 30,
                padding: EdgeInsets.only(left: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Color(0xFFFB475F).withOpacity(.65),
                onPressed: () {
                  from_meals = true;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => search_2_screen(
                                firstlist: [idd, i, from_meals],
                              )));
                },
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "  Add food",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: MediaQuery.of(context).size.width * 0.044,
                            fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              left: 25,
              top: 100,
              child: Container(
                child: Row(children: [
                  Text(
                    st,
                    style: TextStyle(
                        color: Color.fromARGB(255, 9, 78, 153),
                        fontSize: MediaQuery.of(context).size.width * 0.066,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              ),
            ),
            Positioned(
              top: 140,
              left: 20,
              child: Container(
                width: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Add the foods you ate for this meal",
                      style: TextStyle(
                          color: Color.fromARGB(255, 136, 60, 89),
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w600),
                    ).py8(),
                    meals2(context, size)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool found = false;
  Widget meals2(BuildContext context, Size size) {
    String t = "";
    for (int j = 0; j < widget.indexx.length; j++) {
      if ((widget.indexx[j] == i.toString())) {
        List l = widget.Meals[j].split("^");
        if (widget.meal_amount[j] != 100) {
          double d = double.parse(widget.meal_amount[j]);
          double am = (d * double.parse(l[1])) / 100;
          l[1] = am.toString();
        }
        t = t + "\n" + l[0] + "  " + l[1] + "Kcal";
      }
    }

    return SingleChildScrollView(
      child: Text(
        t,
        style: TextStyle(
            color: Color.fromARGB(255, 9, 78, 153),
            fontSize: MediaQuery.of(context).size.width * 0.035,
            fontWeight: FontWeight.w600),
      ).py4(),
    );
  }

  List<bool> checked_meal = [false, false, false, false, false, false];
  newMethod(BuildContext context, Size size) {
    return Padding(
        padding: EdgeInsets.only(
          left: 0,
        ),
        child: Transform.scale(
          scale: 1.4,
          child: Checkbox(
            shape: CircleBorder(),
            side: const BorderSide(
              // set border color here
              color: Color(0xFFFB475F),
            ),
            activeColor: Color(0xFFFB475F).withOpacity(.65),
            checkColor: Color.fromARGB(255, 238, 239, 241),
            //fillColor: Color.fromARGB(255, 19, 33, 55),
            value: checked_meal[i],
            onChanged: (bool? value) {
              setState(() {
                checked_meal[i] = value!;
              });
              print(checked_meal[i]);
            },
          ),
        ));
  }
}
