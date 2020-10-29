import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
    @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  String data = 'Top level Data 010101';

  void _onChangeState(newData){
    setState((){
      data = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
      ),
      home: HomePage(data: data, onChange: _onChangeState,),
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
          title: Container(child:Text(data))
      ),
      body: Center(
        child: Widget1(data: data, onChange: onChange,),
      ),
    );
  }
}


class Widget1 extends StatelessWidget{
  final String data;
  final Function onChange;
  Widget1({@required this.data,
    @required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Widget2(data: data,
      onChange: onChange,
      ),
    );

  }
}


class Widget2 extends StatelessWidget{
  final String data;
  final Function onChange;
  Widget2({@required this.data,
            @required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MyTextField(onChange: onChange,),
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

class MyTextField extends StatelessWidget{
  final Function onChange;
 MyTextField({Key key, this.onChange}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newData) => onChange(newData),
    );

  }
}