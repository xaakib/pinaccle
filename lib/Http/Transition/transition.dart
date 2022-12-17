import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoichoi_clone_app/Toast/toast.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:http/http.dart' as http;

class HttpTransition {
  Future transitionadd(
      {String? planid, String? paymentid, String? paymentgatway}) async {
    var box = Hive.box('data');
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('$baseurl/api/v1/transaction_add'));
    request.body = json.encode({
      "plan_id": planid,
      "user_id": box.get('userid'),
      "payment_id": paymentid,
      "payment_gateway": paymentgatway
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      print(responsedata.body);
      ShowToastMessage().showsuccess("Payment Successfull");
    } else {
      print(responsedata.body);
    }
  }
}
