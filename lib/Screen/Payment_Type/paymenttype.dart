import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:hoichoi_clone_app/Http/Stripe/stripe.dart';
import 'package:hoichoi_clone_app/Http/Transition/transition.dart';
import 'package:hoichoi_clone_app/Screen/Paypal/paypal_payment.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:hoichoi_clone_app/mainpage.dart';

import '../ApplePay/applepay.dart';

class PaymenttypePage extends StatefulWidget {
  final String price;
  final String name;
  final String currency;
  final String planid;
  final String country;
  const PaymenttypePage(
      {Key? key,
      required this.price,
      required this.name,
      required this.currency,
      required this.planid,
      required this.country})
      : super(key: key);

  @override
  State<PaymenttypePage> createState() => _PaymenttypePageState();
}

class _PaymenttypePageState extends State<PaymenttypePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Payment Type"),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => PaypalPayment(
                    currency: widget.currency,
                    name: widget.name,
                    price: widget.price,
                    planid: widget.planid,
                    onFinish: (number) async {
                      // payment done
                      print('order id: ' + number);
                    },
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [color, color],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Row(
                children: [
                  Icon(
                    Icons.paypal,
                    size: 50,
                    color: Colors.white,
                  ),
                  Text("Paypal")
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (Platform.isAndroid) {
                HttpStripe().strypeinit(context).then((value) {
                  HttpStripe()
                      .makePayment(
                          planid: widget.planid,
                          amount: double.parse(widget.price).toInt().toString(),
                          context: context,
                          currency: widget.currency)
                      .then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: ((context) => MainPage())),
                        (route) => false);
                  });
                });
              } 
              // else {
              //   HttpStripe().strypeinit(context).then((value) async {
              //     // HttpStripe().paymentsheet();
              //     // HttpStripe().handlePayPress(context,
              //     //     amount: widget.price,
              //     //     currency: widget.currency,
              //     //     planid: widget.planid,
              //     //     country: "");
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: ((context) => ApplepayPage(
              //                 country: widget.country,
              //                 currency: widget.currency,
              //                 name: widget.name,
              //                 planid: widget.planid,
              //                 price: widget.price))));
              //   });
              // }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [color, color],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Row(
                children: [
                  Image.asset(
                    "images/Payment-Gateway_Stripe-removebg-preview.png",
                    height: 50,
                  ),
                  Text("Stripe")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
