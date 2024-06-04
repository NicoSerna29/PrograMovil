import 'package:clase_proyecto_final/paginas/registroPokemon.dart';
import 'package:clase_proyecto_final/paginas/pagCentral.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
    Widget build(BuildContext context){
      return MaterialApp(
        initialRoute: PagCentral.RUTA,
        routes: {
          PagCentral.RUTA : (_) => PagCentral(),
          addPokemon.RUTA : (_) => addPokemon(),
        }
      );
    }
  }
