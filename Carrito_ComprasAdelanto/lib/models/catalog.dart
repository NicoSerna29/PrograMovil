//import 'dart:ffi';

import 'package:flutter/material.dart';

class CatalogModel {
  List<String> PokeNames = [
    Bulbasaur.name,
    Ivysaur.name,
    Venusaur.name,
    Charmander.name,
    Charmeleon.name,
    Charizard.name,
    Squirtle.name,
    Wartortle.name,
    Blastoise.name,
    Pidgey.name,
    Pidgeotto.name,
  ];

  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  Pokemon getById(int id) {
    return Pokemon(id, PokeNames[id % PokeNames.length], '', 0);
  }

  /// Get item by its position in the catalog.
  Pokemon getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }
}

@immutable
class Pokemon {
  final int id;
  final String name;
  final String img;
  final int price;

  Pokemon(this.id, this.name, this.img, this.price);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Pokemon && other.id == id;
}

Pokemon Bulbasaur = new Pokemon(1, "Bulbasaur", "assets/001.png", 1000);
Pokemon Ivysaur = new Pokemon(1, "Ivysaur", "", 1000);
Pokemon Venusaur = new Pokemon(1, "Venusaur", "", 1000);
Pokemon Charmander = new Pokemon(1, "Charmander", "", 1000);
Pokemon Charmeleon = new Pokemon(1, "Charmeleon", "", 1000);
Pokemon Charizard = new Pokemon(1, "Charizard", "", 1000);
Pokemon Squirtle = new Pokemon(1, "Squirtle", "", 1000);
Pokemon Wartortle = new Pokemon(1, "Wartortle", "", 1000);
Pokemon Blastoise = new Pokemon(1, "Blastoise", "", 1000);
Pokemon Pidgey = new Pokemon(1, "Pidgey", "", 1000);
Pokemon Pidgeotto = new Pokemon(1, "Pidgeotto", "", 1000);
