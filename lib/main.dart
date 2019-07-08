import 'package:flutter/material.dart';
import 'Input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff10163B),
          scaffoldBackgroundColor: Color(0xff090F32),
          textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
      home: InputPage(),
    );
  }
}
