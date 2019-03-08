import 'package:flutter/material.dart';

class ListadeEventosPage extends StatefulWidget {
  @override
  _ListadeEventosPageState createState() => new _ListadeEventosPageState();
}

class _ListadeEventosPageState extends State<ListadeEventosPage> {
  @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Lista de Eventos'),
      ),
      body: Center(
        child: Column(
        children: <Widget>[
          Text(
          'Lista de Eventos',
           ),
        ],
        ),
      ),
    );
  }
}