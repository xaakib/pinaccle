// To parse this JSON data, do
//
//     final tv = tvFromJson(jsonString);

import 'dart:convert';

Tv tvFromJson(String str) => Tv.fromJson(json.decode(str));

String tvToJson(Tv data) => json.encode(data.toJson());

class Tv {
    Tv({
        this.videoStreamingApp,
        this.totalRecords,
        this.statusCode,
    });

    List<VideoStreamingApp>? videoStreamingApp;
    int? totalRecords;
    int? statusCode;

    factory Tv.fromJson(Map<String, dynamic> json) => Tv(
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
        totalRecords: json["total_records"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp!.map((x) => x.toJson())),
        "total_records": totalRecords,
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    VideoStreamingApp({
        this.tvId,
        this.tvTitle,
        this.tvLogo,
        this.tvAccess,
    });

    int? tvId;
    String? tvTitle;
    String? tvLogo;
    String? tvAccess;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        tvId: json["tv_id"],
        tvTitle: json["tv_title"],
        tvLogo: json["tv_logo"],
        tvAccess: json["tv_access"],
    );

    Map<String, dynamic> toJson() => {
        "tv_id": tvId,
        "tv_title": tvTitle,
        "tv_logo": tvLogo,
        "tv_access": tvAccess,
    };
}
