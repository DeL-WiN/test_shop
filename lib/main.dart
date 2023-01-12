import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_shop/models/product.dart';

import 'models/cart.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
          create: (context) => ProductDataProvider(),
        ),
        ChangeNotifierProvider<CartDataProvider>(
          create: (context) => CartDataProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Demo Shop',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          backgroundColor: Colors.white60,
          textTheme: GoogleFonts.marmeladTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}

