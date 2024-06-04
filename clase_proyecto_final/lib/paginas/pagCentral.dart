import 'package:clase_proyecto_final/BD/db.dart';
import 'package:clase_proyecto_final/modelos/pokemon.dart';
import 'package:clase_proyecto_final/paginas/registroPokemon.dart';
import 'package:flutter/material.dart';

class PagCentral extends StatelessWidget {
  static const String RUTA = "/";

  @override
  Widget build(BuildContext context) {
    DB.listPokemon();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, addPokemon.RUTA, arguments: Pokemon.empty());
        },
      ),
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Container(
        child: listElements(),
      ),
    );
  }
}

class listElements extends StatefulWidget {

  @override
  State<listElements> createState() => _listElements();
}

class _listElements extends State<listElements> {
  List<Pokemon> pokes = [];

  @override
  void initState(){
    cargarDatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: pokes.length,
      itemBuilder: (_,i) => createItems(i),
    );
  }

  cargarDatos() async{
    List<Pokemon> tempPokes = await DB.listPokemon();

    setState(() {
      pokes = tempPokes; 

    });

  }

  createItems(int i) {
    return Dismissible(
      key: Key(i.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction){
        DB.deletePoke(pokes[i]);
      },
      child: ListTile(
        title: Text(pokes[i].nameP),
      ),
    );
  }
}
