import 'package:flutter/material.dart';
import 'package:project_hris/asset/color.dart';
import 'package:project_hris/controller/logincontroller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController nikController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
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
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nikController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Welcome Back,',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "You've Been Missed",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 150.0),
                TextFormField(
                  controller: nikController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: AppColors.inputBackgroud,
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.person,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    hintText: 'Enter your NIK',
                    hintStyle: const TextStyle(color: AppColors.textInput),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusColor: Colors.white,
                  ),
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  obscureText: obscureText,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: AppColors.inputBackgroud,
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.key,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                    suffixIcon: IconButton(
                      icon: obscureText
                          ? const Icon(Icons.visibility_off_outlined,
                              color: Colors.white, size: 20)
                          : const Icon(Icons.visibility_outlined,
                              color: Colors.white, size: 20),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: AppColors.textInput),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    focusColor: Colors.white,
                  ),
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
                  cursorColor: Colors.white,
                  autofocus: false,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 60),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _onLoginButtonPressed();
                        fetchLoginUser(nikController, passwordController);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48.0),
                        backgroundColor: _isLoginButtonPressed
                            ? AppColors.primaryColor
                            : AppColors.secondaryColor,
                        side: BorderSide(
                            width: 1,
                            color: _isLoginButtonPressed
                                ? AppColors.primaryColor
                                : AppColors.secondaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text(
                        'LOGIN',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: _isLoginButtonPressed
                                ? AppColors.secondaryColor
                                : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
