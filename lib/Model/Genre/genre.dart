// To parse this JSON data, do
//
//     final genre = genreFromJson(jsonString);

import 'dart:convert';

Genre genreFromJson(String str) => Genre.fromJson(json.decode(str));

String genreToJson(Genre data) => json.encode(data.toJson());

class Genre {
    Genre({
        this.videoStreamingApp,
        this.statusCode,
    });

    List<VideoStreamingApp>? videoStreamingApp;
    int? statusCode;

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
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
