import 'package:flutter/material.dart';
import 'package:proyecto_final/paginas/Login.dart';
import 'package:proyecto_final/paginas/createPoke.dart';
import 'package:proyecto_final/paginas/pagCentral.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
 @override
 Widget build(BuildContext context){
  return MaterialApp(
    initialRoute: centralApp.Route,
      routes: {
        Login.Route : (_) => Login(),
        centralApp.Route : (_) => centralApp(),
        addPoke.Route : (_) => addPoke()  
    },
  );
 }

}
