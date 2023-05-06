import 'package:flutter/material.dart';

class AppStyles {
  static const PRIMARY_COLOR = Color(0xffF3BA2F);
  static const PRIMARY_COLOR_LIGHT = Color(0xffFFF6E0);
  static const SECONDARY_COLOR = Color(0xff3ABEF0);
  static const SECONDARY_COLOR_LIGHT = Color(0xffF5FCFF);
  static const DISABLED_COLOR = Color(0xffDFDFDF);
  static const HINT_COLOR = Color(0xff717171);
  static const TEXT_COLOR = Color(0xff262626);
  static List<BoxShadow> DEFAULT_SHADOW = <BoxShadow>[
    BoxShadow(
      color: Colors.grey[200]!,
      spreadRadius: 3,
      blurRadius: 15,
      offset: const Offset(0, 15),
    )
  ];
  static List<BoxShadow> SMALL_SHADOW = <BoxShadow>[
    BoxShadow(
      color: Colors.grey[200]!,
      spreadRadius: 3,
      blurRadius: 15,
      offset: const Offset(0, 6),
    )
  ];

  static const ButtonThemeData btnTheme = ButtonThemeData(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
    buttonColor: PRIMARY_COLOR,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
    ),
  );

  static ThemeData appThemeLight = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: PRIMARY_COLOR,
      secondary: SECONDARY_COLOR,
    ),
    brightness: Brightness.light,
    backgroundColor: PRIMARY_COLOR_LIGHT,
    scaffoldBackgroundColor: Colors.white,
    hintColor: HINT_COLOR,
    primaryColor: PRIMARY_COLOR,
    primaryColorLight: PRIMARY_COLOR_LIGHT,
    cardColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppStyles.DISABLED_COLOR),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppStyles.DISABLED_COLOR),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppStyles.PRIMARY_COLOR),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      filled: false,
      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
      isDense: true,
    ),
    primaryColorDark: PRIMARY_COLOR,
    disabledColor: DISABLED_COLOR,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black, size: 25),
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'Axiforma',
      ),
      centerTitle: true,
    ),
    buttonTheme: btnTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(color: PRIMARY_COLOR),
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 14),
      bodyText2: TextStyle(fontSize: 12),
      headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
      headline4: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ).apply(
      bodyColor: TEXT_COLOR,
      displayColor: TEXT_COLOR,
    ),
    fontFamily: 'Axiforma',
  );
}
