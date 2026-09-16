import 'package:flutter/material.dart';
import 'package:flutter_30_days_plan/days05/provider/countor_provider.dart';
import 'package:flutter_30_days_plan/days06/bloc/todo_bloc.dart';
import 'package:flutter_30_days_plan/days06/days06.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    BlocProvider(create: (_) => TodoBloc(), child: const MyApp()),
    // ChangeNotifierProvider(
    //   create: (_) => CountorProvider(),
    //   child: const MyApp(),
    // ),
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
      home: Days06(),
      debugShowCheckedModeBanner: false,
    );
  }
}
