import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/PAymentSetting/paymentsetting.dart';
import 'package:hoichoi_clone_app/Provider/paymentsetting.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http_auth/http_auth.dart';
import 'package:provider/provider.dart';

class PaypalServices {
  // Future gettoken() async {
  //   var paypal = await HttpPaymentSetting().getpaymentsetting();
  //   String clientid =
  //       "AQ5UTqGIjeAzMZRqzIj_tJQL8UfLeRhKnUbxJQojkM4Us7gxlO0sC_Pqh63bwpi_gPdqhFy9Fqc-Inmr";
  //   String secret =
  //       "EMedv6NnoLDVR6ZOezPw3cWaozejADDd652s9L382rIW-707IuzPA0GE0gtd4Rngcgkt2Wi0hiYuVYNN";

  //   var headers = {
  //     'Authorization': 'Basic ${clientid}${secret}',
  //     'Content-Type': 'application/x-www-form-urlencoded'
  //   };
  //   var request = http.Request(
  //       'POST', Uri.parse('https://api-m.sandbox.paypal.com/v1/oauth2/token'));
  //   request.bodyFields = {
  //     'grant_type': 'client_credentials',
  //     'ignoreCache': 'true',
  //     'return_authn_schemes': 'true',
  //     'return_client_metadata': 'true',
  //     'return_unconsented_scopes': 'true'
  //   };
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();
  //   var responsedata = await http.Response.fromStream(response);

  //   if (response.statusCode == 200) {
  //     print(responsedata.body);
  //   } else {
  //     print(responsedata.body);
  //   }
  // }

  String domain = "https://api.sandbox.paypal.com"; // for sandbox mode
//  String domain = "https://api.paypal.com"; // for production mode

  // change clientId and secret with your own, provided by paypal
  String clientId =
      'AQ5UTqGIjeAzMZRqzIj_tJQL8UfLeRhKnUbxJQojkM4Us7gxlO0sC_Pqh63bwpi_gPdqhFy9Fqc-Inmr';
  String secret =
      'EMedv6NnoLDVR6ZOezPw3cWaozejADDd652s9L382rIW-707IuzPA0GE0gtd4Rngcgkt2Wi0hiYuVYNN';

  // for getting the access token from Paypal
  Future<String?> getAccessToken(BuildContext context) async {
    final paymentsetting = Provider.of<PaymentSettingProvider>(context, listen: false);
    try {
      var client = BasicAuthClient(paymentsetting.paymentSetting!.videoStreamingApp!.first.paypalClientId!, paymentsetting.paymentSetting!.videoStreamingApp!.first.paypalSecret!);
      var response = await client.post(
          Uri.parse('$domain/v1/oauth2/token?grant_type=client_credentials'));
      if (response.statusCode == 200) {
        final body = convert.jsonDecode(response.body);
        return body["access_token"];
      }
    } catch (e) {
      rethrow;
    }
  }

  // for creating the payment request with Paypal
  Future<Map<String, String>?> createPaypalPayment(
      transactions, accessToken) async {
    try {
      var response = await http.post(Uri.parse("$domain/v1/payments/payment"),
          body: convert.jsonEncode(transactions),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });

      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 201) {
        if (body["links"] != null && body["links"].length > 0) {
          List links = body["links"];

          String executeUrl = "";
          String approvalUrl = "";
          final item = links.firstWhere((o) => o["rel"] == "approval_url",
              orElse: () => null);
          if (item != null) {
            approvalUrl = item["href"];
          }
          final item1 = links.firstWhere((o) => o["rel"] == "execute",
              orElse: () => null);
          if (item1 != null) {
            executeUrl = item1["href"];
          }
          return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
        }
      } else {
        throw Exception(body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  // for executing the payment transaction
  Future<String?> executePayment(url, payerId, accessToken) async {
    try {
      var response = await http.post(Uri.parse(url),
          body: convert.jsonEncode({"payer_id": payerId}),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });

      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        return body["id"];
      }
    } catch (e) {
      rethrow;
    }
  }
}
