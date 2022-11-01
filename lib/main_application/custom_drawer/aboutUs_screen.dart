import 'package:google_fonts/google_fonts.dart';
import 'package:test1/app_theme.dart';
import 'package:flutter/material.dart';

class AboutUs_Screen extends StatefulWidget {
  @override
  _AboutUs_ScreenState createState() => _AboutUs_ScreenState();
}

class _AboutUs_ScreenState extends State<AboutUs_Screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(245, 245, 245, 245),
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Color.fromARGB(245, 245, 245, 245),
          body: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
              Container(
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
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.0),
              ),
              Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                child: Text(
                  'Our Application was created for the people who are caught up in their daily lives and have no time to take care of their bodies , we are here to give our assistance to those who need it , to provide you with a healthier life style . ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 19, 33, 55),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.03),
                child: Image.asset('assets/others/aboutUs.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
