import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_shop/models/cart.dart';
import 'package:test_shop/models/product.dart';
import 'package:test_shop/pages/cart_page.dart';

class ItemPage extends StatelessWidget {
  final String productId;

  const ItemPage({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
    Provider.of<ProductDataProvider>(context).getElementById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
          style: GoogleFonts.marmelad(),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Hero(
                tag: data.imgUrl,
                child: Container(
                  height: 300,
                width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(data.imgUrl), fit: BoxFit.cover)),
                )),
            Card(
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text(data.title, style: const TextStyle(fontSize: 26),),
                    const Divider(),
                    Row(
                      children: [
                        const Text('Price: ', style: TextStyle(fontSize: 24),),
                        Text('${data.price} \$',
                          style: const TextStyle(fontSize: 24),),
                      ],
                    ),
                    const Divider(),
                    Text(data.description),
                    const SizedBox(
                      height: 20,
                    ),
                    Provider
                        .of<CartDataProvider>(context)
                        .cartItems
                        .containsKey(productId)
                        ? Column(
                      children: [
                        MaterialButton(
                          color: const Color(0xFFCCFF90),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CartPage(),));
                          },
                          child: const Text('Go to cart'),
                        ),
                        const Text('The product is in the basket', style: TextStyle(fontSize: 12, color: Colors.blueGrey),)
                      ],
                    )
                        : MaterialButton(
                        onPressed: () {
                          Provider.of<CartDataProvider>(context, listen: false).addItem(
                            productId: data.id,
                            imgUrl: data.imgUrl,
                            title: data.title,
                            price: data.price
                          );
                        },
                      child: const Text('Buy'),
                        )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
