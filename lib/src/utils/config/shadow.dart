import 'package:flutter/material.dart';

const List<BoxShadow> shadowContainerShow = [
  BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 1,
      color: Color.fromRGBO(255, 255, 255, 0.1)),
  BoxShadow(
      offset: Offset(0, 50),
      blurRadius: 100,
      spreadRadius: -20,
      color: Color.fromRGBO(50, 50, 93, 0.25)),
  BoxShadow(
      offset: Offset(0, 30),
      blurRadius: 60,
      spreadRadius: -30,
      color: Color.fromRGBO(0, 0, 0, 0.3))
];

const List<BoxShadow> shadowCard = [
  BoxShadow(
      offset: Offset(0, 6),
      blurRadius: 12,
      spreadRadius: -2,
      color: Color.fromRGBO(50, 50, 93, 0.25)),
  BoxShadow(
      offset: Offset(0, 3),
      blurRadius: 7,
      spreadRadius: -3,
      color: Color.fromRGBO(0, 0, 0, 0.3)),
];
