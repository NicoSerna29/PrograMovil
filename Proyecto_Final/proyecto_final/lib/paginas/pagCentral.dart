import 'package:flutter/material.dart';
import 'package:proyecto_final/db/db.dart';
import 'package:proyecto_final/modelos/Pokemon.dart';
import 'package:proyecto_final/paginas/createPoke.dart';

class centralApp extends StatelessWidget {
  static const String Route = '/pagCentral';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Pagina Central",
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, addPoke.Route);
          },
        ),
        body: Container(
          child: listado(),
        ));
  }
}


class listado extends StatefulWidget {
  @override
  _listadoState createState() => _listadoState();
}

class _listadoState extends State<listado> {
  List<Pokemon> listaPokedex = [];

  @override
  void initState(){
    cargarDatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaPokedex.length,
      itemBuilder: (_, i) => crearItem(i),
    );
  }

  cargarDatos() async {
    List<Pokemon> tempPokedex = await Operation.listPokemon();
    setState(() {
      listaPokedex = tempPokedex;
    });
  }

  crearItem(int i) {
    final Operation operation = Operation();
    return  Dismissible(
    key: Key(i.toString()),
    direction: DismissDirection.startToEnd,
    background: Container(
      color: Colors.red,
      padding: EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(Icons.delete, color: Colors.white,),
      )
    ),
    onDismissed: (direction){
      operation.deletePokemon(listaPokedex[i]);
    },
    child:ListTile(
      title: Text(listaPokedex[i].name),
      subtitle: Image.network(
        listaPokedex[i].sprite,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          }
        },
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Text('Failed to load image');
        },
      ),
    ),
    );
  }
}

