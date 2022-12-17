import 'dart:convert';

import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

import '../../Model/Movies/movies.dart';

class Httpmoviegenre {
  Future<Movies?> getmovie({String? genreid}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$baseurl/api/v1/movies'));
    request.body = '''{"filter"}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return moviesFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }


  Future<Movies?> getmoviebygenre({String? genreid}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('$baseurl/api/v1/movies_by_genre'));
    request.body = json.encode({"genre_id": genreid, "filter": ""});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return moviesFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
