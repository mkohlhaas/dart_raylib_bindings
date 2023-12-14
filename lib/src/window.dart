import 'dart:ffi';

import 'package:ffi/ffi.dart';

import '../dart_raylib_bindings.dart';

class Window {
  static final Map<String, Window> _uniqueInstance = <String, Window>{};
  final int width;
  final int height;
  final String title;

  // Window is a singleton
  factory Window(int width, int height, String title) {
    return _uniqueInstance.putIfAbsent('uniqueWindowInstance', () => Window._(width, height, title));
  }

  Window._(this.width, this.height, this.title) {
    using((Arena arena) {
      final titleC = title.toNativeUtf8();
      rl.InitWindow(width, height, titleC.cast());
    });
  }

  void clear(Color color) {
    using((Arena arena) {
      final colorC = color.toRL();
      rl.ClearBackground(colorC.ref);
    });
  }

  // Clear window configuration state flags
  void clearState(int flags) {
    rl.ClearWindowState(flags);
  }

  void close() {
    rl.CloseWindow();
  }

  // Disables cursor (lock cursor)
  void disableCursor() {
    rl.DisableCursor();
  }

  // Disable waiting for events on EndDrawing(), automatic events polling
  void disableEventWaiting() {
    rl.DisableEventWaiting();
  }

  void drawFPS(int posX, int posY) {
    rl.DrawFPS(posX, posY);
  }

  // Enables cursor (unlock cursor)
  void enableCursor() {
    rl.EnableCursor();
  }

  // Enable waiting for events on EndDrawing(), no automatic event polling
  void enableEventWaiting() {
    rl.EnableEventWaiting();
  }

  // Get clipboard text content
  String? getClipboardText() {
    final t = rl.GetClipboardText().cast<Utf8>();
    if (t == nullptr) {
      return null;
    } else {
      return t.toDartString();
    }
  }

  // Get current connected monitor
  int getCurrentMonitor() {
    return rl.GetCurrentMonitor();
  }

  // Get number of connected monitors
  int getMonitorCount() {
    return rl.GetMonitorCount();
  }

  // Get specified monitor height (current video mode used by monitor)
  int getMonitorHeight(int monitor) {
    return rl.GetMonitorHeight(monitor);
  }

  // Get the human-readable, UTF-8 encoded name of the specified monitor
  String getMonitorName(int monitor) {
    return rl.GetMonitorName(monitor).cast<Utf8>().toDartString();
  }

  // Get specified monitor physical height in millimetres
  int getMonitorPhysicalHeight(int monitor) {
    return rl.GetMonitorPhysicalHeight(monitor);
  }

  // Get specified monitor physical width in millimetres
  int getMonitorPhysicalWidth(int monitor) {
    return rl.GetMonitorPhysicalWidth(monitor);
  }

  // Get specified monitor position
  Vector2 getMonitorPosition(int monitor) {
    RLVector2 v = rl.GetMonitorPosition(monitor);
    return Vector2(v.x, v.y);
  }

  // Get specified monitor refresh rate
  int getMonitorRefreshRate(int monitor) {
    return rl.GetMonitorRefreshRate(monitor);
  }

  // Get specified monitor width (current video mode used by monitor)
  int getMonitorWidth(int monitor) {
    return rl.GetMonitorWidth(monitor);
  }

  // Get current render height (it considers HiDPI)
  int getRenderHeight() {
    return getRenderHeight();
  }

  // Get current render width (it considers HiDPI)
  int getRenderWidth() {
    return getRenderWidth();
  }

  // Get window scale DPI factor
  Vector2 getScaleDPI() {
    final v = rl.GetWindowScaleDPI();
    return Vector2(v.x, v.y);
  }

  // Get current screen height
  int getScreenHeight() {
    return rl.GetScreenHeight();
  }
  // Get native window handle
  // void *GetWindowHandle(void)

  // Get current screen width
  int getScreenWidth() {
    return rl.GetScreenWidth();
  }

  // Get window position XY on monitor
  Vector2 getWindowPosition() {
    final v = rl.GetWindowPosition();
    return Vector2(v.x, v.y);
  }

  // Hides cursor
  void hideCursor() {
    rl.HideCursor();
  }

  // Check if cursor is not visible
  bool isCursorHidden() {
    return rl.IsCursorHidden();
  }

  // Check if cursor is on the screen
  bool isCursorOnScreen() {
    return rl.IsCursorOnScreen();
  }

  // Check if window is currently focused (only PLATFORM_DESKTOP)
  bool isFocused() {
    return rl.IsWindowFocused();
  }

  // Check if window is currently fullscreen
  bool isFullscreen() {
    return rl.IsWindowFullscreen();
  }

  // Check if window is currently hidden (only PLATFORM_DESKTOP)
  bool isHidden() {
    return rl.IsWindowHidden();
  }

  bool isKeyPressed(int key) {
    return rl.IsKeyPressed(key);
  }

  // Check if window is currently maximized (only PLATFORM_DESKTOP)
  bool isMaximized() {
    return rl.IsWindowMinimized();
  }

  // Check if window is currently minimized (only PLATFORM_DESKTOP)
  bool isMinimized() {
    return rl.IsWindowMinimized();
  }

  // Check if window has been initialized successfully
  bool isReady() {
    return rl.IsWindowReady();
  }

  // Check if window has been resized last frame
  bool isResized() {
    return rl.IsWindowResized();
  }

  // Check if one specific window flag is enabled
  bool isState(int flag) {
    return rl.IsWindowState(flag);
  }

  // Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
  void maximize() {
    rl.MaximizeWindow();
  }

  // Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
  void minimize() {
    rl.MinimizeWindow();
  }

  // Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
  void restore() {
    rl.RestoreWindow();
  }

  // Set clipboard text content
  void setClipboardText(String text) {
    rl.SetClipboardText(text.toNativeUtf8().cast());
  }

  // Set window focused (only PLATFORM_DESKTOP)
  void setFocused() {
    rl.SetWindowFocused();
  }

  // Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
  void setMaxSize(int width, int height) {
    rl.SetWindowMaxSize(width, height);
  }

  // Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
  void setMinSize(int width, int height) {
    rl.SetWindowMinSize(width, height);
  }

  // Set monitor for the current window
  void setMonitor(int monitor) {
    rl.SetWindowMonitor(monitor);
  }

  // Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP)
  void setOpacity(double opacity) {
    rl.SetWindowOpacity(opacity);
  }

  // Set window position on screen (only PLATFORM_DESKTOP)
  void setPosition(int x, int y) {
    rl.SetWindowPosition(x, y);
  }

  // Set window dimensions
  void setSize(int width, int height) {
    rl.SetWindowSize(width, height);
  }

  // Set window configuration state using flags (only PLATFORM_DESKTOP)
  void setState(int flags) {
    rl.SetWindowState(flags);
  }

  void setTargetFPS(int fps) {
    rl.SetTargetFPS(fps);
  }

  //    void SetWindowIcon(Image image)
  //    void SetWindowIcons(Image *images, int count);              // Set icon for window (multiple images, RGBA 32bit, only PLATFORM_DESKTOP)

  // Set title for window (only PLATFORM_DESKTOP and PLATFORM_WEB)
  void setTitle(String title) {
    using((Arena arena) {
      final titleC = title.toNativeUtf8();
      rl.SetWindowTitle(titleC.cast());
    });
  }

  bool shouldClose() {
    return rl.WindowShouldClose();
  }

  bool shouldNotClose() {
    return !shouldClose();
  }

  // Shows cursor
  void showCursor() {
    rl.ShowCursor();
  }

  // Toggle window state: borderless windowed (only PLATFORM_DESKTOP)
  void toggleBorderless() {
    rl.ToggleBorderlessWindowed();
  }

  // Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
  void toggleFullscreen() {
    rl.ToggleFullscreen();
  }
}
