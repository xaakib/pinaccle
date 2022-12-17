// To parse this JSON data, do
//
//     final paymentSetting = paymentSettingFromJson(jsonString);

import 'dart:convert';

PaymentSetting paymentSettingFromJson(String str) => PaymentSetting.fromJson(json.decode(str));

String paymentSettingToJson(PaymentSetting data) => json.encode(data.toJson());

class PaymentSetting {
    PaymentSetting({
        this.videoStreamingApp,
        this.statusCode,
    });

    List<VideoStreamingApp>? videoStreamingApp;
    int? statusCode;

    factory PaymentSetting.fromJson(Map<String, dynamic> json) => PaymentSetting(
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp!.map((x) => x.toJson())),
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    VideoStreamingApp({
        this.currencyCode,
        this.paypalPaymentOnOff,
        this.paypalMode,
        this.paypalClientId,
        this.paypalSecret,
        this.stripePaymentOnOff,
        this.stripeSecretKey,
        this.stripePublishableKey,
        this.razorpayPaymentOnOff,
        this.razorpayKey,
        this.razorpaySecret,
        this.paystackPaymentOnOff,
        this.paystackSecretKey,
        this.paystackPublicKey,
        this.success,
    });

    String? currencyCode;
    String? paypalPaymentOnOff;
    String? paypalMode;
    String? paypalClientId;
    String? paypalSecret;
    String? stripePaymentOnOff;
    String? stripeSecretKey;
    String? stripePublishableKey;
    String? razorpayPaymentOnOff;
    dynamic razorpayKey;
    dynamic razorpaySecret;
    String? paystackPaymentOnOff;
    dynamic paystackSecretKey;
    dynamic paystackPublicKey;
    String? success;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        currencyCode: json["currency_code"],
        paypalPaymentOnOff: json["paypal_payment_on_off"],
        paypalMode: json["paypal_mode"],
        paypalClientId: json["paypal_client_id"],
        paypalSecret: json["paypal_secret"],
        stripePaymentOnOff: json["stripe_payment_on_off"],
        stripeSecretKey: json["stripe_secret_key"],
        stripePublishableKey: json["stripe_publishable_key"],
        razorpayPaymentOnOff: json["razorpay_payment_on_off"],
        razorpayKey: json["razorpay_key"],
        razorpaySecret: json["razorpay_secret"],
        paystackPaymentOnOff: json["paystack_payment_on_off"],
        paystackSecretKey: json["paystack_secret_key"],
        paystackPublicKey: json["paystack_public_key"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "currency_code": currencyCode,
        "paypal_payment_on_off": paypalPaymentOnOff,
        "paypal_mode": paypalMode,
        "paypal_client_id": paypalClientId,
        "paypal_secret": paypalSecret,
        "stripe_payment_on_off": stripePaymentOnOff,
        "stripe_secret_key": stripeSecretKey,
        "stripe_publishable_key": stripePublishableKey,
        "razorpay_payment_on_off": razorpayPaymentOnOff,
        "razorpay_key": razorpayKey,
        "razorpay_secret": razorpaySecret,
        "paystack_payment_on_off": paystackPaymentOnOff,
        "paystack_secret_key": paystackSecretKey,
        "paystack_public_key": paystackPublicKey,
        "success": success,
    };
}
