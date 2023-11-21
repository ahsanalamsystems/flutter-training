import 'package:flutter/material.dart';
import 'package:lecture_one/dio/weather-dio.dart';
import 'package:lecture_one/http/weather.dart';
import 'package:lecture_one/socket/socket.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const WeatherHTTPPage(),
    const WeatherDioPage(),
    SocketPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Http',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Dio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Socket',
          ),
        ],
      ),
    );
  }
}
