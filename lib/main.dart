import 'package:cctracker/CCList.dart';//импортируем наш клас CCList который используем для отображения всего на экране в параметре home
import 'package:flutter/material.dart';
//Должен быть в каждом dart файле
// Все елементы на екране программы на флаттере это виджеты
void main() => runApp(CCTracker());//главный клас который отвечает за создание окна приложения

class CCTracker extends StatelessWidget{//StatelessWidget обозначает то что наш клас не манипулирует внутри данными которые должны изменять интерфейс
  @override//любой StatelessWidget должен переопределять метод под названием build
  Widget build(BuildContext context){//Основной метод который должен возвращать обьект MaterialApp
    return MaterialApp(//исходит из пакета flutter/material.dart и является базовой оболочкой нашего приложения, создает контейнер для приложения
      title: 'Awesome CC Tracker',
      theme: ThemeData(// основная тема
        primarySwatch: Colors.blue//primarySwatch говорит о том какими должны быть наши основные цвета
      ),
      home: CCList()  // параметр home обозначает основную страницу приложения и то что будет показано как основное
    );
  }
}

