import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Главное окно')),
      body: Center(child:Column (children:<Widget>[
        RaisedButton(onPressed: (){
          Navigator.pushNamed(context, '/second');
        }, child: Text('Открыть второе окно')),
        RaisedButton(onPressed: (){
          Navigator.pushNamed(context, '/second/123');
        }, child: Text('Открыть второе окно 123')),
      ])),
    );
  }
}

class SecondScreen extends StatelessWidget {
  String _id;

  SecondScreen({String id}): _id = id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Второе окно $_id')),
      body: Center(child: RaisedButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text('Назад'),),),
    );
  }
}




void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(BuildContext context) => MainScreen(),
      '/second':(BuildContext context) => SecondScreen(),
    },
    onGenerateRoute: (routeSettings) {// onGenerateRoute добавляем поскольку в routes могут быть записаны только статичиские маршруты
      // позволяет обрабатывать маршруты которых там нет
      var path = routeSettings.name.split('/');// обрабатываем значения которые поступают в функцию событием, текстовое значение маршрутов разбиваем в списке разделителем /

      if (path[1] == 'second'){
        return new MaterialPageRoute(builder: (context) => new SecondScreen(id:path[2]),
            settings: routeSettings);
      }
    },
  ));
}