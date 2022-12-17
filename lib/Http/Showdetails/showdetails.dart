import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoichoi_clone_app/Model/Episode/episode.dart';
import 'package:hoichoi_clone_app/Model/ShowDetails/showdetails.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpShowdetails {
  Future<ShowDetails?> getshowdetails({String? showid}) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('$baseurl/api/v1/show_details'));
    request.body = json.encode({"show_id": showid});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      
      return showDetailsFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }

  Future<Allepisode?> getshowepisode({String? seasonid}) async {
    var box = Hive.box('data');
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('$baseurl/api/v1/episodes'));
    request.body =
        json.encode({"user_id": box.get('userid'), "season_id": seasonid});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return allepisodeFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
