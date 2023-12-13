// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:dart_raylib_bindings/src/raylibc.dart';
import 'package:ffi/ffi.dart';

class Color {
  int r;
  int g;
  int b;
  int a;
  late Pointer<RLColor> mem;
  static final Finalizer<Pointer<RLColor>> _finalizer = Finalizer((mem) {
    calloc.free(mem);
  });

  Color(this.r, this.g, this.b, this.a) {
    mem = calloc<RLColor>();
    mem.ref.r = r;
    mem.ref.g = g;
    mem.ref.b = b;
    mem.ref.a = a;
    _finalizer.attach(this, mem);
  }

  set red(int r) {
    this.r = r;
    mem.ref.r = r;
  }

  set green(int g) {
    this.g = g;
    mem.ref.g = g;
  }

  set blue(int b) {
    this.b = b;
    mem.ref.b = b;
  }

  set alpha(int a) {
    this.a = a;
    mem.ref.a = a;
  }

  @override
  String toString() {
    return 'Color($r, $g, $b, $a)';
  }

  static final LightGray = Color(200, 200, 200, 255);
  static final Gray = Color(130, 130, 130, 255);
  static final DarkGray = Color(80, 80, 80, 255);
  static final Yellow = Color(253, 249, 0, 255);
  static final Gold = Color(255, 203, 0, 255);
  static final Orange = Color(255, 161, 0, 255);
  static final Pink = Color(255, 109, 194, 255);
  static final Red = Color(230, 41, 55, 255);
  static final Maroon = Color(190, 33, 55, 255);
  static final Green = Color(0, 228, 48, 255);
  static final Lime = Color(0, 158, 47, 255);
  static final DarkGreen = Color(0, 117, 44, 255);
  static final SkyBlue = Color(102, 191, 255, 255);
  static final Blue = Color(0, 121, 241, 255);
  static final DarkBlue = Color(0, 82, 172, 255);
  static final Purple = Color(200, 122, 255, 255);
  static final Violet = Color(135, 60, 190, 255);
  static final DarkPurple = Color(112, 31, 126, 255);
  static final Beige = Color(211, 176, 131, 255);
  static final Brown = Color(127, 106, 79, 255);
  static final DarkBrown = Color(76, 63, 47, 255);
  static final White = Color(255, 255, 255, 255);
  static final Black = Color(0, 0, 0, 255);
  static final Blank = Color(0, 0, 0, 0);
  static final Magenta = Color(255, 0, 255, 255);
  static final RayWhite = Color(245, 245, 245, 255);
}
