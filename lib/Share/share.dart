import 'package:flutter_share/flutter_share.dart';

class NativeShare {
  Future<void> share(String url) async {
    await FlutterShare.share(
        title: 'Share',
        text: '',
        linkUrl: url,
        chooserTitle: 'Example Chooser Title');
  }
}
