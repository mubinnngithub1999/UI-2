import 'dart:ui';

import 'package:flutter/material.dart';

class Info {
  late final String title;
  late final double price;
  late final String imgURL;
  late final Color cardColor;
  late final Color bgColor;
  Info(
      {required this.title,
      required this.price,
      required this.imgURL,
      required this.cardColor,
      required this.bgColor});
}

List<Info> fruits = [
  Info(
    title: 'Lemon',
    price: 12.7,
    imgURL: 'images/lim.png',
    cardColor: const Color(0xffFFD982),
    bgColor: Colors.transparent,
  ),
  Info(
    title: 'Avocado',
    price: 13.7,
    imgURL: 'images/ava.png',
    bgColor: const Color(0xffFFD981),
    cardColor: const Color(0xff43A99B),
  ),
  Info(
    title: 'Lemon',
    price: 17.7,
    imgURL: 'images/pea.png',
    bgColor: const Color(0xff43A99B),
    cardColor: const Color(0xfffea7b6),
  ),
];

List<Info> vegtables = [
  Info(
    title: 'Pepper',
    price: 12.7,
    imgURL: 'images/peppar.png',
    cardColor: const Color(0xffFF95C5),
    bgColor: Colors.transparent,
  ),
  Info(
    title: 'Radish',
    price: 13.7,
    imgURL: 'images/radish.png',
    bgColor: const Color(0xffFF95C5),
    cardColor: const Color(0xff43A99B),
  ),
  Info(
    title: 'Cucumber',
    price: 17.7,
    imgURL: 'images/cucumber.png',
    bgColor: const Color(0xff43A99B),
    cardColor: const Color.fromARGB(255, 217, 210, 118),
  ),
];


List<Info> foods = [
  Info(
    title: 'Pizza',
    price: 12.7,
    imgURL: 'images/pizza.png',
    cardColor: const Color(0xffFF4A4A),
    bgColor: Colors.transparent,
  ),
  Info(
    title: 'Barger',
    price: 13.7,
    imgURL: 'images/barger.png',
    bgColor: const Color(0xffFF4A4A),
    cardColor: const Color.fromARGB(255, 239, 138, 76),
  ),
  Info(
    title: 'Kabab',
    price: 17.7,
    imgURL: 'images/kabab.png',
    bgColor:  const Color.fromARGB(255, 239, 138, 76),
    cardColor: const Color.fromARGB(255, 230, 202, 110),
  ),
];