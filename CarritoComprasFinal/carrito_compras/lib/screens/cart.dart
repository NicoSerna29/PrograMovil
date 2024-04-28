

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carrito2/models/cart.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Poke Cart',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.w900, fontSize: 30)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: _CartList(),
              ),
            ),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return ListView.builder(
      itemCount: cart.pokemons.length,
      itemBuilder: (context, index) => ListTile(
        title: RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Container(
                  color: const Color.fromARGB(255, 158, 158, 158),
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 5, top: 5, right: 5),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            cart.remove(cart.pokemons[index]);
                          },
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 95, 95, 95), 
                            width: 5, 
                          ),
                          borderRadius: BorderRadius.circular(12), 
                        ),
                        child: Image.asset(
                          cart.pokemons[index].img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30, left: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            cart.pokemons[index].name,
                            style: TextStyle(fontSize: 30,color: const Color.fromARGB(255, 205, 0, 0),fontWeight: FontWeight.w900),                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                20),
                          ),
                          child: Text(
                            cart.pokemons[index].price.toString()+"¥",
                            style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 26, 176, 0),fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return Container(
      color: const Color.fromRGBO(255, 255, 255, 1),
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartModel>(
                builder: (context, cart, child) => Text(
                    "Total: " + '\$${cart.totalPrice}',
                    style: TextStyle(color: Colors.red,fontSize: 45,fontWeight: FontWeight.w900))),
            const Spacer(),
            FilledButton(
              onPressed: () {
                if (cart.pokemons.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'El carrito está vacío ¿._.?, Agrega productos')));
                } else {
                  cart.clear();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Compra realizada con éxito')));
                }
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red),
              child: const Text(
                'COMPRAR',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
