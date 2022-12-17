// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hoichoi_clone_app/Http/Transition/transition.dart';
import 'package:hoichoi_clone_app/Provider/paymentsetting.dart';
import 'package:hoichoi_clone_app/mainpage.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

class HttpStripe {
  Map<String, dynamic>? paymentIntentData;

  Future strypeinit(BuildContext context) async {
    final paymentsetting =
        Provider.of<PaymentSettingProvider>(context, listen: false);
    Stripe.publishableKey = paymentsetting
        .paymentSetting!.videoStreamingApp!.first.stripePublishableKey!;
    Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
    Stripe.urlScheme = 'flutterstripe';

    await Stripe.instance.applySettings();
  }

  Future<void> makePayment(
      {required BuildContext context,
      required String amount,
      required String currency,
      required String planid}) async {
    final paymentsetting =
        Provider.of<PaymentSettingProvider>(context, listen: false);
    try {
      paymentIntentData = await createPaymentIntent(
          amount,
          currency,
          paymentsetting
              .paymentSetting!.videoStreamingApp!.first.stripeSecretKey
              .toString()); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  applePay: PaymentSheetApplePay(
                    merchantCountryCode: 'US',
                  ),
                  googlePay: PaymentSheetGooglePay(
                    merchantCountryCode: 'U',
                    testEnv: true,
                  ),
                 
                  style: ThemeMode.dark,
                  
                  merchantDisplayName: 'ANNIE'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet(context, planid);
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet(BuildContext context, String planid) async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
              parameters: PresentPaymentSheetParameters(
        clientSecret: paymentIntentData!['client_secret'],
        confirmPayment: true,
      ))
          .then((newValue) {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        HttpTransition().transitionadd(
            paymentgatway: "Stripe",
            paymentid: paymentIntentData!['id'].toString(),
            planid: planid);
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("paid successfully")));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: ((context) => MainPage())),
            (route) => false);

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: const Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency, String secrectkey) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer $secrectkey',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  // apple pay

  // Future handlePayPress(BuildContext context,
  //     {required String amount,
  //     required String currency,
  //     required String planid,
  //     required String country}) async {
  //   try {
  //     // 1. Present Apple Pay sheet
  //     await Stripe.instance.presentApplePay(
  //       ApplePayPresentParams(
  //         cartItems: [
  //           ApplePayCartSummaryItem(
  //             label: '$planid',
  //             amount: amount,
  //           ),
  //         ],
  //         country: country,
  //         currency: currency,
  //       ),
  //     );

  //     // 2. fetch Intent Client Secret from backend
  //     final paymentsetting =
  //         Provider.of<PaymentSettingProvider>(context, listen: false);
  //     // Stripe.publishableKey = paymentsetting
  //     //     .paymentSetting!.videoStreamingApp!.first.stripePublishableKey!;
  //     // final response = await fetchPaymentIntentClientSecret();
  //     final clientSecret = paymentsetting
  //         .paymentSetting!.videoStreamingApp!.first.stripeSecretKey;
  //     // print("ashjvajshvajs $clientSecret");

  //     // 2. Confirm apple pay payment

  //     // await getpaymentintent(amount: amount,currency: currency,secretkey: clientSecret);

  //     await Stripe.instance.confirmApplePayPayment(clientSecret!);
  //     HttpTransition().transitionadd(
  //         paymentgatway: "Stripe",
  //         paymentid: paymentIntentData!['id'].toString(),
  //         planid: planid);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //           content: Text('Apple Pay payment succesfully completed')),
  //     );
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: ((context) => MainPage())),
  //         (route) => false);
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error: $e')),
  //     );
  //   }
  // }

  Future getpaymentintent(
      {String? secretkey, String? amount, String? currency}) async {
    var headers = {
      'Authorization': 'Bearer ${secretkey}',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST', Uri.parse('https://api.stripe.com/v1/payment_intents'));
    request.bodyFields = {'amount': amount!, 'currency': currency!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  // Future<void> initPaymentSheet() async {
  //   try {
  //     // 1. create payment intent on the server
  //     final paymentSheetData =
  //         await createPaymentIntent("1200", 'usd', '565165165156');
  //     print("payment intent created");

  //     // create some billingdetails
  //     final billingDetails = BillingDetails(
  //       email: 'email@stripe.com',
  //       phone: '+48888000888',
  //       address: Address(
  //         city: 'Houston',
  //         country: 'US',
  //         line1: '1459  Circle Drive',
  //         line2: '',
  //         state: 'Texas',
  //         postalCode: '77063',
  //       ),
  //     ); // mocked data for tests

  //     // 2. initialize the payment sheet
  //     await Stripe.instance.initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //       applePay: true,
  //       googlePay: true,
  //       style: ThemeMode.dark,
  //       testEnv: true,
  //       merchantCountryCode: 'US',
  //       merchantDisplayName: 'Prospects',
  //       customerId: paymentSheetData!['customer'],
  //       paymentIntentClientSecret: paymentSheetData['paymentIntent'],
  //       customerEphemeralKeySecret: paymentSheetData['ephemeralKey'],
  //     ));
  //     print("payment sheet created");

  //     await Stripe.instance.presentPaymentSheet();

  //     print("after payment sheet presented");
  //   } on Exception catch (e) {
  //     if (e is StripeException) {
  //       print("Error from Stripe: ${e.error.localizedMessage}");
  //     } else {
  //       print("Unforeseen error: ${e}");
  //     }
  //     rethrow;
  //   }
  // }
}
