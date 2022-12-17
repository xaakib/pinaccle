// To parse this JSON data, do
//
//     final logindata = logindataFromJson(jsonString);

import 'dart:convert';

Logindata logindataFromJson(String str) => Logindata.fromJson(json.decode(str));

String logindataToJson(Logindata data) => json.encode(data.toJson());

class Logindata {
    Logindata({
        this.videoStreamingApp,
        this.statusCode,
    });

    List<VideoStreamingApp>? videoStreamingApp;
    int? statusCode;

    factory Logindata.fromJson(Map<String, dynamic> json) => Logindata(
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
        this.msg,
        this.success,
    });

    UserId?userId;
    String? msg;
    String? success;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        userId: UserId.fromJson(json["user_id"]),
        msg: json["msg"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId!.toJson(),
        "msg": msg,
        "success": success,
    };
}

class UserId {
    UserId({
        this.id,
        this.usertype,
        this.loginStatus,
        this.name,
        this.email,
        this.phone,
        this.userAddress,
        this.country,
        this.userImage,
        this.status,
        this.planId,
        this.startDate,
        this.expDate,
        this.paypalPaymentId,
        this.stripePaymentId,
        this.razorpayPaymentId,
        this.planAmount,
        this.confirmationCode,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? usertype;
    int? loginStatus;
    String? name;
    String? email;
    String? phone;
    dynamic userAddress;
    dynamic country;
    dynamic userImage;
    int? status;
    int?planId;
    int? startDate;
    int? expDate;
    String? paypalPaymentId;
    dynamic stripePaymentId;
    dynamic razorpayPaymentId;
    String? planAmount;
    dynamic confirmationCode;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["id"],
        usertype: json["usertype"],
        loginStatus: json["login_status"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        userAddress: json["user_address"],
        country: json["country"],
        userImage: json["user_image"],
        status: json["status"],
        planId: json["plan_id"],
        startDate: json["start_date"],
        expDate: json["exp_date"],
        paypalPaymentId: json["paypal_payment_id"],
        stripePaymentId: json["stripe_payment_id"],
        razorpayPaymentId: json["razorpay_payment_id"],
        planAmount: json["plan_amount"],
        confirmationCode: json["confirmation_code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "usertype": usertype,
        "login_status": loginStatus,
        "name": name,
        "email": email,
        "phone": phone,
        "user_address": userAddress,
        "country": country,
        "user_image": userImage,
        "status": status,
        "plan_id": planId,
        "start_date": startDate,
        "exp_date": expDate,
        "paypal_payment_id": paypalPaymentId,
        "stripe_payment_id": stripePaymentId,
        "razorpay_payment_id": razorpayPaymentId,
        "plan_amount": planAmount,
        "confirmation_code": confirmationCode,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
