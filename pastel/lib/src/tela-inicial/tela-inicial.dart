import 'package:flutter/material.dart';

class TelaInicialPage extends StatefulWidget {
  @override
  _TelaInicialPageState createState() => new _TelaInicialPageState();
}

class _TelaInicialPageState extends State<TelaInicialPage> {
  @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Tela Inicial'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Tela Inicial',
            ),
          ],
        ),
      ),
    );
  }
}