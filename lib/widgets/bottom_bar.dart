import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_shop/models/cart.dart';
import 'package:test_shop/pages/cart_page.dart';

import '../pages/item_page.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);
    final cartItems = cartData.cartItems;

    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        width: 60,
        decoration: const BoxDecoration(
          color: Colors.amberAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2 + 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cartItems.length,
                itemBuilder: (context, index) => Hero(
                    tag: cartItems.values.toList()[index].imgUrl,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ItemPage(
                                  productId: cartItems.keys.toList()[index],
                                )));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 4.0,
                                    spreadRadius: 5.0,
                                    offset: Offset(-2, 2),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(
                                      cartItems.values.toList()[index].imgUrl),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            right: 2,
                            bottom: 5,
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: const BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              constraints: const BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                '${cartItems.values.toList()[index].number}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 - 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${cartData.totalAmount.toStringAsFixed(2)} \$'),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_basket,
                      color: Color(0xFF676E79),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
