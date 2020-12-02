import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
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
    useFuture2();
    return Scaffold(

    );
  }
}

useFuture2() async{
  print('before future');
  try{
    var result = await fetchUser(125);
    print('result');
  }
  catch(e){
    print(e);
  }
  print('after future');
}

Future<Map<String, String>> fetchUser(int userId) async {

  var response = await http.get('https://jsonplaceholder.typicode.com/users/$userId');
  var map = json.decode(response.body) as Map;
  return {'id': map['id'].toString(), 'name' : map['name']};

  //return Future.delayed(Duration(seconds: 1), ()=> throw Exception('Exception in future'));
}
