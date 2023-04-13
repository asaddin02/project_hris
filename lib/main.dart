import 'package:flutter/material.dart';
import 'package:project_hris/splash_screen.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Absen Bos',
    home: const SplashScreenPage(),
    theme: ThemeData(
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme:const AppBarTheme(
        iconTheme: IconThemeData(
          color:
              Colors.white,
        ),
      ),
    ),
  ));
}
