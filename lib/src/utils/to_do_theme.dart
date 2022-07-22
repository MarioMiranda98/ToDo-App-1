import 'package:flutter/material.dart';

class ToDoTheme {
  static get theme {
    const primaryTextTheme = TextTheme(
      bodyText1: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500
      ),
      bodyText2: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold
      ),
      headline1: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold
      )
    );

    return ThemeData(
      colorScheme: const ColorScheme(
        primary: Color(0XFF2B2D42),
        primaryContainer: Color(0XFF147F91),
        background: Color(0XFFFFFCF2), 
        brightness: Brightness.dark, 
        error: Color(0XFFEF233C), 
        onBackground: Color(0XFF000000), 
        onError: Color(0XFFFF0000),
        onPrimary: Color(0XFF147F91), 
        onSecondary: Color(0XFF8896AB), 
        onSurface: Color(0XFFF8EDEB), 
        secondary: Color(0XFF8D99AE), 
        secondaryContainer: Color(0XFFE2EAFC),
        surface: Color(0XFFF8EDEB),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Hammersmith',
      primaryTextTheme: primaryTextTheme
    );
  }
}