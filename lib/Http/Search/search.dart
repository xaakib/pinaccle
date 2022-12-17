import 'dart:convert';

import 'package:hoichoi_clone_app/Model/SearchResult/searchresult.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpSearch {
  Future<SearchResult?> getsearchresult({String? search}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$baseurl/api/v1/search'));
    request.body = json.encode({"search_text": search});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return searchResultFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
