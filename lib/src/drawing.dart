import '../dart_raylib_bindings.dart';

draw(void Function() f) {
  rl.BeginDrawing();
  f();
  rl.EndDrawing();
}

// drawIn2DMode(void Function(Camera2D camera) f, Camera2D camera) {
//   rl.BeginMode2D(camera);
//   f(camera);
//   rl.EndMode2D();
// }

// drawIn3DMode(void Function(Camera3D camera) f, Camera3D camera) {
//   rl.BeginMode3D(camera);
//   f(camera);
//   rl.EndMode3D();
// }

// drawInTextureMode(void Function(RenderTexture2D target) f, RenderTexture2D target) {
//   rl.BeginTextureMode(target);
//   f(target);
//   rl.EndMode3D();
// }

// drawInShaderMode(void Function(Shader shader) f, Shader shader) {
//   rl.BeginShaderMode(shader);
//   f(shader);
//   rl.EndMode3D();
// }

// drawInBlendMode(void Function(int mode) f, int mode) {
//   rl.BeginBlendMode(mode);
//   f(mode);
//   rl.EndMode2D();
// }

// drawInScissorMode(void Function(int x, int y, int width, int height) f, int x, int y, int width, int height) {
//   rl.BeginScissorMode(x, y, width, height);
//   f(x, y, width, height);
//   rl.EndMode2D();
// }

// drawInVrStereoMode(void Function(VrStereoConfig config) f, VrStereoConfig config) {
//   rl.BeginVrStereoMode(config);
//   f(config);
//   rl.EndMode2D();
// }
