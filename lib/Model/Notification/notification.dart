// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

NotificationAll notificationFromJson(String str) =>
    NotificationAll.fromJson(json.decode(str));

String notificationToJson(NotificationAll data) => json.encode(data.toJson());

class NotificationAll {
  NotificationAll({
    this.imageVideoUrl,
    this.allNotificaiton,
    this.statusCode,
  });

  String? imageVideoUrl;
  List<AllNotificaiton>? allNotificaiton;
  String? statusCode;

  factory NotificationAll.fromJson(Map<String, dynamic> json) =>
      NotificationAll(
        imageVideoUrl: json["image_video_url"],
        allNotificaiton: List<AllNotificaiton>.from(
            json["all_notificaiton"].map((x) => AllNotificaiton.fromJson(x))),
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "image_video_url": imageVideoUrl,
        "all_notificaiton":
            List<dynamic>.from(allNotificaiton!.map((x) => x.toJson())),
        "status_code": statusCode,
      };
}

class AllNotificaiton {
  AllNotificaiton({
    this.id,
    this.videoAccess,
    this.movieLangId,
    this.movieGenreId,
    this.playlistId,
    this.videoTitle,
    this.releaseDate,
    this.duration,
    this.videoDescription,
    this.videoSlug,
    this.videoImageThumb,
    this.videoImage,
    this.videoType,
    this.videoUrl,
    this.views,
    this.downloadEnable,
    this.downloadUrl,
    this.imdbId,
    this.imdbRating,
    this.imdbVotes,
    this.seoTitle,
    this.seoDescription,
    this.seoKeyword,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.mainApp,
  });

  int? id;
  String? videoAccess;
  int? movieLangId;
  String? movieGenreId;
  int? playlistId;
  String? videoTitle;
  int? releaseDate;
  String? duration;
  String? videoDescription;
  String? videoSlug;
  String? videoImageThumb;
  String? videoImage;
  String? videoType;
  String? videoUrl;
  int? views;
  dynamic downloadEnable;
  dynamic downloadUrl;
  dynamic imdbId;
  dynamic imdbRating;
  dynamic imdbVotes;
  String? seoTitle;
  String? seoDescription;
  String? seoKeyword;
  int? status;
  dynamic createdAt;
  DateTime? updatedAt;
  int? mainApp;

  factory AllNotificaiton.fromJson(Map<String, dynamic> json) =>
      AllNotificaiton(
        id: json["id"],
        videoAccess: json["video_access"],
        movieLangId: json["movie_lang_id"],
        movieGenreId: json["movie_genre_id"],
        playlistId: json["playlist_id"],
        videoTitle: json["video_title"],
        releaseDate: json["release_date"],
        duration: json["duration"],
        videoDescription: json["video_description"],
        videoSlug: json["video_slug"],
        videoImageThumb: json["video_image_thumb"],
        videoImage: json["video_image"],
        videoType: json["video_type"],
        videoUrl: json["video_url"],
        views: json["views"],
        downloadEnable: json["download_enable"],
        downloadUrl: json["download_url"],
        imdbId: json["imdb_id"],
        imdbRating: json["imdb_rating"],
        imdbVotes: json["imdb_votes"],
        seoTitle: json["seo_title"],
        seoDescription: json["seo_description"],
        seoKeyword: json["seo_keyword"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        mainApp: json["main_app"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "video_access": videoAccess,
        "movie_lang_id": movieLangId,
        "movie_genre_id": movieGenreId,
        "playlist_id": playlistId,
        "video_title": videoTitle,
        "release_date": releaseDate,
        "duration": duration,
        "video_description": videoDescription,
        "video_slug": videoSlug,
        "video_image_thumb": videoImageThumb,
        "video_image": videoImage,
        "video_type": videoType,
        "video_url": videoUrl,
        "views": views,
        "download_enable": downloadEnable,
        "download_url": downloadUrl,
        "imdb_id": imdbId,
        "imdb_rating": imdbRating,
        "imdb_votes": imdbVotes,
        "seo_title": seoTitle,
        "seo_description": seoDescription,
        "seo_keyword": seoKeyword,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "main_app": mainApp,
      };
}
