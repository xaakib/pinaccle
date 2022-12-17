import 'dart:convert';
import 'package:hoichoi_clone_app/Model/Shows/shows.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class Httpshow {
  Future<Shows?> getshows() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$baseurl/api/v1/shows'));
    request.body = json.encode({"filter": ""});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return showsFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
