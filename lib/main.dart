import 'package:flutter/material.dart';
import 'view/login.dart';
import 'model/usermodel.dart';
import 'view/update.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'MusicHub',
      routes: {
        "/": (BuildContext context) {
          return const Login();
        },
        "/usermodel": (BuildContext context) {
          return const Usermodel();
        },
        "/update": (BuildContext context) {
          return const UpdateUser();
        },

      },
    );
  }
}