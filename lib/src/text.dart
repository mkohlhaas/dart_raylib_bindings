import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../dart_raylib_bindings.dart';

class Text {
  final String text;

  Text(this.text);

  void draw(int posX, int posY, int fontSize, Color color) {
    using((Arena arena) {
      final textC = text.toNativeUtf8();
      final colorC = color.toRL();
      rl.DrawText(textC.cast(), posX, posY, fontSize, colorC.ref);
    });
  }
}
