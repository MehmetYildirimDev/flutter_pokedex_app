import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._(); //kimse nesne uretemez//kurucu methodu gizlendi

  static String title = 'Pokedex';

  static TextStyle getTitleTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(48),
    );
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(24),
    );
  }

  static TextStyle getTypeChipNameTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: _calculateFontSize(20),
    );
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size.sp; //telefonun boyut ayari
    } else {
      return (1.1 * size).sp;
    }
  }

  static String pokeballImageUrl = 'assets/images/pokeball.png';

  static getPokeInfoLabelTextStyle() {
    return TextStyle(
        fontSize: _calculateFontSize(20),
        color: Colors.black,
        fontWeight: FontWeight.bold);
  }

  static getPokeInfoTextStyle() {
    return TextStyle(fontSize: _calculateFontSize(16), color: Colors.black);
  }

  //   static _calculateArrowBackIconSize(int size) {
  //   if (ScreenUtil().orientation == Orientation.portrait) {
  //     return size.sp; //telefonun boyut ayari
  //   } else {
  //     return (1.1 * size).sp;
  //   }
  // }
}
