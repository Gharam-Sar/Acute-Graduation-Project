import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../http.dart';
import '../../../notification.dart';
import '../../navigation_home_screen.dart';

String id = "";

class search_2_screen extends StatefulWidget {
  List firstlist;
  search_2_screen({Key? key, this.animationController, required this.firstlist})
      : super(key: key);

  final AnimationController? animationController;
  @override
  _search_2_screenState createState() => _search_2_screenState();
}

class _search_2_screenState extends State<search_2_screen> {
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
    setState(() {});
  }

  String res = "";
  List<String> food = [];
  List food_2 = [];
  List food_id = [];
  List food_name = [];
  List calories = [];
  List carbohydrates = [];
  List dietary = [];
  List fats = [];
  List vitamins = [];
  List sodium = [];
  List proteins = [];
  List sugar = [];
  List cholesterol = [];
  List calcuim = [];
  List iron = [];
  List potassium = [];
  List magnesium = [];
  List zinc = [];

  List index = [];
  String temp = "";
  getfood() async {
    var result = await http_get("food", {});
    res = result.data;
    food = res.split("&");

    for (int i = 0; i < food.length - 1; i++) {
      if (food_2.isEmpty || food_2.length < food.length - 1) {
        food_2 = food[i].split(",");
        food_id.add(food_2[0]);
        food_name.add(food_2[1]);
        calories.add(food_2[2]);
        carbohydrates.add(food_2[3]);
        dietary.add(food_2[4]);
        fats.add(food_2[5]);
        vitamins.add(food_2[6]);
        sodium.add(food_2[7]);
        proteins.add(food_2[8]);
        sugar.add(food_2[9]);
        cholesterol.add(food_2[10]);
        calcuim.add(food_2[11]);
        iron.add(food_2[12]);
        potassium.add(food_2[13]);
        magnesium.add(food_2[14]);
        zinc.add(food_2[15]);
      }
    }
  }

  int count = 0;
  List l = [];
  bool show = false;
  String t = "";
  int ind = 0;
  String f_id = "";
  @override
  void initState() {
    getfood();

    super.initState();
  }

  void add_list() {
    for (int i = 0; i < count; i++) {
      if (l.isEmpty || l.length < count) l.add(i);
    }
  }

  TextEditingController _controller = new TextEditingController();
  DateTime? tsdate;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    show = widget.firstlist[2];
    id = widget.firstlist[0];
    ind = widget.firstlist[1];
    print(DateTime.now().millisecondsSinceEpoch);
    DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(
        DateTime.now().millisecondsSinceEpoch);

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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 19, 33, 55),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ]),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.height * 0.035,
                  ),
                  child: Text(
                    "Enter the name of the item you want to search for",
                    style: TextStyle(
                        color: Color.fromARGB(255, 9, 78, 153),
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ]),
            CupertinoSearchTextField(
              controller: _controller,
              backgroundColor: Colors.white,
              itemSize: size.height * 0.041,
              prefixInsets: EdgeInsets.only(left: size.height * 0.025),
              padding: EdgeInsets.only(
                top: size.height * 0.015,
                bottom: size.height * 0.015,
              ),
              itemColor: Color.fromARGB(255, 9, 78, 153),
              onSuffixTap: () {
                setState(() {
                  index = [];
                  l = [];
                  temp = "";
                  _controller.clear();
                });
              },
              onChanged: (value) {
                temp = value;
                index = [];
                l = [];
                for (int i = 0; i < food.length - 1; i++) {
                  if (food_name[i].length == temp.length) {
                    if (food_name[i].toLowerCase() == temp.toLowerCase()) {
                      // print(food_name[i]);
                      index.add(i);
                    }
                  }
                  if (food_name[i].length > temp.length) if (food_name[i]
                          .substring(0, temp.length)
                          .toLowerCase() ==
                      temp.toLowerCase()) {
                    // print(food_name[i]);
                    index.add(i);
                  }
                }
                if (!index.isEmpty) {
                  count = index.length;
                  add_list();
                }
              },
            ).px16().py20(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  if (!index.isEmpty && temp != "")
                    for (int i in l) foodlist(context, i),
                  if (index.isEmpty && temp != "")
                    Text(
                      "No item found",
                      style: TextStyle(
                          color: Color.fromARGB(255, 9, 78, 153),
                          fontSize: size.width * 0.057,
                          fontWeight: FontWeight.w500),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget foodlist(BuildContext context, int i) {
    int j = index[i];
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.03,
          left: MediaQuery.of(context).size.width * 0.03),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.56,
        width: MediaQuery.of(context).size.width * 0.72,
        child: Stack(
          children: <Widget>[
            // Big light background
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.54,
                width: MediaQuery.of(context).size.width * 0.67,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            // Food Image
            Positioned(
              top: -72,
              left: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.43,
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/others/food1.jpg'),
                  )),
            ),
            // Price

            Positioned(
              right: 20,
              top: 60,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.15,
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: show
                      ? Color(0xFFFB475F).withOpacity(.65)
                      : Color.fromARGB(255, 255, 255, 255),
                ),
                child: Center(
                    child: show
                        ? IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            onPressed: () {
                              setState(() {
                                t = food_name[j];
                                f_id = food_id[j];
                              });
                              showAlertDialog(context);
                            },
                          )
                        : null),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width * 0.43,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      food_name[j],
                      style: TextStyle(
                          color: Color(0xFFFB475F).withOpacity(.65),
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Calories:" + calories[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Dietary fiber:" + dietary[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Carbohydrate:" + carbohydrates[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Fat:" + fats[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Vitamin:" + vitamins[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Sodium:" + sodium[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Protein:" + proteins[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Calcium:" + calcuim[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Suger:" + sugar[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Cholesterol:" + cholesterol[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Potassium:" + potassium[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Iron:" + iron[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Magnesium:" + magnesium[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Zinc:" + zinc[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController _textFieldController = TextEditingController();

  String codeDialog = "";
  String valueText = "";
  addmeal() async {
    var result = await http_post("setmeal", {
      "user_id": id,
      "food_id": f_id,
      "meal_index": ind,
      "time": tsdate,
      "amount": valueText
    });
    print(result);
    var result2 = await http_get("usermeals", {
      "id": id,
    });
    m = result2.data.split("&");

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
      var result2 = await http_get("getmealname", {
        "id": meal_id[j[l]],
      });
      if (Meals.isEmpty || Meals.length < j.length) {
        Meals.add(result2.data);
      }
    }
    var result3 = await http_get("bodyinfo", {
      "id": id,
    });

    var arr = result3.data.split(' ');
    String weight = arr[0];
    String height = arr[1];
    String gender = arr[2];
    String name = arr[3];
    String datef = DateFormat('yyyy-MM-dd').format(DateTime.now());
    print(datef);
    var result4 = await http_get("getimages", {
      "date": datef,
    });

    List arrrr = result4.data.split("\"linklinklink");
    for (int lll = 0; lll < arrrr.length; lll++) {
      String ttt = arrrr[lll].toString().replaceAll(" ", "");
      images.add(ttt);
    }
    // if (f_id == "14" || f_id == "35") {
    //   DateTime date = DateTime.now();
    //   print("hh");
    //   create_dis_notification(date.weekday);
    // }
    if (result.ok)
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => NavigationHomeScreen(
                      firstlist: [id, weight, height, gender, name],
                      Meals: Meals,
                      meal_amount: meal_amount,
                      images: images,
                    )));
      });
  }

  showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)), //this right here
            child: Container(
              height: MediaQuery.of(context).size.height * 0.43,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.004),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Color(0xff132137),
                      ),
                      onPressed: () {
                        _textFieldController.clear();
                        Navigator.pop(context);
                      },
                    ).px12(),
                    Text(
                      'In grams, add the amount you ate ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 9, 78, 153),
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.006),
                    TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Color.fromARGB(255, 28, 48, 82),
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.w500),
                      onChanged: (value) {
                        setState(() {
                          valueText = value;
                        });
                      },
                      controller: _textFieldController,
                      decoration: InputDecoration(hintText: ""),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.033),
                    AnimatedPadding(
                      duration: const Duration(milliseconds: 500),
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.height * 0.07,
                          right: MediaQuery.of(context).size.height * 0.07),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.42,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 181, 217, 240),
                            borderRadius: BorderRadius.circular(20)),
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              if (valueText != "") {
                                addmeal();
                              } else
                                print("enter the amount");
                            });

                            _textFieldController.clear();
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Color(0xff132137),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.07,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
