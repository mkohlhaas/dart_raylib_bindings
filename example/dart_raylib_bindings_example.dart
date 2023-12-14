import 'dart:math';

import 'package:dart_raylib_bindings/dart_raylib_bindings.dart';

void main() {
  final window = Window(880, 440, 'Window Title');
  final text = Text('Congrats! You created your first window!');
  window.setTargetFPS(1);
  final r = Random();
  window.setMaxSize(1600, 800);
  window.setMinSize(1600, 800);
  print(window.getMonitorName(0));
  print(window.getMonitorPhysicalHeight(0));
  print(window.getMonitorPhysicalWidth(0));
  print(window.getMonitorCount());
  print(window.getMonitorWidth(0));
  print(window.getMonitorHeight(0));
  print(window.getMonitorRefreshRate(0));

  while (window.shouldNotClose()) {
    Color c = Color(r.nextInt(256), r.nextInt(256), r.nextInt(256), r.nextInt(256));
    print(c);
    print(window.getWindowPosition());
    print(window.getClipboardText());
    if (window.isKeyPressed(KeyboardKey.KEY_S)) {
      window.setClipboardText('Here speaks raylib!');
    }
    // print(window.isFullscreen());
    if (window.isKeyPressed(KeyboardKey.KEY_D)) {
      window.enableCursor();
    }
    if (window.isKeyPressed(KeyboardKey.KEY_C)) {
      window.disableCursor();
    }
    if (window.isKeyPressed(KeyboardKey.KEY_F)) {
      window.toggleFullscreen();
    }
    draw(() {
      window.clear(c);
      text.draw(190, 200, 20, Color.LightGray);
    });
  }
  window.close();
}
