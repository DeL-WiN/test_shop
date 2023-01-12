import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_shop/models/cart.dart';

import '../widgets/cart_item_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('basket'),
      ),
      body: cartData.cartItems.isEmpty
          ? Card(
              elevation: 5.0,
              margin: const EdgeInsets.all(30.0),
              child: Container(
                height: 100,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  'shopping cart is empty :(',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          : Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'price: ' +
                          cartData.totalAmount.toStringAsFixed(2) +
                          '\$',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    MaterialButton(
                      onPressed: () {
                        cartData.clear();
                      },
                      color: Theme.of(context).primaryColor,
                      child: const Text('Buy'),
                    ),
                  ],
                ),
                const Divider(),
                Expanded(child: CartItemList(cartData: cartData)),
              ],
            ),
    );
  }
}
