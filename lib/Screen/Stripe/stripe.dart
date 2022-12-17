import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripePage extends StatefulWidget {
  const StripePage({Key? key}) : super(key: key);

  @override
  State<StripePage> createState() => _StripePageState();
}

class _StripePageState extends State<StripePage> {
  Future strypeinit() async {
    Stripe.publishableKey =
        'pk_test_51In8i6A7bMbxU8PnKprPizRBUJVws189QPiwFlemum4cf8UYP6EQPeuEJ75dv1hNwfDPWa2LTY6aIIYihjMXt63B003ComebLo';
    await Stripe.instance.applySettings();
  }

  Map<String, dynamic>? paymentIntentData;

  @override
  void initState() {
    strypeinit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stripe Payment"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
              
                print("sjdbsd");
              },
              child: Text("Strype Payment"))
        ],
      ),
    );
  }


}
