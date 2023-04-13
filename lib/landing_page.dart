import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_hris/auth/login.dart';
import 'package:project_hris/asset/color.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  bool _isLoginButtonPressed = false;

  void _onLoginButtonPressed() {
    setState(() {
      _isLoginButtonPressed = true;
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      Navigator.of(context)
          .push(
            CupertinoPageRoute(
              builder: (context) => const LoginPage(),
            ),
          )
          .then((value) => setState(() {
                _isLoginButtonPressed = false;
              }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "icon/icon.png",
                    width: 180,
                  ),
                  Text(
                    "TECH Solution",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      '"Modern Problem Need Modern Solution."',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 100),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _onLoginButtonPressed();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isLoginButtonPressed
                          ? AppColors.primaryColor
                          : Colors.black,
                      side: const BorderSide(width: 1, color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text(
                      'LOGIN',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                "Copyright 2023 | PT.Digiponic Maju Jaya",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
