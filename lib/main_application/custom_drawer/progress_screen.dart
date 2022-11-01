import 'package:test1/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:test1/http.dart';
import 'package:test1/main_application/custom_drawer/progress_food.dart';
import 'package:test1/main_application/custom_drawer/progress_water.dart';

class Progress_screen extends StatefulWidget {
  List firstlist;

  Progress_screen({
    Key? key,
    required this.firstlist,
  }) : super(key: key);

  @override
  _Progress_screenState createState() => _Progress_screenState();
}

class _Progress_screenState extends State<Progress_screen> {
  @override
  get_meals() async {
    List m = [];
    List m2 = [];
    List meal_id = [];
    List meal_index = [];
    List date = [];
    List j = [];
    List j2 = [];
    List j3 = [];
    List j4 = [];
    List j5 = [];
    List j6 = [];
    List j7 = [];

    List Meals = [];
    List indexx = [];
    List amount = [];
    List meal_amount = [];
    List meal_amount2 = [];
    List meal_amount3 = [];
    List meal_amount4 = [];
    List meal_amount5 = [];
    List meal_amount6 = [];
    List meal_amount7 = [];

    List<ChartData> chartData1 = [];
    List<ChartData> chartData2 = [];
    List<ChartData> chartData3 = [];
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
    final DateTime date1 = DateTime.now().subtract(Duration(days: 1));
    List<String> d1 = date1.toString().split(" ");
    final DateTime date2 = DateTime.now().subtract(Duration(days: 2));
    List<String> d2 = date2.toString().split(" ");
    final DateTime date3 = DateTime.now().subtract(Duration(days: 3));
    List<String> d3 = date3.toString().split(" ");
    final DateTime date4 = DateTime.now().subtract(Duration(days: 4));
    List<String> d4 = date4.toString().split(" ");
    final DateTime date5 = DateTime.now().subtract(Duration(days: 5));
    List<String> d5 = date5.toString().split(" ");
    final DateTime date6 = DateTime.now().subtract(Duration(days: 6));
    List<String> d6 = date6.toString().split(" ");
    final DateTime date7 = DateTime.now().subtract(Duration(days: 7));
    List<String> d7 = date7.toString().split(" ");
    List cholestrol = [];
    List protein = [];
    List carbs = [];
    List cholestrol2 = [];
    List protein2 = [];
    List carbs2 = [];
    List cholestrol3 = [];
    List protein3 = [];
    List carbs3 = [];
    List cholestrol4 = [];
    List protein4 = [];
    List carbs4 = [];
    List cholestrol5 = [];
    List protein5 = [];
    List carbs5 = [];
    List cholestrol6 = [];
    List protein6 = [];
    List carbs6 = [];
    List cholestrol7 = [];
    List protein7 = [];
    List carbs7 = [];

    for (int l = 0; l < date.length; l++) {
      final DateTime datee = DateTime.parse(date[l]);
      List<String> dd = datee.toString().split(" ");
      if (d1[0] == dd[0]) {
        if (meal_amount.isEmpty || meal_amount.length < amount.length)
          meal_amount.add(amount[l]);
        if (j.isEmpty || j.length < date.length) j.add(l);
      }
      if (d2[0] == dd[0]) {
        if (meal_amount2.isEmpty || meal_amount2.length < amount.length)
          meal_amount2.add(amount[l]);
        if (j2.isEmpty || j2.length < date.length) j2.add(l);
      }
      if (d3[0] == dd[0]) {
        if (meal_amount3.isEmpty || meal_amount3.length < amount.length)
          meal_amount3.add(amount[l]);
        if (j3.isEmpty || j3.length < date.length) j3.add(l);
      }
      if (d4[0] == dd[0]) {
        if (meal_amount4.isEmpty || meal_amount4.length < amount.length)
          meal_amount4.add(amount[l]);
        if (j4.isEmpty || j4.length < date.length) j4.add(l);
      }
      if (d5[0] == dd[0]) {
        if (meal_amount5.isEmpty || meal_amount5.length < amount.length)
          meal_amount5.add(amount[l]);
        if (j5.isEmpty || j5.length < date.length) j5.add(l);
      }
      if (d6[0] == dd[0]) {
        if (meal_amount6.isEmpty || meal_amount6.length < amount.length)
          meal_amount6.add(amount[l]);
        if (j6.isEmpty || j6.length < date.length) j6.add(l);
      }
      if (d7[0] == dd[0]) {
        if (meal_amount7.isEmpty || meal_amount7.length < amount.length)
          meal_amount7.add(amount[l]);
        if (j7.isEmpty || j7.length < date.length) j7.add(l);
      }
    }
    List t = [];
    List t2 = [];
    List t3 = [];
    List t4 = [];
    List t5 = [];
    List t6 = [];
    List t7 = [];
    for (int l = 0; l < j.length; l++) {
      if (!j.isEmpty) {
        var result2 = await http_get("get_foodprogress", {
          "id": meal_id[j[l]],
        });
        t = result2.data.toString().split("^");
      }
      if (!t.isEmpty) {
        if (t[0] != "nn") {
          if (cholestrol.isEmpty || cholestrol.length <= j.length) {
            double c =
                (double.parse(meal_amount[l]) * double.parse(t[0])) / 100;
            cholestrol.add(c);
          }
          if (protein.isEmpty || protein.length <= j.length) {
            double c2 =
                (double.parse(meal_amount[l]) * double.parse(t[1])) / 100;
            protein.add(c2);
          }
          if (carbs.isEmpty || carbs.length <= j.length) {
            double c3 =
                (double.parse(meal_amount[l]) * double.parse(t[2])) / 100;
            carbs.add(c3);
          }
        }
      }
    }
    for (int l = 0; l < j2.length; l++) {
      if (!j2.isEmpty) {
        var result3 = await http_get("get_foodprogress", {
          "id": meal_id[j2[l]],
        });
        t2 = result3.data.toString().split("^");
      }
      if (!t2.isEmpty) {
        if (t2[0] != "nn") {
          if (cholestrol2.isEmpty || cholestrol2.length <= j2.length) {
            double c =
                (double.parse(meal_amount2[l]) * double.parse(t2[0])) / 100;
            cholestrol2.add(c);
          }
          if (protein2.isEmpty || protein2.length <= j2.length) {
            double c2 =
                (double.parse(meal_amount2[l]) * double.parse(t2[1])) / 100;
            protein2.add(c2);
          }
          if (carbs2.isEmpty || carbs2.length <= j2.length) {
            double c3 =
                (double.parse(meal_amount2[l]) * double.parse(t2[2])) / 100;
            carbs2.add(c3);
          }
        }
      }
    }
    for (int l = 0; l < j3.length; l++) {
      if (!j3.isEmpty) {
        var result4 = await http_get("get_foodprogress", {
          "id": meal_id[j3[l]],
        });
        t3 = result4.data.toString().split("^");
      }
      if (!t3.isEmpty) {
        if (t3[0] != "nn") {
          if (cholestrol3.isEmpty || cholestrol3.length <= j3.length) {
            double c =
                (double.parse(meal_amount3[l]) * double.parse(t3[0])) / 100;
            cholestrol3.add(c);
          }
          if (protein3.isEmpty || protein3.length <= j3.length) {
            double c2 =
                (double.parse(meal_amount3[l]) * double.parse(t3[1])) / 100;
            protein3.add(c2);
          }
          if (carbs3.isEmpty || carbs3.length <= j3.length) {
            double c3 =
                (double.parse(meal_amount3[l]) * double.parse(t3[2])) / 100;
            carbs3.add(c3);
          }
        }
      }
    }
    for (int l = 0; l < j4.length; l++) {
      if (!j4.isEmpty) {
        var result5 = await http_get("get_foodprogress", {
          "id": meal_id[j4[l]],
        });
        t4 = result5.data.toString().split("^");
      }
      if (!t4.isEmpty) {
        if (t4[0] != "nn") {
          if (cholestrol4.isEmpty || cholestrol4.length <= j4.length) {
            double c =
                (double.parse(meal_amount4[l]) * double.parse(t4[0])) / 100;
            cholestrol4.add(c);
          }
          if (protein4.isEmpty || protein4.length <= j4.length) {
            double c2 =
                (double.parse(meal_amount4[l]) * double.parse(t4[1])) / 100;
            protein4.add(c2);
          }
          if (carbs4.isEmpty || carbs4.length <= j4.length) {
            double c3 =
                (double.parse(meal_amount4[l]) * double.parse(t4[2])) / 100;
            carbs4.add(c3);
          }
        }
      }
    }
    for (int l = 0; l < j5.length; l++) {
      if (!j5.isEmpty) {
        var result6 = await http_get("get_foodprogress", {
          "id": meal_id[j5[l]],
        });
        t5 = result6.data.toString().split("^");
      }
      if (!t5.isEmpty) {
        if (t5[0] != "nn") {
          if (cholestrol5.isEmpty || cholestrol5.length <= j5.length) {
            double c =
                (double.parse(meal_amount5[l]) * double.parse(t5[0])) / 100;
            cholestrol5.add(c);
          }
          if (protein5.isEmpty || protein5.length <= j5.length) {
            double c2 =
                (double.parse(meal_amount5[l]) * double.parse(t5[1])) / 100;
            protein5.add(c2);
          }
          if (carbs5.isEmpty || carbs5.length <= j5.length) {
            double c3 =
                (double.parse(meal_amount5[l]) * double.parse(t5[2])) / 100;
            carbs5.add(c3);
          }
        }
      }
    }
    for (int l = 0; l < j6.length; l++) {
      if (!j6.isEmpty) {
        var result7 = await http_get("get_foodprogress", {
          "id": meal_id[j6[l]],
        });
        t6 = result7.data.toString().split("^");
      }
      if (!t6.isEmpty) {
        if (t6[0] != "nn") {
          if (cholestrol6.isEmpty || cholestrol6.length <= j6.length) {
            double c =
                (double.parse(meal_amount6[l]) * double.parse(t6[0])) / 100;
            cholestrol6.add(c);
          }
          if (protein6.isEmpty || protein6.length <= j6.length) {
            double c2 =
                (double.parse(meal_amount6[l]) * double.parse(t6[1])) / 100;
            protein6.add(c2);
          }
          if (carbs6.isEmpty || carbs6.length <= j6.length) {
            double c3 =
                (double.parse(meal_amount6[l]) * double.parse(t6[2])) / 100;
            carbs6.add(c3);
          }
        }
      }
    }

    for (int l = 0; l < j7.length; l++) {
      if (!j7.isEmpty) {
        var result8 = await http_get("get_foodprogress", {
          "id": meal_id[j7[l]],
        });
        t7 = result8.data.toString().split("^");
      }
      if (!t7.isEmpty) {
        if (t7[0] != "nn") {
          if (cholestrol7.isEmpty || cholestrol7.length <= j7.length) {
            double c =
                (double.parse(meal_amount7[l]) * double.parse(t7[0])) / 100;
            cholestrol7.add(c);
          }
          if (protein7.isEmpty || protein7.length <= j7.length) {
            double c2 =
                (double.parse(meal_amount7[l]) * double.parse(t7[1])) / 100;
            protein7.add(c2);
          }
          if (carbs7.isEmpty || carbs7.length <= j7.length) {
            double c3 =
                (double.parse(meal_amount7[l]) * double.parse(t7[2])) / 100;
            carbs7.add(c3);
          }
        }
      }
    }

    double chol = 0;
    double pprotein = 0;
    double carbss = 0;
    double chol2 = 0;
    double pprotein2 = 0;
    double carbss2 = 0;
    double chol3 = 0;
    double pprotein3 = 0;
    double carbss3 = 0;
    double chol4 = 0;
    double pprotein4 = 0;
    double carbss4 = 0;
    double chol5 = 0;
    double pprotein5 = 0;
    double carbss5 = 0;
    double chol6 = 0;
    double pprotein6 = 0;
    double carbss6 = 0;
    double chol7 = 0;
    double pprotein7 = 0;
    double carbss7 = 0;
    for (int kk = 0; kk < cholestrol.length; kk++) {
      chol = chol + cholestrol[kk];
      pprotein = pprotein + protein[kk];
      carbss = carbss + carbs[kk];
    }
    for (int kk = 0; kk < cholestrol2.length; kk++) {
      chol2 = chol + cholestrol2[kk];
      pprotein2 = pprotein2 + protein2[kk];
      carbss2 = carbss2 + carbs2[kk];
    }
    for (int kk = 0; kk < cholestrol3.length; kk++) {
      chol3 = chol3 + cholestrol3[kk];
      pprotein3 = pprotein3 + protein3[kk];
      carbss3 = carbss3 + carbs3[kk];
    }
    for (int kk = 0; kk < cholestrol4.length; kk++) {
      chol4 = chol4 + cholestrol4[kk];
      pprotein4 = pprotein4 + protein4[kk];
      carbss4 = carbss4 + carbs4[kk];
    }
    for (int kk = 0; kk < cholestrol5.length; kk++) {
      chol5 = chol5 + cholestrol5[kk];
      pprotein5 = pprotein5 + protein5[kk];
      carbss5 = carbss5 + carbs5[kk];
    }
    for (int kk = 0; kk < cholestrol6.length; kk++) {
      chol6 = chol6 + cholestrol6[kk];
      pprotein6 = pprotein6 + protein6[kk];
      carbss6 = carbss6 + carbs6[kk];
    }
    print("choles");
    print(cholestrol7);
    for (int kk = 0; kk < cholestrol7.length; kk++) {
      chol7 = chol7 + cholestrol7[kk];
      pprotein7 = pprotein7 + protein7[kk];
      carbss7 = carbss7 + carbs7[kk];
    }
    chartData1.add(ChartData(d1[0], chol));
    chartData1.add(ChartData(d2[0], chol2));
    chartData1.add(ChartData(d3[0], chol3));
    chartData1.add(ChartData(d4[0], chol4));
    chartData1.add(ChartData(d5[0], chol5));
    chartData1.add(ChartData(d6[0], chol6));
    chartData1.add(ChartData(d7[0], chol7));

    chartData2.add(ChartData(d1[0], pprotein));
    chartData2.add(ChartData(d2[0], pprotein2));
    chartData2.add(ChartData(d3[0], pprotein3));
    chartData2.add(ChartData(d4[0], pprotein4));
    chartData2.add(ChartData(d5[0], pprotein5));
    chartData2.add(ChartData(d6[0], pprotein6));
    chartData2.add(ChartData(d7[0], pprotein7));

    chartData3.add(ChartData(d1[0], carbss));
    chartData3.add(ChartData(d2[0], carbss2));
    chartData3.add(ChartData(d3[0], carbss3));
    chartData3.add(ChartData(d4[0], carbss4));
    chartData3.add(ChartData(d5[0], carbss5));
    chartData3.add(ChartData(d6[0], carbss6));
    chartData3.add(ChartData(d7[0], carbss7));
    print("pppr");
    print(d1[0]);
    print("ppprcarb");
    print(carbss7);
    print("ppprchols");
    print(chol7);
    print("ppprott");
    print(pprotein7);
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => Progress_screen2(
                    firstlist: [widget.firstlist[0]],
                    chartData2: chartData2,
                    chartData4: chartData3,
                    chartData6: chartData1,
                  )));
    });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color.fromARGB(245, 245, 245, 245),
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Color.fromARGB(245, 245, 245, 245),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 181, 217, 240),
            toolbarHeight: MediaQuery.of(context).size.height * 0.11,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 181, 217, 240),
              ),
              onPressed: () {},
            ),
            title: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Image.asset(
                'assets/others/logoNavy.png',
                fit: BoxFit.cover,
              ),

              //
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.02),
                ),
                water_title(context),
                water(context),
                food_title(context),
                food(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget water(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.01,
        right: MediaQuery.of(context).size.height * 0.01,
        top: MediaQuery.of(context).size.height * 0.015,
        bottom: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 150, 4, 89),
            Color.fromARGB(255, 151, 3, 89),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(50.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.015,
                    bottom: MediaQuery.of(context).size.height * 0.015,
                  ),
                  child: Text(
                    'View Your Weekly Progress of Drinking',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.052,
                      letterSpacing: 0.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.015,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget food(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.01,
        right: MediaQuery.of(context).size.height * 0.01,
        top: MediaQuery.of(context).size.height * 0.015,
        bottom: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 3, 131, 120),
            Color.fromARGB(255, 5, 167, 153),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(50.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.015,
                    bottom: MediaQuery.of(context).size.height * 0.015,
                  ),
                  child: Text(
                    'View Your Weekly Progress of Eating',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.052,
                      letterSpacing: 0.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.015,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget water_title(BuildContext context) {
    return InkWell(
      onTap: () async {
        var result = await http_get("water_prog", {
          "id": widget.firstlist[0],
        });
        print("Rrrrrrrr");
        List tem = result.data.toString().split("dates");

        List dates = tem[1].split(" ");
        List drink_days = tem[0].split(" ");
        print(dates);
        print(drink_days);

        print(tem);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => Progress_screen1(
                      firstlist: [widget.firstlist[0], tem[2]],
                      drink_days: drink_days,
                      dates: dates,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.05,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "Water Recap",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.01),
                child: Row(
                  children: <Widget>[
                    Text(
                      '',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                        letterSpacing: 0.5,
                        color: Color.fromARGB(255, 19, 33, 55),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.05,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget food_title(BuildContext context) {
    return InkWell(
      onTap: () {
        get_meals();
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.05,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "Food Recap",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.01),
                child: Row(
                  children: <Widget>[
                    Text(
                      '',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                        letterSpacing: 0.5,
                        color: Color.fromARGB(255, 19, 33, 55),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.05,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
