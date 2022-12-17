// To parse this JSON data, do
//
//     final userplan = userplanFromJson(jsonString);

import 'dart:convert';

Userplan userplanFromJson(String str) => Userplan.fromJson(json.decode(str));

String userplanToJson(Userplan data) => json.encode(data.toJson());

class Userplan {
    Userplan({
        this.videoStreamingApp,
        this.statusCode,
    });

    VideoStreamingApp? videoStreamingApp;
    int? statusCode;

    factory Userplan.fromJson(Map<String, dynamic> json) => Userplan(
        videoStreamingApp: VideoStreamingApp.fromJson(json["VIDEO_STREAMING_APP"]),
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": videoStreamingApp!.toJson(),
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    VideoStreamingApp({
        this.currentPlan,
        this.expiredOn,
        this.msg,
        this.success,
    });

    dynamic currentPlan;
    int? expiredOn;
    String? msg;
    String? success;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        currentPlan: json["current_plan"],
        expiredOn: json["expired_on"],
        msg: json["msg"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "current_plan": currentPlan,
        "expired_on": expiredOn,
        "msg": msg,
        "success": success,
    };
}
