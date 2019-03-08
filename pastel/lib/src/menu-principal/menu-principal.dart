import 'package:flutter/material.dart';
//Pages
import 'package:pastel/src/lista-de-eventos/lista-de-eventos.dart';
import 'package:pastel/src/tela-perfil/tela-perfil.dart';
import 'package:pastel/src/tela-inicial/tela-inicial.dart';
void main() => runApp(Pastel());

class Pastel extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  Widget navegarParaPage(int currentIndex){
    switch (currentIndex){
      case 0: return TelaInicialPage();
      case 1: return ListadeEventosPage();
      case 2: return TelaPerfilPage();
      break;
      default: return TelaInicialPage();
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: navegarParaPage(_currentIndex
      ),
        //Botões inferiores /menu inferior
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (value){
              _currentIndex=value;
              setState(() {

              });
            },
          items: [
            BottomNavigationBarItem (
              title: Text("Home"),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem (
              title: Text("Pesquisar"),
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem (
              title: Text("Meu Perfil"),
              icon: Icon(Icons.people),
            ),
          ],
        ),
    );
  }
}