import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/main_application/custom_drawer/edit_profile.dart';
import 'package:test1/main_application/custom_drawer/information.dart';
import 'package:test1/main_application/custom_drawer/privacy.dart';
import 'package:test1/main_application/custom_drawer/reset_password.dart';

import 'notification.dart';

class Settings_Screen extends StatefulWidget {
  List firstlist;
  Settings_Screen({Key? key, required this.firstlist}) : super(key: key);

  @override
  _Settings_ScreenState createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<Settings_Screen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 181, 217, 240),
        toolbarHeight: MediaQuery.of(context).size.height * 0.11,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 181, 217, 240),
          ),
          onPressed: () {},
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
              color: Color.fromARGB(255, 181, 217, 240),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "Application settings can be customized according to your preferences",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 71, 104, 158),
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            newMethod(context, size, ' Account', Icons.person, 0),
            newMethod(context, size, ' About Me', Icons.person, 1),
            newMethod(context, size, 'Change Password', Icons.key_outlined, 2),
            newMethod(context, size, ' Privacy & Security', Icons.lock, 3),
            newMethod(context, size, 'Notification', Icons.notifications, 4),
          ],
        ),
      ),
    );
  }

  Padding newMethod(
      BuildContext context, Size size, String st, IconData next, int i) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.height * 0.015, vertical: size.height * 0.015),
      child: FlatButton(
          padding: EdgeInsets.only(
              left: size.height * 0.03,
              right: size.height * 0.025,
              top: size.height * 0.009,
              bottom: size.height * 0.01),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Color.fromARGB(255, 216, 236, 248).withOpacity(0.5),
          onPressed: () {
            callpage(i, context, widget.firstlist[0]);
          },
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  next,
                  color: Color.fromARGB(255, 19, 33, 55),
                  size: MediaQuery.of(context).size.height * 0.045,
                ),
                onPressed: () {
                  callpage(i, context, widget.firstlist[0]);
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.009),
                  child: Text(
                    st,
                    style: TextStyle(
                        // color: Color(0xff132137),
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromARGB(255, 19, 33, 55),
                ),
                onPressed: () {
                  callpage(i, context, widget.firstlist[0]);
                },
              ),
            ],
          )),
    );
  }
}

void callpage(int i, BuildContext context, String id) {
  if (i == 0) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => edit_profile_page(
                  firstlist: [id],
                )));
  } else if (i == 1) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => info_page(
                  firstlist: [id],
                )));
  }
  if (i == 2) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => resete_password_page(
                  firstlist: [id],
                )));
  }
  if (i == 3) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => privacy_page(
                  firstlist: [id],
                )));
  }
  if (i == 4) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => notification_page(
                  firstlist: [id],
                )));
  }
}
