// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:provider/provider.dart';

// import '../../Http/Stripe/stripe.dart';
// import 'package:http/http.dart' as http;

// import '../../Http/Transition/transition.dart';
// import '../../Provider/paymentsetting.dart';
// import '../../mainpage.dart';

// class ApplepayPage extends StatefulWidget {
//   final String price;
//   final String name;
//   final String currency;
//   final String planid;
//   final String country;
//   const ApplepayPage(
//       {Key? key,
//       required this.price,
//       required this.name,
//       required this.currency,
//       required this.planid,
//       required this.country})
//       : super(key: key);

//   @override
//   State<ApplepayPage> createState() => _ApplepayPageState();
// }

// class _ApplepayPageState extends State<ApplepayPage> {
//   @override
//   Widget build(BuildContext context) {
//     final paymentsetting = Provider.of<PaymentSettingProvider>(context);
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ApplePayButton(
//             //   style: ApplePayButtonStyle.white,
//             //   onPressed: handlePayPress,
//             //   // onPressed: _handlePayPress(),
//             // )
//             // InkWell(
//             //   onTap: () async {
//             //     final clientSecret = paymentsetting
//             //         .paymentSetting!.videoStreamingApp!.first.stripeSecretKey;
//             //     // print("ashjvajshvajs $clientSecret");

//             //     // 2. Confirm apple pay payment

//             //     await getpaymentintent(
//             //         amount: widget.price,
//             //         currency: widget.currency,
//             //         secretkey: clientSecret);
//             //   },
//             //   child: Container(
//             //     color: Colors.white,
//             //     padding: EdgeInsets.all(10),
//             //     child: Text("Apple Pay"),
//             //   ),
//             // )
//           ],
//         ),
//       ),
//     );
//   }

//   // Future<void> handlePayPress() async {
//   //   try {
//   //     // 1. Present Apple Pay sheet
//   //     await Stripe.instance.presentApplePay(
//   //       ApplePayPresentParams(
//   //         cartItems: [
//   //           ApplePayCartSummaryItem(
//   //             label: widget.planid,
//   //             amount: widget.price,
//   //           ),
//   //         ],
//   //         country: widget.country,
//   //         currency: widget.currency,
//   //       ),
//   //     );

//   //     // 2. fetch Intent Client Secret from backend
//   //     final paymentsetting =
//   //         Provider.of<PaymentSettingProvider>(context, listen: false);
//   //     // Stripe.publishableKey = paymentsetting
//   //     //     .paymentSetting!.videoStreamingApp!.first.stripePublishableKey!;
//   //     // final response = await fetchPaymentIntentClientSecret();
//   //     final clientSecret = paymentsetting
//   //         .paymentSetting!.videoStreamingApp!.first.stripeSecretKey;
//   //     // print("ashjvajshvajs $clientSecret");

//   //     // 2. Confirm apple pay payment

//   //     http.Response? intenet = await getpaymentintent(
//   //         amount: widget.price,
//   //         currency: widget.currency,
//   //         secretkey: clientSecret);
//   //     var data = jsonDecode(intenet!.body);

//   //     await Stripe.instance.confirmApplePayPayment(data['client_secret']);
//   //     HttpTransition().transitionadd(
//   //         paymentgatway: "Stripe",
//   //         paymentid: data['id'],
//   //         planid: widget.planid);
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(
//   //           content: Text('Apple Pay payment succesfully completed')),
//   //     );
//   //     Navigator.pushAndRemoveUntil(
//   //         context,
//   //         MaterialPageRoute(builder: ((context) => MainPage())),
//   //         (route) => false);
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Error: $e')),
//   //     );
//   //   }
//   // }

//   Future<http.Response?> getpaymentintent(
//       {String? secretkey, String? amount, String? currency}) async {
//     var headers = {
//       'Authorization': 'Bearer ${secretkey}',
//       'Content-Type': 'application/x-www-form-urlencoded'
//     };
//     var request = http.Request(
//         'POST', Uri.parse('https://api.stripe.com/v1/payment_intents'));
//     request.bodyFields = {
//       'amount': double.parse(amount!).toInt().toString(),
//       'currency': currency!
//     };
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();
//     var responsedata = await http.Response.fromStream(response);

//     if (response.statusCode == 200) {
//       return responsedata;
//     } else {
//       print(responsedata.body);
//     }
//   }
// }
