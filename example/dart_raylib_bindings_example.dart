import 'dart:math';

import 'package:dart_raylib_bindings/dart_raylib_bindings.dart';

void main() {
  final window = Window(880, 440, 'Window Title');
  final text = Text('Congrats! You created your first window!');
  window.setTargetFPS(1);
  final r = Random();
  Color c = Color(0, 0, 0, 0);

  while (window.shouldNotClose()) {
    c.red = r.nextInt(256);
    c.green = r.nextInt(256);
    c.blue = r.nextInt(256);
    c.alpha = r.nextInt(256);
    print(c);
    print(c.hashCode);
    if (window.isKeyPressed(KeyboardKey.KEY_F)) {
      window.toggleFullscreen();
    }
    draw(() {
      window.drawFPS(50, 50);
      window.clear(c);
      text.draw(190, 200, 20, Color.LightGray);
    });
  }
  window.close();
}
