import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext { 
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenShortestSide=> MediaQuery.of(this).size.shortestSide; // vai retornar o menor tamanho entre a largura e a altura 
  double get screenLongestSide=> MediaQuery.of(this).size.longestSide; // vai retornar o maior tamanho entre a largura e a altura 

  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;
}