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
}

void main() async {
 // Llamamos al método inicioBD de la instancia de Operation

  // Ahora podemos usar la base de datos 'db' como necesitamos
}

  Future<void> insert(Pokemon pokemon) async {
    Database db = await Operation.inicioBD();

    await db.insert(
      'pokedex',
      pokemon.toMap(),
    );
  }
