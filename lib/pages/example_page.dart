import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import '../widgets/uni_wave.dart';
import '../widgets/fade_animation.dart';

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortune Wheel Example',
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  int selected = 0;

  final List<Items> items = [
    Items(
        text: 'Мвидео',
        color: Colors.deepOrange
    ),
    Items(
        text: 'Boom',
        color: Colors.purple
    ),
    Items(
        text: 'Alex Fitness',
        color: Colors.grey
    ),
    Items(
        text: 'KFC',
        color: Colors.red
    ),
    Items(
        text: 'Охара',
        color: Colors.green
    ),
    Items(
        text: 'Alex Fitness',
        color: Colors.grey
    ),
    Items(
        text: 'Медитэ',
        color: Colors.orange
    ),
    Items(
        text: 'Фотик',
        color: Colors.brown
    )
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff0a2896),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            UniWave(
              size: size * 2,
              yOffset: size.height / 2.5,
              color: Colors.white,
            ),
            AppBar(
              title: Text('Колесо фортуны'),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height - 76,
                width: MediaQuery.of(context).size.width - 40,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = Random().nextInt(items.length);
                    });
                  },
                  child: FortuneWidget(
                    selected: selected,
                    items: [
                      for (var it in items) FortuneItem(
                          borderColor: Colors.transparent,
                          color: it.color,
                          child: Text(it.text)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FadeAnimation(
              7.5,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: EdgeInsets.only(top: 10.5, left: 21, right: 23, bottom: 14),
                      decoration: BoxDecoration(
                          color: Color(0xff053cc8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          boxShadow: [BoxShadow(
                              color: Color.fromRGBO(5, 6, 200, 0.15),
                              offset: Offset(-5.0, 25.0),
                              blurRadius: 10.0
                          )]
                      ),
                      child: Container(
                          height: 110,
                          padding: EdgeInsets.only(top: 13, bottom: 14, left: 20, right: 17),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Скидка 10% на покупки в Мвидео от 10000 рублей",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                "Приходите за остальными скидками в следующий раз",
                              ),
                            ],
                          )
                      )
                  ),
                )
            )
          ],
        ),
      )
    );
  }
}

class Items {
  final String text;
  final Color color;

  Items({this.text, this.color});
}