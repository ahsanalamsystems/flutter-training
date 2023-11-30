import 'package:flutter/material.dart';
import 'package:lecture_one/pages/firebase.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [const FirebasePage()];

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
              label: 'Firebase',
            )
          ],
        ));
  }
}
