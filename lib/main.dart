import 'package:flutter/material.dart';
import 'package:flutter_30_days_plan/days03/screen/days03.dart';
import 'package:flutter_30_days_plan/days04/days04.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Montserrat",
      ),
      home: Days04(),
      debugShowCheckedModeBanner: false,
    );
  }
}
