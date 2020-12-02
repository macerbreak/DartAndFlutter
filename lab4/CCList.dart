import 'package:cctracker/CCData.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;// используем для работы с http
import 'dart:convert';// для использования json
class CCList extends StatefulWidget{//StatefulWidget потому что в нашем класе используем данные которые меняются
 @override
  State<StatefulWidget> createState() {// клас который мы должны переопределять когда используем StatefulWidget, в нем мы должны создать инстанс(состояние) обьекта
   return CCListState();// возвращаем состояние виджета CCList грубо говоря StatefulWidget должен возвращать StatelessWidget что в нас и происходит
  }


}

class CCListState extends State<CCList>{// создаем клас который благодаря State<CCList> является состоянием для виджета класса CCList
  //List<CCData> data = [//заполняем список с валютами используя конструктор класа CCData
    //CCData(name: 'Bitcoin', symbol:'BTC', rank: 1, price: 6000),
    //CCData(name: 'Etherium', symbol:'ETH', rank: 2, price: 200)
  //];
  List<CCData> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // основной компонент который рендерит(визуализация) страницу на экране
        appBar: AppBar( //грубо говоря хедер приложения
          title: Text('Awesome CC Tracker'),
        ),
        body: Container( // то же самое что и div в HTML
            child: ListView( //child используется для работы с обьектами внутри контейнера //ListView используется для отображения списка
              children: _buildList(), //то же самое что и child только у каждого виджета по своему, достаточно навести курсор что бы узнать что использовать child или children
            )

        ),
        floatingActionButton: FloatingActionButton(//кнопка справа внизу, можно поместить иконку,
            child: Icon(Icons.refresh),
          onPressed: () => _loadCC(),//по нажатию на кнопку вызываем метод _loadCC()
        ),
    );
  }

  _loadCC() async{
    final response = await http.get('https://api.coincap.io/v2/assets?limit=10');//пытаемся получить данные по нашей ссылке
    if (response.statusCode == 200){//200 это успешный отклик от сервера
      var allData = (json.decode(response.body) as Map)['data'];//декодируем нашу информацию в map и помещаем ее в allData
      var ccDataList = List<CCData>();// конвертируем это все в список CCData
      allData.forEach((val){// выбираем нужные данные для каждой валюты и сохраняем их в переменной record
        var record = CCData(
            name: val['name'],
            symbol: val['symbol'],
            price: double.parse(val['priceUsd']),
            rank: int.parse(val['rank'])
        );
        ccDataList.add(record);
      });
      setState(() {
        data = ccDataList;
      });
    }
  }

  List<Widget> _buildList(){
    return data.map((CCData f) => ListTile( // список с параметрами title, subtitle, leading, trailing
      subtitle: Text(f.symbol),// находится под title
      title: Text(f.name),
      leading: CircleAvatar(child: Text(f.rank.toString())),//leading то что показывается в начале елемента//CircleAvatar контейнер в форме круга
      trailing: Text('\$${f.price.toString()}') ,//trailing отображает в краю справа
    )).toList(); //toString() конвертирует f.rank в строку//toList() конвертирует весь наш map в list
  }
}
