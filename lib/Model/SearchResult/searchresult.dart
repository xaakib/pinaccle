// To parse this JSON data, do
//
//     final searchResult = searchResultFromJson(jsonString);

import 'dart:convert';

SearchResult searchResultFromJson(String str) => SearchResult.fromJson(json.decode(str));

String searchResultToJson(SearchResult data) => json.encode(data.toJson());

class SearchResult {
    SearchResult({
        this.videoStreamingApp,
        this.statusCode,
    });

    VideoStreamingApp? videoStreamingApp;
    int? statusCode;

    factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
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
        this.movies,
        this.shows,
        this.sports,
        this.liveTv,
    });

    List<Movie>? movies;
    List<Show>? shows;
    List<dynamic>? sports;
    List<LiveTv>? liveTv;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
        shows: List<Show>.from(json["shows"].map((x) => Show.fromJson(x))),
        sports: List<dynamic>.from(json["sports"].map((x) => x)),
        liveTv: List<LiveTv>.from(json["live_tv"].map((x) => LiveTv.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "movies": List<dynamic>.from(movies!.map((x) => x.toJson())),
        "shows": List<dynamic>.from(shows!.map((x) => x.toJson())),
        "sports": List<dynamic>.from(sports!.map((x) => x)),
        "live_tv": List<dynamic>.from(liveTv!.map((x) => x.toJson())),
    };
}

class LiveTv {
    LiveTv({
        this.tvId,
        this.tvTitle,
        this.tvLogo,
        this.tvAccess,
    });

    int? tvId;
    String? tvTitle;
    String? tvLogo;
    String? tvAccess;

    factory LiveTv.fromJson(Map<String, dynamic> json) => LiveTv(
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

class Movie {
    Movie({
        this.movieId,
        this.movieTitle,
        this.moviePoster,
        this.movieDuration,
        this.movieAccess,
    });

    int? movieId;
    String? movieTitle;
    String? moviePoster;
    String? movieDuration;
    String? movieAccess;

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        movieId: json["movie_id"],
        movieTitle: json["movie_title"],
        moviePoster: json["movie_poster"],
        movieDuration: json["movie_duration"],
        movieAccess: json["movie_access"],
    );

    Map<String, dynamic> toJson() => {
        "movie_id": movieId,
        "movie_title": movieTitle,
        "movie_poster": moviePoster,
        "movie_duration": movieDuration,
        "movie_access": movieAccess,
    };
}

class Show {
    Show({
        this.showId,
        this.showTitle,
        this.showPoster,
    });

    int? showId;
    String? showTitle;
    String? showPoster;

    factory Show.fromJson(Map<String, dynamic> json) => Show(
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
