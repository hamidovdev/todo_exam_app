// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppStyles extends ThemeExtension<AppStyles> {
  final TextStyle fontSz14Weight600ColorDark1;
  final TextStyle fontSz10Weight400ColorDark1;
  final TextStyle fontSz12Weight400ColorGrey3;
  final TextStyle fontSz12Weight400ColorDark1;
  final TextStyle fontSz10Weight600ColorWhite;
  final TextStyle fontSz14Weight600ColorBlue;
  final TextStyle fontSz8Weight400ColorBlue;
  final TextStyle fontSz10Weight400ColorBlue;
  final TextStyle fontSz14Weight600ColorRed;
  final TextStyle fontSz8Weight400ColorRed;
  final TextStyle fontSz10Weight400ColorRed;
  final TextStyle fontSz14Weight600ColorOrange;
  final TextStyle fontSz8Weight400ColorOrange;
  final TextStyle fontSz10Weight400ColorOrange;
  final TextStyle fontSz14Weight400ColorDark2;
  final TextStyle fontSz16Weight400ColorWhite;
  final TextStyle fontSz14Weight400ColorWhite;
  final TextStyle fontSz26Weight600ColorWhite;
  final TextStyle fontSz8Weight400ColorWhite;
  final TextStyle fontSz10Weight400ColorWhite;
  final TextStyle fontSz16Wight600ColorBlack;
  final TextStyle fontSz16Weight400ColorGrey1;
  final TextStyle fontSz10Weight400ColorGrey2;
  final TextStyle fontSz24Weight600ColorDark1;

  AppStyles({
    required this.fontSz14Weight600ColorDark1,
    required this.fontSz10Weight400ColorDark1,
    required this.fontSz12Weight400ColorGrey3,
    required this.fontSz12Weight400ColorDark1,
    required this.fontSz10Weight600ColorWhite,
    required this.fontSz14Weight600ColorBlue,
    required this.fontSz8Weight400ColorBlue,
    required this.fontSz10Weight400ColorBlue,
    required this.fontSz14Weight600ColorRed,
    required this.fontSz8Weight400ColorRed,
    required this.fontSz10Weight400ColorRed,
    required this.fontSz14Weight600ColorOrange,
    required this.fontSz8Weight400ColorOrange,
    required this.fontSz10Weight400ColorOrange,
    required this.fontSz14Weight400ColorDark2,
    required this.fontSz16Weight400ColorWhite,
    required this.fontSz14Weight400ColorWhite,
    required this.fontSz26Weight600ColorWhite,
    required this.fontSz8Weight400ColorWhite,
    required this.fontSz10Weight400ColorWhite,
    required this.fontSz16Wight600ColorBlack,
    required this.fontSz16Weight400ColorGrey1,
    required this.fontSz10Weight400ColorGrey2,
    required this.fontSz24Weight600ColorDark1,
  });

  @override
  ThemeExtension<AppStyles> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppStyles> lerp(
      covariant ThemeExtension<AppStyles>? other, double t) {
    if (other is! AppStyles) {
      return this;
    }
    return AppStyles(
      fontSz14Weight600ColorDark1: fontSz14Weight600ColorDark1,
      fontSz10Weight400ColorDark1: fontSz10Weight400ColorDark1,
      fontSz12Weight400ColorGrey3: fontSz12Weight400ColorGrey3,
      fontSz12Weight400ColorDark1: fontSz12Weight400ColorDark1,
      fontSz10Weight600ColorWhite: fontSz10Weight600ColorWhite,
      fontSz14Weight600ColorBlue: fontSz14Weight600ColorBlue,
      fontSz8Weight400ColorBlue: fontSz8Weight400ColorBlue,
      fontSz10Weight400ColorBlue: fontSz10Weight400ColorBlue,
      fontSz14Weight600ColorRed: fontSz14Weight600ColorRed,
      fontSz8Weight400ColorRed: fontSz8Weight400ColorRed,
      fontSz10Weight400ColorRed: fontSz10Weight400ColorRed,
      fontSz14Weight600ColorOrange: fontSz14Weight600ColorOrange,
      fontSz8Weight400ColorOrange: fontSz8Weight400ColorOrange,
      fontSz10Weight400ColorOrange: fontSz10Weight400ColorOrange,
      fontSz14Weight400ColorDark2: fontSz14Weight400ColorDark2,
      fontSz16Weight400ColorWhite: fontSz16Weight400ColorWhite,
      fontSz14Weight400ColorWhite: fontSz14Weight400ColorWhite,
      fontSz26Weight600ColorWhite: fontSz26Weight600ColorWhite,
      fontSz8Weight400ColorWhite: fontSz8Weight400ColorWhite,
      fontSz10Weight400ColorWhite: fontSz10Weight400ColorWhite,
      fontSz16Wight600ColorBlack: fontSz16Wight600ColorBlack,
      fontSz16Weight400ColorGrey1: fontSz16Weight400ColorGrey1,
      fontSz10Weight400ColorGrey2: fontSz10Weight400ColorGrey2,
      fontSz24Weight600ColorDark1: fontSz24Weight600ColorDark1,
    );
  }
}
