import 'dart:math';//เฉลยแล้ว

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> _quoteList = [
    'อยู่ด้วยกันจนถึงสิ้นปีเลยได้ไหม "เงินอะ"',
    'อย่าทำให้หลงได้ไหม น้ำมันแพง',
    'วิธีที่ทำให้เธอหันมามอง คือการไอ',
    'ถึงไม่งามบาดตา แต่ปากหมาบาดใจนะ',
    'เราชอบตัวเองตอนเผลอ แล้วเธอชอบเราตอนไหน',
  ];
  //สุ่มสี
  static const List<MaterialColor> _colorList = [
    Colors.red, Colors.blue,Colors.lightGreen,Colors.blueGrey,
  ];

  var _quote = _quoteList[0];// state variable
  var _color = _colorList[0];

  void _handleClickGo(){
    var rand = Random();


   /* var randomIndex = rand.nextInt(_quoteList.length);
    String newQuote = _quoteList[randomIndex];

    while(newQuote == _quote){
      randomIndex = rand.nextInt(_quoteList.length);
      newQuote = _quoteList[randomIndex];
    }*/
    //
    String newQuote;
    do{
      var randomIndex = rand.nextInt(_quoteList.length);
      newQuote = _quoteList[randomIndex];
    }while (newQuote == _quote);

    MaterialColor newColor;
    do{
      var randomIndex = rand.nextInt(_colorList.length);
      newColor = _colorList[randomIndex];
    }while (newColor == _color);

    setState(() {
      _quote = newQuote;
      _color = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleClickGo,
        child: const Text('Next Quote', textAlign: TextAlign.center,),
      ),
      body: Center(
        child : Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            _quote, // positional paramrter/argument
            //name parameter/argument
            style: TextStyle(
              color: _color,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}