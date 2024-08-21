// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/asset/colors.dart';
import 'package:todo_app/asset/fonts.dart';

class AppTheme {
  ThemeData lightTheme() {
    final colors = AppColors();
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: colors.white,
        elevation: 0,
        surfaceTintColor: colors.white,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        elevation: 0,
        color: colors.white,
        surfaceTintColor: colors.white,
      ),
      scaffoldBackgroundColor: colors.white,
      fontFamily: "Poppins",
      extensions: [
        AppStyles(
          fontSz14Weight600ColorDark1: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: colors.dark1,
          ),
          fontSz10Weight400ColorDark1: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: colors.dark1,
          ),
          fontSz12Weight400ColorGrey3: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: colors.grey3,
          ),
          fontSz12Weight400ColorDark1: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: colors.dark1,
          ),
          fontSz10Weight600ColorWhite: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: colors.white,
          ),
          fontSz14Weight600ColorBlue: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: colors.blue2,
          ),
          fontSz8Weight400ColorBlue: TextStyle(
            fontSize: 8.sp,
            fontWeight: FontWeight.w400,
            color: colors.blue2,
          ),
          fontSz10Weight400ColorBlue: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: colors.blue2,
          ),
          fontSz14Weight600ColorRed: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: colors.red2,
          ),
          fontSz8Weight400ColorRed: TextStyle(
            fontSize: 8.sp,
            fontWeight: FontWeight.w400,
            color: colors.red2,
          ),
          fontSz10Weight400ColorRed: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: colors.red2,
          ),
          fontSz14Weight600ColorOrange: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: colors.orange2,
          ),
          fontSz8Weight400ColorOrange: TextStyle(
            fontSize: 8.sp,
            fontWeight: FontWeight.w400,
            color: colors.orange2,
          ),
          fontSz10Weight400ColorOrange: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: colors.orange2,
          ),
          fontSz14Weight400ColorDark2: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: colors.dark2,
          ),
          fontSz16Weight400ColorWhite: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: colors.white,
          ),
          fontSz14Weight400ColorWhite: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: colors.white,
          ),
          fontSz26Weight600ColorWhite: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.w600,
            color: colors.white,
          ),
          fontSz8Weight400ColorWhite: TextStyle(
            fontSize: 8.sp,
            fontWeight: FontWeight.w400,
            color: colors.white,
          ),
          fontSz10Weight400ColorWhite: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: colors.white,
          ),
          fontSz16Wight600ColorBlack: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: colors.black,
          ),
          fontSz16Weight400ColorGrey1: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: colors.grey1,
          ),
          fontSz10Weight400ColorGrey2: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: colors.grey2,
          ),
          fontSz24Weight600ColorDark1: TextStyle(
            fontSize: 24,
            color: colors.dark1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
