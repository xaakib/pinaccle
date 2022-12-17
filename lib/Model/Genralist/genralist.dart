// To parse this JSON data, do
//
//     final genrelist = genrelistFromJson(jsonString);

import 'dart:convert';

Genrelist genrelistFromJson(String str) => Genrelist.fromJson(json.decode(str));

String genrelistToJson(Genrelist data) => json.encode(data.toJson());

class Genrelist {
    Genrelist({
        this.videoStreamingApp,
        this.statusCode,
    });

    List<VideoStreamingApp>? videoStreamingApp;
    int? statusCode;

    factory Genrelist.fromJson(Map<String, dynamic> json) => Genrelist(
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
        this.genreId,
        this.genreName,
        this.genreImage,
    });

    int? genreId;
    String? genreName;
    String? genreImage;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        genreId: json["genre_id"],
        genreName: json["genre_name"],
        genreImage: json["genre_image"],
    );

    Map<String, dynamic> toJson() => {
        "genre_id": genreId,
        "genre_name": genreName,
        "genre_image": genreImage,
    };
}
