// ignore_for_file: prefer_conditional_assignment, non_constant_identifier_names, unnecessary_null_comparison

import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instace = ColorManager._init();
  static ColorManager get instance {
    return _instace;
  }

  ColorManager._init();

  Color get white => const Color(0xffffffff);
  Color get black => const Color(0xff020306);
  Color get transparent => const Color(0x00000000);
  Color get primary => const Color(0xFF2AB3C6);
  Color get secondary => const Color(0xFF188095);
  Color get thirdDark => const Color(0xFF08293B);
  Color get yellow => const Color(0xFFFFE072);
  Color get gray => const Color(0xFFF1F1F1);

  MaterialColor get materialGray => const MaterialColor(
        0xff000000,
        <int, Color>{
          50: Colors.black,
          100: Colors.black,
          200: Colors.black,
          300: Colors.black,
          400: Colors.black,
          500: Colors.black,
          600: Colors.black,
          700: Colors.black,
          800: Colors.black,
          900: Colors.black,
        },
      );
}
