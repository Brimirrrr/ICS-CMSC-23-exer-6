import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './MyCart.dart';
import './MyCatalog.dart';
import '../provider/shoppingcart_provider.dart';
import './CheckoutPage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ShoppingCart()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      initialRoute: "/",
      routes: {
        "/cart": (context) => const MyCart(),
        "/products": (context) => const MyCatalog(),
        "/checkout": (context) => CheckoutPage(),
      },
      home: const MyCatalog(),
    );
  }
}
