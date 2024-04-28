// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:provider_shopper/models/catalog.dart';

class CartModel extends ChangeNotifier {
  /// The private field backing [catalog].
  late CatalogModel _catalog;

  /// Internal, private state of the cart. Stores the ids of each pokemon.
  final List<int> _pokemonIds = [];

  /// The current catalog. Used to construct pokemons from numeric ids.
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an pokemon
    // might have changed.
    notifyListeners();
  }

  /// List of pokemons in the cart.
  List<Pokemon> get pokemons => _pokemonIds.map((id) => _catalog.getById(id)).toList();

  /// The current total price of all pokemons.
  int get totalPrice =>
      pokemons.fold(0, (total, current) => total + current.price);

  /// Adds [pokemon] to cart. This is the only way to modify the cart from outside.
  void add(Pokemon pokemon) {
    _pokemonIds.add(pokemon.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void remove(Pokemon pokemon) {
    _pokemonIds.remove(pokemon.id);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }
}
