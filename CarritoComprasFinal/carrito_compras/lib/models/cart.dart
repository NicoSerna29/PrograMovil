import 'package:flutter/foundation.dart';
import 'package:carrito2/models/catalog.dart';

class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;

  final List<int> _pokemonIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Pokemon> get pokemons => _pokemonIds.map((id) => _catalog.getById(id)).toList();

  int get totalPrice =>
      pokemons.fold(0, (total, current) => total + current.price);

  void add(Pokemon pokemon) {
    _pokemonIds.add(pokemon.id);
    notifyListeners();
  }

  void remove(Pokemon pokemon) {
    _pokemonIds.remove(pokemon.id);
    notifyListeners();
  }
  void clear() {
    _pokemonIds.clear();
    notifyListeners();
  }
}
