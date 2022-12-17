// To parse this JSON data, do
//
//     final userpofile = userpofileFromJson(jsonString);

import 'dart:convert';

Userpofile userpofileFromJson(String str) => Userpofile.fromJson(json.decode(str));

String userpofileToJson(Userpofile data) => json.encode(data.toJson());

class Userpofile {
    Userpofile({
        this.videoStreamingApp,
        this.statusCode,
    });

    List<VideoStreamingApp>? videoStreamingApp;
    int? statusCode;

    factory Userpofile.fromJson(Map<String, dynamic> json) => Userpofile(
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
        this.userId,
        this.name,
        this.email,
        this.phone,
        this.userAddress,
        this.userImage,
        this.msg,
        this.success,
    });

    dynamic userId;
    String? name;
    String? email;
    String? phone;
    String ?userAddress;
    String? userImage;
    String? msg;
    String? success;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        userAddress: json["user_address"],
        userImage: json["user_image"],
        msg: json["msg"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "phone": phone,
        "user_address": userAddress,
        "user_image": userImage,
        "msg": msg,
        "success": success,
    };
}
