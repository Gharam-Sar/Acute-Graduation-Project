import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/http.dart';
import 'package:test1/main_application/navigation_home_screen.dart';
import 'package:test1/signing%20up/log_in_screen.dart';
import 'sign_up_screen_1.dart';
import 'sign_up_screen_2.dart';
import 'package:flutter/cupertino.dart';

class Sign_Up_page_temp extends StatefulWidget {
  List checked;
  Sign_Up_page_temp({required this.checked}) : super();

  @override
  _Sign_Up_page_tempState createState() => _Sign_Up_page_tempState();
}

class _Sign_Up_page_tempState extends State<Sign_Up_page_temp> {
  List m = [];
  List m2 = [];
  List meal_id = [];
  List meal_index = [];
  List date = [];
  List j = [];
  List images = [];
  List Meals = [];
  List indexx = [];
  List amount = [];
  List meal_amount = [];

  show_meals(String id) async {
    var result = await http_get("usermeals", {
      "id": id,
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
      if (Meals.isEmpty || Meals.length < j.length) {
        Meals.add(result.data);
      }
    }

    setState(() {});
  }

  createUserinfo() async {
    var result = await http_get("userID", {
      "email": widget.checked[12],
      "password": widget.checked[13],
    });

    List checked_meal = [false, false, false, false, false];
    List meal_time = ["00:00", "00:00", "00:00", "00:00", "00:00"];

    var result2 = await http_post("timers_meals", {
      "id": result.data,
      "meal1": checked_meal[0],
      "timer1": meal_time[0],
      "meal2": checked_meal[1],
      "timer2": meal_time[1],
      "meal3": checked_meal[2],
      "timer3": meal_time[2],
      "meal4": checked_meal[3],
      "timer4": meal_time[3],
      "meal5": checked_meal[4],
      "timer5": meal_time[4],
    });
    List checked_drink = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];
    List drink_time = [
      "00:00",
      "00:00",
      "00:00",
      "00:00",
      "00:00",
      "00:00",
      "00:00",
      "00:00",
      "00:00",
      "00:00",
      "00:00",
      "00:00",
      "00:00",
      "00:00",
    ];
    num ww = double.parse(widget.checked[14]) * 1000;
    double div = 30.0;
    var water_amount = ww ~/ div;
    var result3 = await http_post("set_water_timer", {
      "id": result.data,
      "plan": 1,
      "glass_size": 200,
      "goal": water_amount,
      "glass1": checked_drink[0],
      "timer1": drink_time[0],
      "glass2": checked_drink[1],
      "timer2": drink_time[1],
      "glass3": checked_drink[2],
      "timer3": drink_time[2],
      "glass4": checked_drink[3],
      "timer4": drink_time[3],
      "glass5": checked_drink[4],
      "timer5": drink_time[4],
      "glass6": checked_drink[5],
      "timer6": drink_time[5],
      "glass7": checked_drink[6],
      "timer7": drink_time[6],
      "glass8": checked_drink[7],
      "timer8": drink_time[7],
      "glass9": checked_drink[8],
      "timer9": drink_time[8],
      "glass10": checked_drink[9],
      "timer10": drink_time[9],
      "glass11": checked_drink[10],
      "timer11": drink_time[10],
      "glass12": checked_drink[11],
      "timer12": drink_time[11],
      "glass13": checked_drink[12],
      "timer13": drink_time[12],
      "glass14": checked_drink[13],
      "timer14": drink_time[13],
    });

    var res = await http_post("user-info", {
      "id": result.data,
      "dis1": widget.checked[0],
      "dis2": widget.checked[1],
      "dis3": widget.checked[2],
      "dis4": widget.checked[3],
      "dis5": widget.checked[4],
      "dis6": widget.checked[5],
      "dis7": widget.checked[6],
      "dis8": widget.checked[7],
      "dis9": widget.checked[8],
      "dis10": widget.checked[9],
    });

    var result4 = await http_get("bodyinfo", {
      "id": result.data,
    });

    var arr = result4.data.split(' ');
    String weight = arr[0];
    String height = arr[1];
    String gender = arr[2];
    String name = arr[3];
    String datef = DateFormat('yyyy-MM-dd').format(DateTime.now());
    print(datef);
    var result5 = await http_get("getimages", {
      "date": datef,
    });

    List arrrr = result5.data.split("\"linklinklink");
    for (int lll = 0; lll < arrrr.length; lll++) {
      String ttt = arrrr[lll].toString().replaceAll(" ", "");
      images.add(ttt);
    }
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => NavigationHomeScreen(
                    firstlist: [result.data, weight, height, gender, name],
                    Meals: Meals,
                    meal_amount: meal_amount,
                    images: images,
                  )));

      // var response = result.data['status'];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 181, 217, 240),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Align(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.04),
                        child: Align(
                            child: Text('You\'re All Set Up Now',
                                style: GoogleFonts.poppins(
                                  color: Color(0xff132137),
                                  fontSize: size.height * 0.03,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                        child: Align(
                            child: Text(
                                'Continue to our Home page, We Hope\n  You have a Wonderful Experience with Us',
                                style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 71, 104, 158),
                                  fontSize: size.height * 0.023,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center)),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.00,
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: Image.asset('assets/others/success3.png'),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: size.height * 0.025),
                        child: Container(
                          height: size.height * 0.077,
                          width: size.width * 0.77,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                stops: [
                                  0.01,
                                  1.0,
                                ],
                                colors: [
                                  Color.fromARGB(255, 71, 104, 158),
                                  Color.fromARGB(255, 19, 33, 55),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: FlatButton(
                            onPressed: createUserinfo,
                            child: Text(
                              'Continue',
                              style: GoogleFonts.satisfy(
                                  color: Colors.white,
                                  fontSize: size.width * 0.09,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.01),
                      ),
                      SizedBox(
                        width: size.width * 0.5,
                        height: size.height * 0.1,
                        child: Image.asset(
                          'assets/others/logoNavy.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.001),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
