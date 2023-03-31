import 'package:flutter/material.dart';

class Style {
  Style._();
  // colors.
  static const Color icon = Color(0xff333333);

  static const Color iconSelect = Color(0xff334681);

  static const Color primary = Color(0xff377DFF);

  static const Color secondary = Color(0xffBCDCFF);

  static const Color secondaryVariant = Color(0xffFF7763);

  static const Color error = Color(0xffED2E5C);

  static const Color white = Color(0xffffffff);


  static const Color text = Color(0xff333333);

  static const Color bodyText = Color(0xff696A6F);

  static const Color subText = Color(0xffC2C2C2);

  static const Color grey = Color(0xffAFAFAF);

  static const Color lightTextBody = Color(0xffEDEDED);

  static const Color transparent = Colors.transparent;

  static const BoxShadow blueIconShadow = BoxShadow(
    color: Color(0x20696A6F),
    blurRadius: 12,
    spreadRadius: 2,
  );


  static TextStyle regular24({double size = 24, Color color = text}) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle regular16({double size = 16, Color color = text}) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle regular14({double size = 14, Color color = text}) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle regular12({double size = 12, Color color = text}) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium20({double size = 20, Color color = text}) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle medium16({double size = 16, Color color = text}) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle medium14({double size = 14, Color color = text}) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiBold16({double size = 16, Color color = text}) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semiBold14({double size = 14, Color color = text}) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bold20({double size = 20, Color color = text}) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bold16({double size = 16, Color color = text}) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }
}
