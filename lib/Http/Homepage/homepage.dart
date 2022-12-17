import 'dart:convert';

import 'package:hoichoi_clone_app/Model/homepage/homepage.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpHomepage {
  Future<Homepagemovie?> gethomepagemovie() async {
    try {
      var request = http.Request('POST', Uri.parse('$baseurl/api/v1/home'));

      http.StreamedResponse response = await request.send();
      var responsedata = await http.Response.fromStream(response);
      
      if (response.statusCode == 200) {
        return homepagemovieFromJson(responsedata.body);
      } else {
        print(responsedata.body);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
