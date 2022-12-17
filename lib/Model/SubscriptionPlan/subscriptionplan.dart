// To parse this JSON data, do
//
//     final subscriptionPlan = subscriptionPlanFromJson(jsonString);

import 'dart:convert';

SubscriptionPlan subscriptionPlanFromJson(String str) => SubscriptionPlan.fromJson(json.decode(str));

String subscriptionPlanToJson(SubscriptionPlan data) => json.encode(data.toJson());

class SubscriptionPlan {
    SubscriptionPlan({
        this.videoStreamingApp,
        this.statusCode,
    });

    List<VideoStreamingApp>? videoStreamingApp;
    int? statusCode;

    factory SubscriptionPlan.fromJson(Map<String, dynamic> json) => SubscriptionPlan(
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
        this.planId,
        this.planName,
        this.planDuration,
        this.planPrice,
        this.currencyCode,
    });

    int? planId;
    String? planName;
    String? planDuration;
    String? planPrice;
    String? currencyCode;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        planId: json["plan_id"],
        planName: json["plan_name"],
        planDuration: json["plan_duration"],
        planPrice: json["plan_price"],
        currencyCode: json["currency_code"],
    );

    Map<String, dynamic> toJson() => {
        "plan_id": planId,
        "plan_name": planName,
        "plan_duration": planDuration,
        "plan_price": planPrice,
        "currency_code": currencyCode,
    };
}
