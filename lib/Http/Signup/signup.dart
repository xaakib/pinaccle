import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:hoichoi_clone_app/Toast/toast.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpSignup {
  Future signup({String? name, email, password}) async {
    var headers = {
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest'
    };
    var request = http.Request(
        'POST', Uri.parse('$baseurl/api/v1/signup'));
    request.body =
        json.encode({"name": name, "email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      print(responsedata.body);
      ShowToastMessage().showsuccess(jsonDecode(responsedata.body)["VIDEO_STREAMING_APP"][0]["msg"].toString());
    } else {
      print(responsedata.body);
    }
  }
}
