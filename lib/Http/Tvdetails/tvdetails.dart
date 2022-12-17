import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoichoi_clone_app/Model/TvDetails/tvdetails.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpTvDetails {
  Future<Tvdetails?> gettvdetails({String? tvid}) async {
    var box = Hive.box('data');
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('$baseurl/api/v1/livetv_details'));
    request.body = json.encode({"user_id": box.get('userid'), "tv_id": tvid});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return tvdetailsFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
