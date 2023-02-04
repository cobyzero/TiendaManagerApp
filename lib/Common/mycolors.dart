import 'package:flutter/material.dart';

class MyColors {
  static white() {
    return const Color(0xfff5f5fa);
  }

  static white2() {
    return const Color(0xffe5e1e1);
  }

  static gradientMoradoRosado() {
    return const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [Color(0xff7028e4), Color(0xffe5b2ca)]);
  }

  static black() {
    return const Color(0xff1C1C1C);
  }
}
