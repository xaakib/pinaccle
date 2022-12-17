// To parse this JSON data, do
//
//     final tvdetails = tvdetailsFromJson(jsonString);

import 'dart:convert';

Tvdetails tvdetailsFromJson(String str) => Tvdetails.fromJson(json.decode(str));

String tvdetailsToJson(Tvdetails data) => json.encode(data.toJson());

class Tvdetails {
  Tvdetails({
    this.videoStreamingApp,
    this.userPlanStatus,
    this.statusCode,
  });

  VideoStreamingApp? videoStreamingApp;
  bool? userPlanStatus;
  int? statusCode;

  factory Tvdetails.fromJson(Map<String, dynamic> json) => Tvdetails(
        videoStreamingApp:
            VideoStreamingApp.fromJson(json["VIDEO_STREAMING_APP"]),
        userPlanStatus: json["user_plan_status"],
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": videoStreamingApp!.toJson(),
        "user_plan_status": userPlanStatus,
        "status_code": statusCode,
      };
}

class VideoStreamingApp {
  VideoStreamingApp({
    this.tvId,
    this.tvTitle,
    this.tvLogo,
    this.tvAccess,
    this.description,
    this.tvUrlType,
    this.tvUrl,
    this.tvUrl2,
    this.tvUrl3,
    this.tvCatId,
    this.categoryName,
    this.relatedLiveTv,
  });

  int? tvId;
  String? tvTitle;
  String? tvLogo;
  String? tvAccess;
  String? description;
  String? tvUrlType;
  String? tvUrl;
  String? tvUrl2;
  String? tvUrl3;
  int? tvCatId;
  String? categoryName;
  List<dynamic>? relatedLiveTv;

  factory VideoStreamingApp.fromJson(Map<String, dynamic> json) =>
      VideoStreamingApp(
        tvId: json["tv_id"],
        tvTitle: json["tv_title"],
        tvLogo: json["tv_logo"],
        tvAccess: json["tv_access"],
        description: json["description"],
        tvUrlType: json["tv_url_type"],
        tvUrl: json["tv_url"],
        tvUrl2: json["tv_url2"],
        tvUrl3: json["tv_url3"],
        tvCatId: json["tv_cat_id"],
        categoryName: json["category_name"],
        relatedLiveTv:
            List<dynamic>.from(json["related_live_tv"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "tv_id": tvId,
        "tv_title": tvTitle,
        "tv_logo": tvLogo,
        "tv_access": tvAccess,
        "description": description,
        "tv_url_type": tvUrlType,
        "tv_url": tvUrl,
        "tv_url2": tvUrl2,
        "tv_url3": tvUrl3,
        "tv_cat_id": tvCatId,
        "category_name": categoryName,
        "related_live_tv": List<dynamic>.from(relatedLiveTv!.map((x) => x)),
      };
}
