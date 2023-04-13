import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

Future<LoginUser> fetchLoginUser(TextEditingController nikController,
    TextEditingController passController) async {
  final dio = Dio();
  if (nikController.text.isNotEmpty && passController.text.isNotEmpty) {
    var bytes = utf8.encode(passController.text);
    var digest = sha256.convert(bytes);
    final response = await dio.post('http://192.168.1.30:80/api/login',
        data: {'nik': nikController.text, 'password': digest.toString()});
    if (response.statusCode == 200) {
      return LoginUser.fromJson(response.data);
    } else {
      throw Exception('Failed to load LoginUser');
    }
  } else {
    throw Exception('nikController.text or passController.text is empty');
  }
}

class LoginUser {
  final int nik;
  final String password;

  const LoginUser({
    required this.nik,
    required this.password,
  });

  factory LoginUser.fromJson(Map<dynamic, dynamic> json) {
    if (json['nik'] == null) {
      throw Exception('Invalid nik value: null');
    }
    return LoginUser(
      nik: json['nik'],
      password: json['password'],
    );
  }
}
