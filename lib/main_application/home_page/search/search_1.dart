import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

String id = "";

class search_1_screen extends StatefulWidget {
  List firstlist;
  List food;
  List food_id;
  List food_name;
  List calories;
  List carbohydrates;
  List dietary;
  List fats;
  List vitamins;
  List sodium;
  List proteins;
  List sugar;
  List cholesterol;
  List calcuim;
  List iron;
  List potassium;
  List magnesium;
  List zinc;
  search_1_screen(
      {Key? key,
      this.animationController,
      required this.firstlist,
      required this.food,
      required this.food_id,
      required this.food_name,
      required this.calories,
      required this.carbohydrates,
      required this.dietary,
      required this.fats,
      required this.vitamins,
      required this.sodium,
      required this.proteins,
      required this.sugar,
      required this.cholesterol,
      required this.calcuim,
      required this.iron,
      required this.potassium,
      required this.magnesium,
      required this.zinc})
      : super(key: key);

  final AnimationController? animationController;
  @override
  _search_1_screenState createState() => _search_1_screenState();
}

class _search_1_screenState extends State<search_1_screen> {
  List letters = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  List index = [];
  String temp = "";
  int count = 0;
  List l = [];
  List l2 = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25
  ];

  void add_list() {
    for (int i = 0; i < count; i++) {
      if (l.isEmpty || l.length < count) l.add(i);
    }
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    "All the foods we have in our database are Listed below ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 9, 78, 153),
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ]).py4(),
            for (int i in l2) printchar(context, letters[i], i),
          ],
        ),
      ),
    );
  }

  Padding order(String tem, int k) {
    index = [];
    l = [];
    for (int i = 0; i < widget.food.length - 1; i++) {
      if (widget.food_name[i].length > tem.length) if (widget.food_name[i]
              .substring(0, tem.length)
              .toLowerCase() ==
          tem.toLowerCase()) {
        setState(() {
          index.add(i);
        });
      }
    }
    if (!index.isEmpty) {
      count = index.length;
      add_list();
    }
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
      ),
    );
  }

  Widget printchar(BuildContext context, String tem, int j) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.02,
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: size.height * 0.06,
                    ),
                    child: Text(
                      tem,
                      style: TextStyle(
                          color: Color(0xff132137),
                          fontSize: size.width * 0.057,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                // IconButton(
                //   icon: Icon(
                //     Icons.arrow_forward_ios,
                //     color: Color.fromARGB(255, 19, 33, 55),
                //   ),
                //   onPressed: () {},
                // ),
              ],
            ).py12(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  order(letters[j], j),
                  if (!index.isEmpty)
                    for (int i in l) foodlist(context, i)
                  else if (index.isEmpty)
                    SizedBox(
                      height: size.height * 0.05,
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding foodlist(BuildContext context, int i) {
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
              top: MediaQuery.of(context).size.width * 0.43,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.food_name[j],
                      style: TextStyle(
                          color: Color(0xFFFB475F).withOpacity(.65),
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Calories:" + widget.calories[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Dietary fiber:" + widget.dietary[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Carbohydrate:" + widget.carbohydrates[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Fat:" + widget.fats[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Vitamin:" + widget.vitamins[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Sodium:" + widget.sodium[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Protein:" + widget.proteins[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Calcium:" + widget.calcuim[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Suger:" + widget.sugar[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Cholesterol:" + widget.cholesterol[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Potassium:" + widget.potassium[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Iron:" + widget.iron[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(children: [
                      Text(
                        "Magnesium:" + widget.magnesium[j],
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 78, 153),
                            fontSize: MediaQuery.of(context).size.width * 0.031,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        ", Zinc:" + widget.zinc[j],
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
}
