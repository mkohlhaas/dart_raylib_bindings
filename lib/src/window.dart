import 'dart:ffi';
import 'package:ffi/ffi.dart';

import '../dart_raylib_bindings.dart';

class Window {
  final int width;
  final int height;
  final String title;

  static final Map<String, Window> _uniqueInstance = <String, Window>{};

  Window._(this.width, this.height, this.title) {
    using((Arena arena) {
      final titleC = title.toNativeUtf8();
      rl.InitWindow(width, height, titleC.cast());
    });
  }

  factory Window(int width, int height, String title) {
    return _uniqueInstance.putIfAbsent('uniqueWindowInstance', () => Window._(width, height, title));
  }

  bool shouldClose() {
    return rl.WindowShouldClose();
  }

  bool shouldNotClose() {
    return !shouldClose();
  }

  void clear(Color color) {
    rl.ClearBackground(color.mem.ref);
  }

  void close() {
    rl.CloseWindow();
  }

  void setTargetFPS(int fps) {
    rl.SetTargetFPS(fps);
  }

  void drawFPS(int posX, int posY) {
    rl.DrawFPS(posX, posY);
  }

  void toggleFullscreen() {
    rl.ToggleFullscreen();
  }

  bool isKeyPressed(int key) {
    return rl.IsKeyPressed(key);
  }
}
