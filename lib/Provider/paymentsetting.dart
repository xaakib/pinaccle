import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/PAymentSetting/paymentsetting.dart';
import 'package:hoichoi_clone_app/Model/PAymentSetting/paymentsetting.dart';

class PaymentSettingProvider extends ChangeNotifier {
  PaymentSetting? paymentSetting;

  Future getpaymentsetting() async {
    paymentSetting = await HttpPaymentSetting().getpaymentsetting();
    notifyListeners();
  }
}
