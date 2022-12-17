import 'package:flutter/services.dart';

class ExoPlayer {
  final platform = MethodChannel('samples.flutter.dev/video_player');
  Future exoplayerbuild(String url) async {
    try {
      var gallaydata1 = await platform.invokeMethod('exoplayerbuild',url);
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }
}
