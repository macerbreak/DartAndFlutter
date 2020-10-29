import 'package:flutter/material.dart';

class Data with ChangeNotifier{
  String _data = 'Top level Data 010101';

  String get getData => _data;

  void changeString(String newString){
    _data = newString;


    notifyListeners();// после изменения данных сообщает виджетам о том что бы они перерисовались
  }

}