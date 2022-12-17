// To parse this JSON data, do
//
//     final showDetails = showDetailsFromJson(jsonString);

import 'dart:convert';

ShowDetails showDetailsFromJson(String str) =>
    ShowDetails.fromJson(json.decode(str));

String showDetailsToJson(ShowDetails data) => json.encode(data.toJson());

class ShowDetails {
  ShowDetails({
    this.videoStreamingApp,
    this.statusCode,
  });

  VideoStreamingApp? videoStreamingApp;
  int? statusCode;

  factory ShowDetails.fromJson(Map<String, dynamic> json) => ShowDetails(
        videoStreamingApp:
            VideoStreamingApp.fromJson(json["VIDEO_STREAMING_APP"]),
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": videoStreamingApp!.toJson(),
        "status_code": statusCode,
      };
}

class VideoStreamingApp {
  VideoStreamingApp({
    this.showId,
    this.showName,
    this.showInfo,
    this.imdbRating,
    this.showPoster,
    this.showLang,
    this.genreList,
    this.shareUrl,
    this.seasonList,
    this.relatedShows,
  });

  int? showId;
  String? showName;
  String? showInfo;
  String? imdbRating;
  String? showPoster;
  String? showLang;
  String? shareUrl;
  List<GenreList>? genreList;
  List<SeasonList>? seasonList;
  List<RelatedShow>? relatedShows;

  factory VideoStreamingApp.fromJson(Map<String, dynamic> json) =>
      VideoStreamingApp(
        showId: json["show_id"],
        showName: json["show_name"],
        showInfo: json["show_info"],
        imdbRating: json["imdb_rating"],
        showPoster: json["show_poster"],
        showLang: json["show_lang"],
        shareUrl: json["share_url"],
        genreList: List<GenreList>.from(
            json["genre_list"].map((x) => GenreList.fromJson(x))),
        seasonList: List<SeasonList>.from(
            json["season_list"].map((x) => SeasonList.fromJson(x))),
        relatedShows: List<RelatedShow>.from(
            json["related_shows"].map((x) => RelatedShow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "show_id": showId,
        "show_name": showName,
        "show_info": showInfo,
        "imdb_rating": imdbRating,
        "show_poster": showPoster,
        "show_lang": showLang,
        "share_url": shareUrl,
        "genre_list": List<dynamic>.from(genreList!.map((x) => x.toJson())),
        "season_list": List<dynamic>.from(seasonList!.map((x) => x.toJson())),
        "related_shows":
            List<dynamic>.from(relatedShows!.map((x) => x.toJson())),
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

class RelatedShow {
  RelatedShow({
    this.showId,
    this.showTitle,
    this.showPoster,
  });

  int? showId;
  String? showTitle;
  String? showPoster;

  factory RelatedShow.fromJson(Map<String, dynamic> json) => RelatedShow(
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

class SeasonList {
  SeasonList({
    this.seasonId,
    this.seasonName,
    this.seasonPoster,
  });

  int? seasonId;
  String? seasonName;
  String? seasonPoster;

  factory SeasonList.fromJson(Map<String, dynamic> json) => SeasonList(
        seasonId: json["season_id"],
        seasonName: json["season_name"],
        seasonPoster: json["season_poster"],
      );

  Map<String, dynamic> toJson() => {
        "season_id": seasonId,
        "season_name": seasonName,
        "season_poster": seasonPoster,
      };
}
