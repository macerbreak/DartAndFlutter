import 'package:flutter/material.dart';

class MyRowColumn extends StatelessWidget{//StatelessWidget обозначает то что наш клас не манипулирует внутри данными которые должны изменять интерфейс
  @override//любой StatelessWidget должен переопределять метод под названием build
  Widget build(BuildContext context){//Основной метод который должен возвращать обьект MaterialApp
    //Строка и Колонка это класы которые содержат и размещают виджеты
    //Виджеты что находятся внутри называются потомками children
    // виджеты строки и колонки не прокручиваются для этого нужно использовать listView
    return Scaffold(
      appBar: AppBar(
        title: Text('Верстка'),
      ),
      body:Container(//контейнер принимает только один виджет поетому у него параметр child в котором мы и работаем
        color: Colors.grey,
        child: Row(
            mainAxisSize: MainAxisSize.max,//главная ось в строках идет справа на левво а другорядная сверху вниз// mainAxisSize устанавливает размер колонки/строки
            mainAxisAlignment: MainAxisAlignment.center,//mainAxisAlignment выравнивание по главной оси, имеет 6 значений
            crossAxisAlignment: CrossAxisAlignment.end,//crossAxisAlignment выравнивание по поперечной оси, имеет 6 значений
            children: <Widget>[
              ColorBox(),
              BiggerColorBox(),
              ColorBox(),
            ]
        ),

      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.redAccent[400], // 400 обозначает фон цвета
        border: Border.all(),
      ),
    );
  }
}
class BiggerColorBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.redAccent[400], // 400 обозначает фон цвета
        border: Border.all(),
      ),
    );
  }
}