import 'dart:collection';
import 'package:flutter/cupertino.dart';

// cart Model
class Cart {
  final String id;
  final String title;
  final int number;
  final num price;
  final String imgUrl;

  Cart(
      {required this.id,
      required this.title,
      required this.number,
      required this.price,
      required this.imgUrl});
}

// cart Provider
class CartDataProvider with ChangeNotifier {
  Map<String, Cart> _cartitems = {};

  UnmodifiableMapView<String, Cart> get cartItems =>
      UnmodifiableMapView(_cartitems);

  int get cartItemsCount => _cartitems.length;

  double get totalAmount {
    var total = 0.0;
    _cartitems.forEach((key, item) {
      total += item.price * item.number;
    });

    return total;
  }

  void addItem({productId, price, title, imgUrl}) {
    if (_cartitems.containsKey(productId)) {
      _cartitems.update(
          productId,
          (ex) => Cart(
                id: ex.id,
                title: ex.title,
                price: ex.price,
                imgUrl: ex.imgUrl,
                number: ex.number + 1,
              ));
    } else {
      _cartitems.putIfAbsent(
          productId,
          () => Cart(
                id: '${DateTime.now()}',
                title: title,
                price: price,
                imgUrl: imgUrl,
                number: 1,
              ));
    }
    notifyListeners();
  }

  void deleteItem(String productId) {
    _cartitems.remove(productId);
    notifyListeners();
  }

// оновити корзину на +1
  void updateItemsAddOne(String productId) {
    _cartitems.update(
        productId,
        (ex) => Cart(
              id: ex.id,
              title: ex.title,
              price: ex.price,
              imgUrl: ex.imgUrl,
              number: ex.number + 1,
            ));
    notifyListeners();
  }

  // оновити корзину на -1
  void updateItemsSubOne(String productId) {
    if (_cartitems[productId]!.number < 2) {
      deleteItem(productId);
    } else {
      _cartitems.update(
          productId,
          (ex) => Cart(
                id: ex.id,
                title: ex.title,
                price: ex.price,
                imgUrl: ex.imgUrl,
                number: ex.number - 1,
              ));
    }
    notifyListeners();
  }

  // очистити корзину
  void clear() {
    _cartitems = {};
    notifyListeners();
  }
}
