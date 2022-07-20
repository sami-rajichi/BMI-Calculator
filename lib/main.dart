import 'package:bmi_calculator/BMIResultScreen.dart';
import 'package:bmi_calculator/BMIScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home':(context) => BMIScreen(),
        // '/result':(context) => BMIResult()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.yellow[800]))),
      home: BMIScreen(),
    );
  }
}