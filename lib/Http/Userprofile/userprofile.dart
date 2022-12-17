import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoichoi_clone_app/Model/UserProfile/userprofile.dart';
import 'package:hoichoi_clone_app/Toast/toast.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class Httpuserprofile {
  Future<Userpofile?> getuserprofile() async {
    var box = Hive.box('data');
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$baseurl/api/v1/profile'));
    request.body = json.encode({"user_id": box.get('userid')});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      print(responsedata.body);
      return userpofileFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }

  Future updateuserprofile(
      {String? name, userimage, email, phone, useraddress, password}) async {
    var box = Hive.box('data');
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('$baseurl/api/v1/profile_update'));
    request.body = json.encode({
      "user_id": box.get("userid"),
      "name": name,
      "user_image": userimage,
      "email": email,
      "phone": phone,
      "user_address": useraddress,
      "password": password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      print(responsedata.body);
      ShowToastMessage().showsuccess("Update Successfull");
    } else {
      print(responsedata.body);
    }
  }
}
