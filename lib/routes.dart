import 'package:app/Pages/Cart/cart.dart';
import 'package:app/Pages/Home/home.dart';
import 'package:app/Pages/Item/item.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routesApp() {
  return {
    "/": (context) => HomePage(),
    "/Item": (context) => const ItemPage(),
    "/Cart": (context) => const CartPage()
  };
}
