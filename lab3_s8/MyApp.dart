import 'package:flutter/material.dart';
import 'package:lab3/pages/DevisesPage.dart';
import 'package:lab3/pages/HumidityPage.dart';
import 'package:lab3/pages/LightPage.dart';
import 'package:lab3/pages/TemperaturePage.dart';




class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> pages = [
    TemperaturePage(),
    HumidityPage(),
    LightPage(),
    DevicesPage()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: 'Temperature',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.invert_colors),
              label: 'Humidity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb),
              label: "Light",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wifi),
              label: "Connect",
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.lightBlueAccent,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}
