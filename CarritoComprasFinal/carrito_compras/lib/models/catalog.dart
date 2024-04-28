
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
    List<int> PokePrices = [
    Bulbasaur.price,
    Ivysaur.price,
    Venusaur.price,
    Charmander.price,
    Charmeleon.price,
    Charizard.price,
    Squirtle.price,
    Wartortle.price,
    Blastoise.price,
    Pidgey.price,
    Pidgeotto.price,
  ];
  List<String> PokeImg = [
    Bulbasaur.img,
    Ivysaur.img,
    Venusaur.img,
    Charmander.img,
    Charmeleon.img,
    Charizard.img,
    Squirtle.img,
    Wartortle.img,
    Blastoise.img,
    Pidgey.img,
    Pidgeotto.img,
  ];
  Pokemon getById(int id) {
    return Pokemon(id, PokeNames[id % PokeNames.length], PokeImg[id % PokeImg.length], PokePrices[id % PokePrices.length]);
  }
  Pokemon getByPosition(int position) {
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
Pokemon Ivysaur = new Pokemon(1, "Ivysaur", "assets/002.png", 2000);
Pokemon Venusaur = new Pokemon(1, "Venusaur", "assets/003.png", 3000);
Pokemon Charmander = new Pokemon(1, "Charmander", "assets/004.png", 3000);
Pokemon Charmeleon = new Pokemon(1, "Charmeleon", "assets/005.png", 4000);
Pokemon Charizard = new Pokemon(1, "Charizard", "assets/006.png", 5000);
Pokemon Squirtle = new Pokemon(1, "Squirtle", "assets/007.png", 500);
Pokemon Wartortle = new Pokemon(1, "Wartortle", "assets/008.png", 1000);
Pokemon Blastoise = new Pokemon(1, "Blastoise", "assets/009.png", 1500);
Pokemon Pidgey = new Pokemon(1, "Pidgey", "assets/010.png", 200);
Pokemon Pidgeotto = new Pokemon(1, "Pidgeotto", "assets/011.png", 500);
