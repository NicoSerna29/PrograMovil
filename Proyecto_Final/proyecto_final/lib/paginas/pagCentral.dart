import 'package:flutter/material.dart';
import 'package:proyecto_final/paginas/createPoke.dart';

class centralApp extends StatelessWidget {
  
  static const String Route = '/pagCentral';

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar (title: Text("Pagina Central", )),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: (){
        Navigator.pushNamed(context, addPoke.Route);
      },),
      body: Container(
        child: ListView(children: <Widget>[
        ListTile(title: Text("POKEDEX"),),
        ListTile(title: Text("POKEDEX"),),
        ListTile(title: Text("POKEDEX"),),
        ListTile(title: Text("POKEDEX"),),
        ListTile(title: Text("POKEDEX"),),
        ListTile(title: Text("POKEDEX"),),
        ListTile(title: Text("POKEDEX"),),
        ListTile(title: Text("POKEDEX"),),
        ListTile(title: Text("POKEDEX"),),
        ListTile(title: Text("POKEDEX"),),
      ],),)
      );
  }
}