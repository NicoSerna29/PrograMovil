import 'package:flutter/widgets.dart';
import 'package:proyecto_final/modelos/Pokemon.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Operation {
  static Future<Database> inicioBD() async {
    return openDatabase(
      join(await getDatabasesPath(), 'Pokedex.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE pokedex(id INTEGER PRIMARY KEY, name TEXT, sprite TEXT)",
        );
        await db.execute(
          "CREATE TABLE usuarios (idU INTEGER PRIMARY KEY, nameU TEXT, contraU)",
        );
      },
      version: 1,
    );
  }
  
  Future<void> insertPokemon(Pokemon pokemon) async {
    Database db = await inicioBD();

    await db.insert(
      'pokedex',
      pokemon.toMap(),
    );

    print("Pokemon Registrado");
  }

  static Future<List<Pokemon>> listPokemon() async {
    Database db = await inicioBD();

    final List<Map<String, dynamic>> pokedexMap = await db.query("pokedex");

    return List.generate(pokedexMap.length, (i) => Pokemon(idP: pokedexMap[i]['idP'], name: pokedexMap[i]['name'], sprite: pokedexMap[i]['sprite']));
  }

  Future<void> deletePokemon(Pokemon pokemon) async {
    Database db = await inicioBD();

    await db.delete(
      'pokedex',
      where: 'id = ?', whereArgs: [pokemon.idP]
    );
}
}