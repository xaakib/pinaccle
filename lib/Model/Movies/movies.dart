// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

import 'dart:convert';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

String moviesToJson(Movies data) => json.encode(data.toJson());

class Movies {
    Movies({
        this.videoStreamingApp,
        this.totalRecords,
        this.statusCode,
    });

    List<VideoStreamingApp> ?videoStreamingApp;
    int ?totalRecords;
    int? statusCode;

    factory Movies.fromJson(Map<String, dynamic> json) => Movies(
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
        this.movieId,
        this.movieTitle,
        this.moviePoster,
        this.movieDuration,
        this.movieAccess,
    });

    int? movieId;
    String ?movieTitle;
    String? moviePoster;
    String? movieDuration;
    MovieAccess? movieAccess;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        movieId: json["movie_id"],
        movieTitle: json["movie_title"],
        moviePoster: json["movie_poster"],
        movieDuration: json["movie_duration"] == null ? null : json["movie_duration"],
        movieAccess: movieAccessValues.map![json["movie_access"]],
    );

    Map<String, dynamic> toJson() => {
        "movie_id": movieId,
        "movie_title": movieTitle,
        "movie_poster": moviePoster,
        "movie_duration": movieDuration == null ? null : movieDuration,
        "movie_access": movieAccessValues.reverse[movieAccess],
    };
}

enum MovieAccess { PAID, FREE }

final movieAccessValues = EnumValues({
    "Free": MovieAccess.FREE,
    "Paid": MovieAccess.PAID
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map!.map((k, v) => MapEntry(v, k));
        return reverseMap!;
    }
}
