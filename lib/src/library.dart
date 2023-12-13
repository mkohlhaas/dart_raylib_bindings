import 'dart:ffi';

import '../dart_raylib_bindings.dart';

final rl = RaylibC(DynamicLibrary.open('libraylib.so'));
