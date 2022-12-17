// To parse this JSON data, do
//
//     final movieDetails = movieDetailsFromJson(jsonString);

import 'dart:convert';

MovieDetails movieDetailsFromJson(String str) => MovieDetails.fromJson(json.decode(str));

String movieDetailsToJson(MovieDetails data) => json.encode(data.toJson());

class MovieDetails {
    MovieDetails({
        this.videoStreamingApp,
        this.userPlanStatus,
        this.statusCode,
    });

    VideoStreamingApp? videoStreamingApp;
    bool? userPlanStatus;
    int? statusCode;

    factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        videoStreamingApp: VideoStreamingApp.fromJson(json["VIDEO_STREAMING_APP"]),
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
        this.movieId,
        this.movieTitle,
        this.movieImage,
        this.movieAccess,
        this.description,
        this.movieDuration,
        this.releaseDate,
        this.imdbRating,
        this.videoType,
        this.videoUrl,
        this.videoUrl480,
        this.videoUrl720,
        this.videoUrl1080,
        this.downloadEnable,
        this.downloadUrl,
        this.langId,
        this.languageName,
        this.genreList,
        this.subtitleLanguage1,
        this.subtitleUrl1,
        this.subtitleLanguage2,
        this.subtitleUrl2,
        this.subtitleLanguage3,
        this.subtitleUrl3,
        this.videoQuality,
        this.subtitleOnOff,
          this.shareUrl,
        this.relatedMovies,
    });

    int? movieId;
    String? movieTitle;
    String? movieImage;
    String? movieAccess;
    String? description;
    String? movieDuration;
    String ?releaseDate;
    String? imdbRating;
    String? videoType;
    String? videoUrl;
    String? videoUrl480;
    String? videoUrl720;
    String? videoUrl1080;
    String? downloadEnable;
    String? downloadUrl;
    int? langId;
    String? languageName;
    List<GenreList>? genreList;
    String? subtitleLanguage1;
    String? subtitleUrl1;
    String? subtitleLanguage2;
    String? subtitleUrl2;
    String? subtitleLanguage3;
    String? subtitleUrl3;
    String? videoQuality;
    String? subtitleOnOff;
    String? shareUrl;
    List<RelatedMovie>? relatedMovies;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        movieId: json["movie_id"],
        movieTitle: json["movie_title"],
        movieImage: json["movie_image"],
        movieAccess: json["movie_access"],
        description: json["description"],
        movieDuration: json["movie_duration"],
        releaseDate: json["release_date"],
        imdbRating: json["imdb_rating"],
        videoType: json["video_type"],
        videoUrl: json["video_url"],
        videoUrl480: json["video_url_480"],
        videoUrl720: json["video_url_720"],
        videoUrl1080: json["video_url_1080"],
        downloadEnable: json["download_enable"],
        downloadUrl: json["download_url"],
        langId: json["lang_id"],
        languageName: json["language_name"],
        genreList: List<GenreList>.from(json["genre_list"].map((x) => GenreList.fromJson(x))),
        subtitleLanguage1: json["subtitle_language1"],
        subtitleUrl1: json["subtitle_url1"],
        subtitleLanguage2: json["subtitle_language2"],
        subtitleUrl2: json["subtitle_url2"],
        subtitleLanguage3: json["subtitle_language3"],
        subtitleUrl3: json["subtitle_url3"],
        videoQuality: json["video_quality"],
        subtitleOnOff: json["subtitle_on_off"],
         shareUrl: json["share_url"],
        relatedMovies: List<RelatedMovie>.from(json["related_movies"].map((x) => RelatedMovie.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "movie_id": movieId,
        "movie_title": movieTitle,
        "movie_image": movieImage,
        "movie_access": movieAccess,
        "description": description,
        "movie_duration": movieDuration,
        "release_date": releaseDate,
        "imdb_rating": imdbRating,
        "video_type": videoType,
        "video_url": videoUrl,
        "video_url_480": videoUrl480,
        "video_url_720": videoUrl720,
        "video_url_1080": videoUrl1080,
        "download_enable": downloadEnable,
        "download_url": downloadUrl,
        "lang_id": langId,
        "language_name": languageName,
        "genre_list": List<dynamic>.from(genreList!.map((x) => x.toJson())),
        "subtitle_language1": subtitleLanguage1,
        "subtitle_url1": subtitleUrl1,
        "subtitle_language2": subtitleLanguage2,
        "subtitle_url2": subtitleUrl2,
        "subtitle_language3": subtitleLanguage3,
        "subtitle_url3": subtitleUrl3,
        "video_quality": videoQuality,
        "subtitle_on_off": subtitleOnOff,
          "share_url": shareUrl,
        "related_movies": List<dynamic>.from(relatedMovies!.map((x) => x.toJson())),
    };
}

class GenreList {
    GenreList({
        this.genreId,
        this.genreName,
    });

    String? genreId;
    String? genreName;

    factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
        genreId: json["genre_id"],
        genreName: json["genre_name"],
    );

    Map<String, dynamic> toJson() => {
        "genre_id": genreId,
        "genre_name": genreName,
    };
}

class RelatedMovie {
    RelatedMovie({
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

    factory RelatedMovie.fromJson(Map<String, dynamic> json) => RelatedMovie(
        movieId: json["movie_id"],
        movieTitle: json["movie_title"],
        moviePoster: json["movie_poster"],
        movieDuration: json["movie_duration"] == null ? null : json["movie_duration"],
        movieAccess: json["movie_access"],
    );

    Map<String, dynamic> toJson() => {
        "movie_id": movieId,
        "movie_title": movieTitle,
        "movie_poster": moviePoster,
        "movie_duration": movieDuration == null ? null : movieDuration,
        "movie_access": movieAccess,
    };
}
