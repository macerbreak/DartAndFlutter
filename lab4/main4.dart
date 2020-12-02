import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sharedpreferences',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage>{
  String value = 'Text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value),
            SizedBox(height: 100),
            FlatButton(
              child: Text('Read'),
              onPressed: () async {
                ShesaredPreferenc prefs = await SharedPreferences.getInstance();
                setState(() {
                  value = prefs.getString('TestString_Key') ??  "Value not found";
                });
              },
            ),
            FlatButton(
              child: Text('Store'),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                setState(() {
                  prefs.setString('TestString_Key', 'New text');
                });
              },
            ),
            FlatButton(
              child: Text('Delete'),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                setState(() {
                   prefs.remove('TestString_Key');
                });
              },
            )
          ],
        )
      )
    );
  }
}
