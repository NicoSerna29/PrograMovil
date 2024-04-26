// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';
import 'package:provider_shopper/models/catalog.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 5)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListPokemon(index)),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Pokemon pokemon;

  const _AddButton({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    // The context.select() method will let you listen to changes to
    // a *part* of a model. You define a function that "selects" (i.e. returns)
    // the part you're interested in, and the provider package will not rebuild
    // this widget unless that particular part of the model changes.
    //
    // This can lead to significant performance improvements.
    var isInCart = context.select<CartModel, bool>(
      // Here, we are only interested whether [pokemon] is inside the cart.
      (cart) => cart.pokemons.contains(pokemon),
    );

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              // If the pokemon is not in cart, we let the user add it.
              // We are using context.read() here because the callback
              // is executed whenever the user taps the button. In other
              // words, it is executed outside the build method.
              var cart = context.read<CartModel>();
              cart.add(pokemon);
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null; // Defer to the widget's default.
        }),
      ),
      child: isInCart
          ? const Icon(Icons.check, semanticLabel: 'ADDED')
          : const Text('ADD'),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title:
          Text('POKE TIENDA', style: Theme.of(context).textTheme.displayLarge),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => context.go('/catalog/cart'),
        ),
      ],
      backgroundColor:
          Color.fromARGB(255, 215, 0, 0), // Cambia el color de la AppBar aquí
    );
  }
}

class _MyListPokemon extends StatelessWidget {
  final int index;

  const _MyListPokemon(this.index);

  @override
  Widget build(BuildContext context) {
    var pokemon = context.select<CatalogModel, Pokemon>(
      // Here, we are only interested in the pokemon at [index]. We don't care
      // about any other change.
      (catalog) => catalog.getByPosition(index),
    );
    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: LimitedBox(
        maxHeight: 40,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                child: Image(
                  image: AssetImage('assets/imagen1.png'),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(pokemon.name, style: textTheme),
            ),
            const SizedBox(width: 24),
            _AddButton(pokemon: pokemon),
          ],
        ),
      ),
    );
  }
}
