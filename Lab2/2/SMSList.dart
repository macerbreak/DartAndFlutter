import 'package:flutter_app/Bar.dart';
import 'package:flutter_app/SMSData.dart';
import 'package:flutter/material.dart';
import 'dart:convert';// для использования json
class SMSList extends StatefulWidget{//StatefulWidget потому что в нашем класе используем данные которые меняются
  @override
  State<StatefulWidget> createState() {// клас который мы должны переопределять когда используем StatefulWidget, в нем мы должны создать инстанс(состояние) обьекта
    return SMSListState();// возвращаем состояние виджета CCList грубо говоря StatefulWidget должен возвращать StatelessWidget что в нас и происходит
  }


}




class SMSListState extends State<SMSList>{// создаем клас который благодаря State<CCList> является состоянием для виджета класса CCList
  List<Bar> databar = [
    Bar(symbol: Icon(Icons.people_outline), name: "New group" ),
    Bar(symbol:Icon(Icons.enhanced_encryption), name: "New secret chat" ),
    Bar(symbol:Icon(Icons.visibility), name: "New chanel" ),
    Bar(symbol:Icon(Icons.person), name: "Contacts" ),
    Bar(symbol:Icon(Icons.call), name: "Calls" ),
    Bar(symbol:Icon(Icons.save_alt), name: "Saved" ),
    Bar(symbol:Icon(Icons.settings), name: "Settings" ),
    Bar(symbol:Icon(Icons.person_add), name: "Add Friends" ),
    Bar(symbol:Icon(Icons.alternate_email), name: "Questions" ),
    ];

  List<SMSData> data = [//заполняем список с валютами используя конструктор класа CCData
    SMSData(name: 'Victor', symbol:'Hello!', rank: 1, price: 10, avatar: 'https://s0.rbk.ru/v6_top_pics/media/img/5/96/755039177971965.jpg'),
    SMSData(name: 'Andry', symbol:"What's up?", rank: 2, price: 150, avatar: 'https://b1.m24.ru/c/1192825.jpg'),
    SMSData(name: 'Mark', symbol:'Do you wanna celebrate weakend with me?', rank: 1, price: 3, avatar: 'https://s0.rbk.ru/v6_top_pics/media/img/5/59/755869560832595.jpg'),
    SMSData(name: 'CJ', symbol:'What about Big Smoke?', rank: 2, price: 1, avatar: 'https://vignette.wikia.nocookie.net/gtawiki/images/7/70/CJ-GTASA.png/revision/latest/top-crop/width/360/height/360?cb=20190612091918'),
    SMSData(name: 'Boss', symbol:'I am waiting your report!', rank: 1, price: 4, avatar: 'https://s0.rbk.ru/v6_top_pics/media/img/8/22/755895443908228.jpg'),
    SMSData(name: 'Helen', symbol:'Do you like It?', rank: 2, price: 2, avatar: 'https://www.1obl.ru/upload/resize_cache/iblock/0e2/827_465_2/son.jpg'),
    SMSData(name: 'Mary', symbol:"Let's play!", rank: 1, price: 1, avatar: 'https://cdnimg.rg.ru/img/content/177/18/63/1000s_d_850.jpg'),
    SMSData(name: 'John', symbol:'Are u going to gym?', rank: 2, price: 60, avatar: 'https://img.gazeta.ru/files3/723/11725723/urod-pic685-685x390-29509.jpg'),
    SMSData(name: 'Lisa', symbol:'I like Basketball!))', rank: 1, price: 11, avatar: 'https://s1.cdn.teleprogramma.pro/wp-content/uploads/2019/04/65577547b37c58acb443d20011e487dd.jpg'),
    SMSData(name: 'Ben', symbol:'Good!)', rank: 2, price: 2, avatar: 'https://storage.theoryandpractice.ru/tnp/uploads/image_unit/000/127/562/image/base_7e807ef65c.jpg'),
    SMSData(name: 'Deputat', symbol:'Deal!!', rank: 1, price: 6, avatar: 'https://www.unn.com.ua/uploads/news/2020/09/29/434c33ccdc984aef9e16e6e35271baf7fe96c8f7.jpg'),
    SMSData(name: 'Bear', symbol:'OK', rank: 2, price: 7, avatar: 'https://im.kommersant.ru/Issues.photo/NEWS/2020/08/08/KMO_177328_00205_1_t218_161255.jpg'),
    SMSData(name: 'Wolf', symbol:'No I am not', rank: 1, price: 5, avatar: 'https://www.yesasia.ru/wp-content/uploads/2019/12/5e2e731d42fc4122afe8dc86e9c22f9e.jpeg'),
    SMSData(name: 'Katerin', symbol:'In the end', rank: 2, price: 1, avatar: 'https://im.kommersant.ru/Issues.photo/OGONIOK/2019/020/KMO_109149_00001_1_t218_235015.jpg'),
    SMSData(name: 'Alex', symbol:'To start', rank: 1, price: 1, avatar: 'https://s.mind.ua/img/forall/a/202163/99.jpg?1601378417'),
    SMSData(name: 'Vortex', symbol:'Exit', rank: 2, price: 5, avatar: 'https://www.cheltv.ru/wp-content/uploads/2019/11/chastye-300x191.jpg'),
    SMSData(name: 'Shadow', symbol:'I am in cinema', rank: 1, price: 4, avatar: 'https://razlich.ru/wp-content/uploads/2017/05/happy.png'),
    SMSData(name: 'Kate', symbol:'cannot talk', rank: 2, price: 2, avatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQvF2akVK1g1fS1o5nIKnD-6rWt1c3-_BvEEg&usqp=CAU'),
    SMSData(name: 'Mars', symbol:'Good game!', rank: 1, price: 60, avatar: 'https://obzor.city/data/images/news_2020/08/belikov/dsc_7843.jpg'),
    SMSData(name: 'Viki', symbol:'Thank you!', rank: 2, price: 2, avatar: 'https://static.mk.ru/upload/entities/2017/02/17/articles/detailPicture/63/09/77/d68665341_4619603.jpg'),
    SMSData(name: 'Mila', symbol:'In Sunday', rank: 1, price: 8, avatar: 'https://icdn.lenta.ru/images/2019/08/26/15/20190826152935568/square_320_1db872863f1ab08a16a7c9dcb9f00476.jpg'),
    SMSData(name: 'Bob', symbol:'Our penalty is  6000 dolars((', rank: 2, price: 9, avatar: 'https://im.kommersant.ru/Issues.photo/CORP/2019/03/01/KMO_111307_24199_1_t218_162046.jpg'),
    SMSData(name: 'Marvy', symbol:'We win!))', rank: 1, price: 1, avatar: 'https://icdn.lenta.ru/images/2019/10/20/13/20191020135310813/square_320_a99e8c620efe22de164ae017a82ad6ce.jpg'),
    SMSData(name: 'Elise', symbol:'I relax with my friends', rank: 2, price: 1, avatar: 'https://kor.ill.in.ua/m/1260x900/2254601.jpg')
  ];
  //List<SMSData> data = [];

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget> [
        Scaffold(
          body: Container(// то же самое что и div в HTML
              color: Colors.white,
              // decoration: BoxDecoration(border: Border.),
              child: ListView( //child используется для работы с обьектами внутри контейнера //ListView используется для отображения списка
                children: _bar(), //то же самое что и child только у каждого виджета по своему, достаточно навести курсор что бы узнать что использовать child или children
              )

          ),
        ),
        Scaffold( // основной компонент который рендерит(визуализация) страницу на экране
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.border_color),
            ),
            appBar: AppBar( //грубо говоря хедер приложения
                title: Text('Telegram'),

            ),
                body: Container(// то же самое что и div в HTML
                color: Colors.white,
            // decoration: BoxDecoration(border: Border.),
                child: ListView( //child используется для работы с обьектами внутри контейнера //ListView используется для отображения списка
                    children: _buildList(), //то же самое что и child только у каждого виджета по своему, достаточно навести курсор что бы узнать что использовать child или children
            )

            ),
            //floatingActionButton: FloatingActionButton(//кнопка справа внизу, можно поместить иконку,
            //child: Icon(Icons.refresh),
            //),
        )

          ]
      );
  }


  List<Widget> _buildList(){
    return data.map((SMSData f) => ListTile( // список с параметрами title, subtitle, leading, trailing
      subtitle: Text(f.symbol),// находится под title
      title: Text(f.name),
      leading: CircleAvatar(radius:30.0, backgroundImage: NetworkImage(f.avatar)), //leading то что показывается в начале елемента//CircleAvatar контейнер в форме круга
      trailing: Container(
        height: 18,
        width: 35,
        alignment: Alignment.center,
        child:Text('${f.price.toString()}',  style: TextStyle(color:Colors.white, fontWeight:FontWeight.bold, fontSize:10.0),),
        decoration: BoxDecoration(borderRadius:BorderRadius.circular(50), color: Colors.grey,),
      ),//trailing отображает в краю справа
    )).toList(); //toString() конвертирует f.rank в строку//toList() конвертирует весь наш map в list
  }



  List<Widget> _bar(){
    return databar.map((Bar k) => ListTile(
      leading: k.symbol,
      title:Text(k.name),
    )).toList();
  }
}

