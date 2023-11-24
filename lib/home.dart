import 'package:flutter/material.dart';
import 'package:lecture_one/cache/cache.dart';
import 'package:lecture_one/database/product.dart';
import 'package:lecture_one/dio/weather.dio.dart';
import 'package:lecture_one/http/weather.dart';
import 'package:lecture_one/preference/preference.dart';
import 'package:lecture_one/socket/socket.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const WeatherHTTPPage(),
    const WeatherDioPage(),
    // const SocketPage(),
    const PreferencePage(),
    const ProductPage(),
    const CachePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pinkAccent,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 100, 136, 212),
            icon: Icon(Icons.wifi_rounded),
            label: 'Http',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 100, 136, 212),
            icon: Icon(Icons.business),
            label: 'Dio',
          ),
          // BottomNavigationBarItem(
          //   backgroundColor: Color.fromARGB(255, 100, 136, 212),
          //   icon: Icon(Icons.chat),
          //   label: 'Socket',
          // ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 100, 136, 212),
            icon: Icon(Icons.local_activity),
            label: 'Preference',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 100, 136, 212),
            icon: Icon(Icons.data_array),
            label: 'Database',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 100, 136, 212),
            icon: Icon(Icons.cached),
            label: 'Cache',
          ),
        ],
      ),
    );
  }
}
