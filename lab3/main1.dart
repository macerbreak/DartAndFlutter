import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String data = 'Top level Data 010101';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
      ),
      home: HomePage(data: data),
    );
  }
}

class HomePage extends StatelessWidget{
  final String data;
  HomePage({@required this.data});//  @required инициализирует свойство

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(child:Text(data))
      ),
      body: Center(
        child: Widget1(data: data),
      ),
    );
  }
}


class Widget1 extends StatelessWidget{
  final String data;
  Widget1({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Widget2(data: data),
      );

  }
}


class Widget2 extends StatelessWidget{
  final String data;
  Widget2({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(child:Text('Widget2')),
          Widget3(data: data),
        ],
      ),
    );

  }
}

class Widget3 extends StatelessWidget{
  final String data;
  Widget3({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(data),
    );

  }
}