import 'package:flutter/material.dart';
import 'package:lecture_one/home.dart';
import 'package:lecture_one/http/weather.dart';
import 'package:lecture_one/http/weather.http.service.dart';
import 'package:lecture_one/signin.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
