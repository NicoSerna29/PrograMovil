
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:carrito2/common/theme.dart';
import 'package:carrito2/models/cart.dart';
import 'package:carrito2/models/catalog.dart';
import 'package:carrito2/screens/cart.dart';
import 'package:carrito2/screens/catalog.dart';
import 'package:carrito2/screens/login.dart';

void main() {
  //setupWindow();
  runApp(const MyApp());
}
GoRouter router() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const MyLogin(),
      ),
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const MyCatalog(),
        routes: [
          GoRoute(
            path: 'cart',
            builder: (context, state) => const MyCart(),
          ),
        ],
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp.router(
        title: 'Tienda Pokemon',
        theme: appTheme,
        routerConfig: router(),
      ),
    );
  }
}
