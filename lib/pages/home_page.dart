import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_shop/models/product.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/catalog.dart';
import '../widgets/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 85,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              )),
          child: ListView(
            padding: const EdgeInsets.all(10.00),
            children: [
              Container(
                child: const ListTile(
                  title: Text(
                    'E-COMMERCE Store',
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Top sale',
                    style: TextStyle(
                        fontSize: 16)
                  ),
                  trailing: Icon(Icons.panorama_horizontal),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(5.0),
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: productData.items.length,
                    itemBuilder: (context, int index) =>
                        ChangeNotifierProvider.value(
                            value: productData.items[index],
                        child: const ItemCard(),
                        )
                ),
              ),
              
              const Padding(padding: EdgeInsets.all(10.0),
              child: Text('SALE CATALOG'),
              ),

              ...productData.items.map((value) {
                return CatalogListTile(imgUrl: value.imgUrl);
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
