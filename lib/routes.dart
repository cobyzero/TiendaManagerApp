import 'package:app/Pages/Base/base.dart';
import 'package:app/Pages/Cart/cart.dart';
import 'package:app/Pages/Home/home.dart';
import 'package:app/Pages/Item/item.dart';
import 'package:app/Pages/Login/login.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routesApp() {
  return {
    "/": (context) => BasePage(),
    "/Login": (context) => LoginPage(),
    "/Home": (context) => HomePage(),
    "/Item": (context) => const ItemPage(),
    "/Cart": (context) => const CartPage()
  };
}
