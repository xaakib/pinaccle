import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpEpisoderecentWatch {
  Future episoderecent(String episodeid) async {
    var box = Hive.box('data');
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('$baseurl/api/v1/episodes_recently_watched'));
    request.body =
        json.encode({"user_id": box.get('userid'), "episode_id": episodeid});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
