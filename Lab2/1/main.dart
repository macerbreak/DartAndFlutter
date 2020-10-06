import 'package:flutter/material.dart';
import 'package:layout_row_colomn/row_colomn.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,//primarySwatch говорит о том какими должны быть наши основные цвета
      ),
      home: MyRowColumn(),// параметр home обозначает основную страницу приложения и то что будет показано как основное
    );
  }
}

