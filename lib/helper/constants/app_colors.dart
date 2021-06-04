import 'package:flutter/material.dart';

const Color whiteColor=Colors.white;

const Color errorColor= Color(0xFFFF9C9E);

const Color borderColor= Color(0xFF5F67EC);
const Color appbarColor= Color(0xFFFF9C9E);


const Color backgroundColor=Color(0xFF5F67EC);
const Color fillColor=Color(0xFFF4F6FD);
const Color brownColor= Color(0xFF914D00);
const Color bottomTabBarColor=Color(0xFF9CA1EE);
const Color greyColor= Color(0xFFEcF0F1);

ThemeData normalMode= ThemeData(
        primaryColor: fillColor,
        accentColor: backgroundColor,
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: bottomTabBarColor,
            selectionHandleColor:bottomTabBarColor
        ),
        scaffoldBackgroundColor: backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
);