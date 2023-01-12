import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import 'cart_item.dart';

class CartItemList extends StatelessWidget {
  final cartData;

   const CartItemList({Key? key, required this.cartData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: cartData.cartItemsCount,
          itemBuilder: (context, index) {
            return Dismissible(
                key: ValueKey(cartData.CartItems.keys.toList()[index]),
                background: Container(
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 30,
                  ),
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  padding: const EdgeInsets.only(right: 10.0),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) =>
                    Provider.of<CartDataProvider>(context, listen: false).deleteItem(cartData.CartItems.keys.toList()[index]),
                child: CartItem(cartData: cartData, index: index)
            );
          }),
    );
  }
}

