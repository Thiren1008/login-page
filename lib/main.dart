import 'package:flutter/material.dart';
import 'package:sample/login.dart';
//import 'package:sample/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "sign up",
      theme: ThemeData(primaryColorLight: Colors.deepPurple),
      home: LoginForm(),
    );
  }
}
