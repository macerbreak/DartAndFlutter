import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    useFuture();
    return Scaffold(

    );
  }
}

void useFuture(){
  print("before future");
  fetchUser(5).then((value){
    value['processed'] = 'true';
    return value;
  })
      .then((value)=> print (value))
      .catchError((e){print(e);});
  print('after future');
}

Future<Map<String, String>> fetchUser(int userId){
  return Future.delayed(Duration(seconds: 1), ()=> {'id': userId.toString(), 'name': 'Vova'});
  //return Future.delayed(Duration(seconds: 1), ()=> throw Exception('Exception in future'));
}
