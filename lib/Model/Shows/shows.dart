// To parse this JSON data, do
//
//     final shows = showsFromJson(jsonString);

import 'dart:convert';

Shows showsFromJson(String str) => Shows.fromJson(json.decode(str));

String showsToJson(Shows data) => json.encode(data.toJson());

class Shows {
    Shows({
        this.videoStreamingApp,
        this.totalRecords,
        this.statusCode,
    });

    List<VideoStreamingApp>? videoStreamingApp;
    int? totalRecords;
    int? statusCode;

    factory Shows.fromJson(Map<String, dynamic> json) => Shows(
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
        this.showId,
        this.showTitle,
        this.showPoster,
    });

    int? showId;
    String? showTitle;
    String? showPoster;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        showId: json["show_id"],
        showTitle: json["show_title"],
        showPoster: json["show_poster"],
    );

    Map<String, dynamic> toJson() => {
        "show_id": showId,
        "show_title": showTitle,
        "show_poster": showPoster,
    };
}
