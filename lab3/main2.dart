import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String data = 'Top level Data 010101';
  @override
  Widget build(BuildContext context) {
    return Provider<String>(
    create: (context) => data,
      child: MaterialApp(

      theme: ThemeData(

        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
      ),
      home: HomePage(),
    ),
    );
  }
}

class HomePage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(child:Text(context.watch<String>()))
      ),
      body: Center(
        child: Widget1(),
      ),
    );
  }
}


class Widget1 extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Widget2(),
    );

  }
}


class Widget2 extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(child:Text('Widget2')),
          Widget3(),
        ],
      ),
    );

  }
}

class Widget3 extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(context.watch<String>()),
    );

  }
}
