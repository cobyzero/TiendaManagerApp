import 'package:flutter/material.dart';

class MyColors {
  static white() {
    return const Color(0xfffafafa);
  }

  static gradientMoradoRosado() {
    return const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [Color(0xff7028e4), Color(0xffe5b2ca)]);
  }
}
