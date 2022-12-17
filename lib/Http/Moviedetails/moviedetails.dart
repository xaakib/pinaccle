import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoichoi_clone_app/Model/MovieDetails/moviedetails.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpMoviedetails {
  Future<MovieDetails?> getmoviedetail({String? movieid}) async {
    var box = Hive.box('data');
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('$baseurl/api/v1/movies_details'));
    request.body =
        json.encode({"movie_id": movieid, "user_id": box.get("userid")});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return movieDetailsFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
