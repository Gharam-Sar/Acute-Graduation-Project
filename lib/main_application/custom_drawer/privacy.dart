import 'package:google_fonts/google_fonts.dart';
import 'package:test1/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test1/http.dart';

class privacy_page extends StatefulWidget {
  List firstlist;
  privacy_page({Key? key, required this.firstlist}) : super(key: key);

  @override
  _privacy_pageState createState() => _privacy_pageState();
}

class _privacy_pageState extends State<privacy_page> {
  authUser(value) async {
    var result = await http_post("change-auth", {
      "id": widget.firstlist[0],
      "auth": value,
    });

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 19, 33, 55),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
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
      body: Container(
        color: Color.fromARGB(245, 245, 245, 245),
        padding: EdgeInsets.only(
            left: size.height * 0.04, right: size.height * 0.04),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.047,
              ),
            ),
            Image.asset(
              'assets/others/privacy.png',
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.047,
              ),
            ),
            Text(
              "Two-factor authentication is a better way to secure your account . if you enabled it, you'll be asked to enter a verification code sent to your e-mail.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 24, 104, 141),
                fontSize: size.height * 0.023,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.037,
              ),
            ),
            Transform.scale(
              scale: 1.5,
              child: CupertinoSwitch(
                value: isstate.state,
                activeColor: Color.fromARGB(255, 24, 104, 141),
                onChanged: (value) {
                  isstate.state = value;

                  setState(() {
                    authUser(value);
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.017,
              ),
            ),
            Text(
              "Two-factor authentication is ${isstate.state ? "On" : "Off"}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 24, 104, 141),
                  fontSize: size.width * 0.051,
                  fontWeight: FontWeight.w700),
            ),
          ]),
        ),
      ),
    );
  }
}

class isstate {
  static bool state = false;
}
