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

  static gray900() {
    return const Color(0xff1c1c1c);
  }

  static gray800() {
    return const Color(0xff2b2b2b);
  }

  static gray700() {
    return const Color(0xff444444);
  }

  static gray600() {
    return const Color(0xff575757);
  }

  static gray500() {
    return const Color(0xff757575);
  }

  static gray400() {
    return const Color(0xffa5a5a5);
  }

  static gray300() {
    return const Color(0xffd6d6d6);
  }

  static gray200() {
    return const Color(0xffe8e8e8);
  }

  static gray100() {
    return const Color(0xfff5f5f5);
  }

  static gray50() {
    return const Color(0xfffafafa);
  }
}
