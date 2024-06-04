import 'package:clase_proyecto_final/modelos/pokemon.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> openDB() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'pokemons.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pokemons(id INTEGER PRIMARY KEY, nameP TEXT, idP TEXT, spriteP TEXT)',
        );
      },
      version: 1,
    );

    return database;
  }

  static Future<void> addPoke(Pokemon pokemon) async {
    final db = await openDB();
    await db.insert(
      'dogs',
      pokemon.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Pokemon>> listPokemon() async {
    Database db = await openDB();
    final List<Map<String, dynamic>> pokeMap = await db.query("pokemons");

    for (var i in pokeMap) {
      print("___" + i['nameP']);
    }

    return List.generate(
        pokeMap.length,
        (i) => Pokemon(
            id: pokeMap[i]['id'],
            nameP: pokeMap[i]['nameP'],
            idP: pokeMap[i]['idP'],
            spriteP: pokeMap[i]['spriteP']));
  }

  static Future<void> deletePoke(Pokemon pokemon) async {
    Database db = await openDB();
    await db.delete("pokemons", where: ' = ?');
  }
}
