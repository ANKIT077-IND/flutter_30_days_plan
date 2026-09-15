import 'package:flutter/material.dart';
import 'package:flutter_30_days_plan/days03/screen/days03.dart';
import 'package:flutter_30_days_plan/days04/days04.dart';
import 'package:flutter_30_days_plan/days05/days05.dart';
import 'package:flutter_30_days_plan/days05/provider/countor_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CountorProvider(),
      child: const MyApp(),
    ),
  );
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
      home: Days05(),
      debugShowCheckedModeBanner: false,
    );
  }
}
