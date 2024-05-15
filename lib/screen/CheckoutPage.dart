import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/shoppingcart_provider.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<ShoppingCart>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: Colors.redAccent[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Total: \$${cart.totalPrice}"),
            SizedBox(height: 20),
            if (cart.cart.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  cart.removeAll();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Payment Successful"),
                    duration: Duration(seconds: 2),
                  ));
                  Navigator.pop(context);
                },
                child: Text("Pay Now"),
              ),
            if (cart.cart.isEmpty) Text("No items to checkout"),
          ],
        ),
      ),
    );
  }
}
