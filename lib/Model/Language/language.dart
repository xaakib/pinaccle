// To parse this JSON data, do
//
//     final language = languageFromJson(jsonString);

import 'dart:convert';

Language languageFromJson(String str) => Language.fromJson(json.decode(str));

String languageToJson(Language data) => json.encode(data.toJson());

class Language {
    Language({
        this.videoStreamingApp,
        this.statusCode,
    });

    List<VideoStreamingApp>? videoStreamingApp;
    int? statusCode;

    factory Language.fromJson(Map<String, dynamic> json) => Language(
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
        this.languageId,
        this.languageName,
        this.languageImage,
    });

    int? languageId;
    String? languageName;
    String? languageImage;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        languageId: json["language_id"],
        languageName: json["language_name"],
        languageImage: json["language_image"],
    );

    Map<String, dynamic> toJson() => {
        "language_id": languageId,
        "language_name": languageName,
        "language_image": languageImage,
    };
}
