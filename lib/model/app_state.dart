import 'package:flutter/material.dart';

class AppState {
  double? sliderFontSize;
  bool? bold;
  bool? italic;

  AppState({this.sliderFontSize, this.bold, this.italic});

  AppState.fromAppState(AppState another) {
    sliderFontSize = another.sliderFontSize;
    bold = another.bold;
    italic = another.italic;
  }

  double get viewFontSize => sliderFontSize! * 30;
}
