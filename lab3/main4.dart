import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child:MaterialApp(
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
  final String data;
  final Function onChange;
  HomePage({@required this.data,
    @required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(child:Text(context.watch<Data>().getData))
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
          MyTextField(),
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
      child: Text(context.watch<Data>().getData),
    );

  }
}

class MyTextField extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newData) => context.read<Data>().changeString(newData),
    );

  }
}
