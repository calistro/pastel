import 'package:flutter/material.dart';

class TelaPerfilPage extends StatefulWidget {
  @override
  _TelaPerfilPageState createState() => new _TelaPerfilPageState();
}

class _TelaPerfilPageState extends State<TelaPerfilPage> {
  @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Perfil'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}