import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_a_camping/tools/colors.dart';
import 'package:m_a_camping/tools/styles.dart';

TextTheme buildTextTheme(TextTheme base, String? language,
    [String font = 'Montserrat']) {
  font = 'Montserrat';
  var newBase = kTextTheme(base, language);
  return newBase
      .copyWith(
        headline3: GoogleFonts.getFont(
          font,
          textStyle: newBase.headline3!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        headline4: GoogleFonts.getFont(
          font,
          textStyle: newBase.headline4!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        headline5: GoogleFonts.getFont(
          font,
          textStyle: newBase.headline5!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        headline6: GoogleFonts.getFont(
          font,
          textStyle: newBase.headline6!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        caption: GoogleFonts.getFont(
          font,
          textStyle: newBase.caption!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        ),
        subtitle1: GoogleFonts.getFont(
          font,
          textStyle: newBase.subtitle1!.copyWith(
              fontWeight: FontWeight.w400, fontSize: 16.0, color: Colors.white),
        ),
        button: GoogleFonts.getFont(
          font,
          textStyle: newBase.button!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        ),
      )
      .apply(
        displayColor: kTextColor,
        bodyColor: kTextLightColor,
      )
      .copyWith(
        headline1: kHeadlineTheme(newBase).headline1!.copyWith(),
        headline2: kHeadlineTheme(newBase).headline2!.copyWith(),
        headline5: kHeadlineTheme(newBase).headline5!.copyWith(),
        headline6: kHeadlineTheme(newBase).headline6!.copyWith(),
      );
}

IconThemeData customIconTheme(IconThemeData original) {
  return original.copyWith(color: kLightPrimary);
}

ThemeData buildLightTheme([String fontFamily = 'Montserrat']) {
  final base = ThemeData.light();

  return base.copyWith(
    brightness: Brightness.light,
    cardColor: Colors.white,
    errorColor: kErrorRed,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        side: const BorderSide(
          width: 1.0,
          color: Colors.white,
          style: BorderStyle.solid,
        ),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    primaryIconTheme: customIconTheme(base.iconTheme),
    textTheme: buildTextTheme(base.textTheme, 'en', fontFamily),
    primaryTextTheme: buildTextTheme(base.primaryTextTheme, 'en', fontFamily),
    iconTheme: customIconTheme(base.iconTheme),
    hintColor: Colors.black26,
    backgroundColor: Colors.white,
    primaryColor: kLightPrimary,
    scaffoldBackgroundColor: kBackGroundColor,
    appBarTheme: const AppBarTheme(
        shadowColor: kShadowColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: kLightAccent,
        ),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black)),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    }),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ),
  );
}
