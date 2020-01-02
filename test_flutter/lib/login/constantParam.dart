import 'package:flutter/material.dart';

final ThemeData defaultTheme = new ThemeData(
  accentColor: Colors.red,
  //前景色，（文本、按钮等）
  accentColorBrightness: Brightness.dark,
  // accentColor亮度，用于确定放置在突出颜色顶部的文本和图标的颜色（例如FloatingButton上的图标
  primaryColor: Colors.red,
  primarySwatch: Colors.orange,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.orange,
    padding: EdgeInsets.all(7),
  ),
  textTheme: TextTheme(
    title: TextStyle(color: Colors.white, fontSize: 33),
    display1: TextStyle(color: Colors.black, fontSize: 40),
  ),
);
