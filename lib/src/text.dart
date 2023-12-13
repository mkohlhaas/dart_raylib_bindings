import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../dart_raylib_bindings.dart';

class Text {
  final String text;

  late Pointer<Utf8> mem;
  static final Finalizer<Pointer<Utf8>> _finalizer = Finalizer((mem) {
    calloc.free(mem);
  });

  Text(this.text) {
    mem = text.toNativeUtf8();
    _finalizer.attach(this, mem);
  }

  void draw(int posX, int posY, int fontSize, Color color) {
    rl.DrawText(mem.cast(), posX, posY, fontSize, color.mem.ref);
  }
}
