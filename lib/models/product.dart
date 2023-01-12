import 'dart:collection';
import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imgUrl;
  final color;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imgUrl,
      required this.color});
}

class ProductDataProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: 'a1',
        title: 'Apple Watch SE (2022)',
        description:
            'Smart watch Apple Watch SE (2022) GPS 40mm Silver Aluminum Case with White Sport Band',
        price: 320,
        imgUrl:
            'https://content1.rozetka.com.ua/goods/images/big/285055453.jpg',
        color: '0xFFFFF59D'),
    Product(
        id: 'a2',
        title: 'Smart Ring Jakcom',
        description:
            'The Jakcom R4 smart ring is a gadget that has an integrated processor capable of performing functions set by the user',
        price: 35,
        imgUrl:
            'https://content1.rozetka.com.ua/goods/images/big/252343747.jpg',
        color: '0xFFFFF59D'),
    Product(
        id: 'a3',
        title: 'GSM socket 6 channels 1U',
        description:
            'The device allows you to turn on, turn off, restore or block the power supply of each individual outlet, control the power supply parameters at the object. Individual control of sockets in real time allows you to perform a remote reboot of equipment that has stopped responding.',
        price: 110,
        imgUrl:
            'https://shop.elgato.com.ua/406-thickbox_default/gsm-rozetka-6-kanalov-1u.jpg',
        color: '0xFFFFF59D'),
    Product(
        id: 'a4',
        title: 'Electronic book PocketBook',
        description:
            'Electronic book PocketBook 628 Touch Lux 5 Ink Black (PB628-P-CIS)',
        price: 150,
        imgUrl: 'https://content1.rozetka.com.ua/goods/images/big/28741491.jpg',
        color: '0xFFFFF59D'),
    Product(
        id: 'a5',
        title: 'Camera Canon',
        description:
            'Camera Canon EOS R 24-105 mm F4-7.1 IS STM Kit Black (3075C129AA) Official warranty!',
        price: 1900,
        imgUrl:
            'https://content2.rozetka.com.ua/goods/images/big/139379315.jpg',
        color: '0xFFFFF59D'),
    Product(
        id: 'a6',
        title: 'Samsung Galaxy S21',
        description:
            'Mobile phone Samsung Galaxy S21 FE 6/128GB Lavender (SM-G990BLVDSEK/SM-G990BLVFSEK)',
        price: 640,
        imgUrl: 'https://content.rozetka.com.ua/goods/images/big/245951562.jpg',
        color: '0xFFFFF59D'),
    Product(
        id: 'a7',
        title: 'Apple AirPods',
        description:
            'Headphones Apple AirPods with Charging Case (MV7N2) (2nd generation)',
        price: 180,
        imgUrl: 'https://content1.rozetka.com.ua/goods/images/big/14270995.jpg',
        color: '0xFFFFF59D'),
    Product(
        id: 'a8',
        title: 'RZTK Tripod',
        description: 'Selfie-tripod RZTK Tripod Compact Black',
        price: 15,
        imgUrl: 'https://content.rozetka.com.ua/goods/images/big/233036344.jpg',
        color: '0xFFFFF59D'),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id) =>
      _items.singleWhere((value) => value.id == id);
}
