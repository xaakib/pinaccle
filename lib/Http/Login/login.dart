import 'dart:convert';

import 'package:hoichoi_clone_app/Model/Logindata/logindata.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

import '../../Toast/toast.dart';

class HttpLogin {
  Future<Logindata?> login({String? email, password}) async {
    var headers = {
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest'
    };
    var request = http.Request(
        'POST', Uri.parse('$baseurl/api/v1/login'));
    request.body = json.encode({"email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return logindataFromJson(responsedata.body);
    } else {
      print(responsedata.body);
      ShowToastMessage().showsuccess("Invalid Email Password, Login Failed");
    }
  }
}
