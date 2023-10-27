import 'package:flutter/material.dart';

import 'categories_screen.dart';

class CartScreen extends StatelessWidget {
  static final List<CartItem> cartItems = [];

  double get totalCartPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  int get totalCartItems {
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartItems.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = cartItems[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('\$${item.price} x ${item.quantity}'),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Total Items: $totalCartItems',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Total Price: \$${totalCartPrice.toStringAsFixed(2)}',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Text('No items in the cart'),
            ),
    );
  }
}