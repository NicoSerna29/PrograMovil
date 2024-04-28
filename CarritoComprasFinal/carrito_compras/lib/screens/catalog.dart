import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:carrito2/models/cart.dart';
import 'package:carrito2/models/catalog.dart';

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
    var isInCart = context.select<CartModel, bool>(
      (cart) => cart.pokemons.contains(pokemon),
    );

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              var cart = context.read<CartModel>();
              cart.add(pokemon);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Pokemon agregado al carrito :)')));
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null;
        }),
      ),
      child: isInCart
          ? const Icon(Icons.add_shopping_cart, semanticLabel: 'ADDED')
          : const Icon(Icons.add_circle_outline_sharp, semanticLabel: 'ADDED'),
    );
  }
}
class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('POKE TIENDA',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => context.go('/catalog/cart'),
        ),
      ],
      backgroundColor:
          Color.fromARGB(255, 215, 0, 0),
    );
  }
}

class _MyListPokemon extends StatelessWidget {
  final int index;
  const _MyListPokemon(this.index);
  @override
  Widget build(BuildContext context) {
    var pokemon = context.select<CatalogModel, Pokemon>(
      (catalog) => catalog.getByPosition(index),
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 25),
      child: LimitedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 217, 0),
                border: Border.all(
                  color: Color.fromARGB(255, 122, 122, 122),
                  width: 10,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image(
                image: AssetImage(pokemon.img),
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    Text("Nombre: " + pokemon.name,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.red)),
                    Row(
                      children: [
                        Text("Precio: " + pokemon.price.toString() + "¥",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 21, 124, 0))),
                        const SizedBox(width: 180),_AddButton(pokemon: pokemon),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
