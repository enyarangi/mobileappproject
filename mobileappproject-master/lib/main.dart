import 'package:flutter/material.dart';
import './view/loginpage.dart';
//import './view/loginpage.dart';
void main() => runApp(MyFashionApp());

class MyFashionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
theme: new ThemeData(scaffoldBackgroundColor: Colors.grey),
      home: LoginPage(),
      
    );
  }

}