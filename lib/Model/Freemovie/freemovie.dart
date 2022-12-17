// To parse this JSON data, do
//
//     final freemovie = freemovieFromJson(jsonString);

import 'dart:convert';

Freemovie freemovieFromJson(String str) => Freemovie.fromJson(json.decode(str));

String freemovieToJson(Freemovie data) => json.encode(data.toJson());

class Freemovie {
    Freemovie({
        this.freeMovies,
        this.imageVideoUrl,
        this.statusCode,
    });

    List<FreeMovie>? freeMovies;
    String? imageVideoUrl;
    String? statusCode;

    factory Freemovie.fromJson(Map<String, dynamic> json) => Freemovie(
        freeMovies: List<FreeMovie>.from(json["free_movies"].map((x) => FreeMovie.fromJson(x))),
        imageVideoUrl: json["image_video_url"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "free_movies": List<dynamic>.from(freeMovies!.map((x) => x.toJson())),
        "image_video_url": imageVideoUrl,
        "status_code": statusCode,
    };
}

class FreeMovie {
    FreeMovie({
        this.id,
        this.videoAccess,
        this.movieLangId,
        this.movieGenreId,
        this.videoTitle,
        this.releaseDate,
        this.duration,
        this.videoDescription,
        this.videoSlug,
        this.videoImageThumb,
        this.videoImage,
        this.videoType,
        this.videoQuality,
        this.videoUrl,
        this.videoUrl480,
        this.videoUrl720,
        this.videoUrl1080,
        this.downloadEnable,
        this.downloadUrl,
        this.subtitleOnOff,
        this.subtitleLanguage1,
        this.subtitleUrl1,
        this.subtitleLanguage2,
        this.subtitleUrl2,
        this.subtitleLanguage3,
        this.subtitleUrl3,
        this.imdbId,
        this.imdbRating,
        this.imdbVotes,
        this.seoTitle,
        this.seoDescription,
        this.seoKeyword,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    VideoAccess? videoAccess;
    int? movieLangId;
    String? movieGenreId;
    String? videoTitle;
    int? releaseDate;
    String? duration;
    String? videoDescription;
    String? videoSlug;
    String? videoImageThumb;
    String? videoImage;
    String? videoType;
    dynamic videoQuality;
    String? videoUrl;
    String? videoUrl480;
    String? videoUrl720;
    dynamic videoUrl1080;
    int? downloadEnable;
    String? downloadUrl;
    dynamic subtitleOnOff;
    String? subtitleLanguage1;
    String? subtitleUrl1;
    String? subtitleLanguage2;
    String? subtitleUrl2;
    dynamic subtitleLanguage3;
    dynamic subtitleUrl3;
    String? imdbId;
    String? imdbRating;
    dynamic imdbVotes;
    String? seoTitle;
    String? seoDescription;
    String? seoKeyword;
    int? status;
    dynamic createdAt;
    DateTime? updatedAt;

    factory FreeMovie.fromJson(Map<String, dynamic> json) => FreeMovie(
        id: json["id"],
        videoAccess: videoAccessValues.map![json["video_access"]],
        movieLangId: json["movie_lang_id"],
        movieGenreId: json["movie_genre_id"],
        videoTitle: json["video_title"],
        releaseDate: json["release_date"],
        duration: json["duration"],
        videoDescription: json["video_description"],
        videoSlug: json["video_slug"],
        videoImageThumb: json["video_image_thumb"],
        videoImage: json["video_image"],
        videoType: json["video_type"],
        videoQuality: json["video_quality"],
        videoUrl: json["video_url"],
        videoUrl480: json["video_url_480"] == null ? null : json["video_url_480"],
        videoUrl720: json["video_url_720"] == null ? null : json["video_url_720"],
        videoUrl1080: json["video_url_1080"],
        downloadEnable: json["download_enable"] == null ? null : json["download_enable"],
        downloadUrl: json["download_url"] == null ? null : json["download_url"],
        subtitleOnOff: json["subtitle_on_off"],
        subtitleLanguage1: json["subtitle_language1"] == null ? null : json["subtitle_language1"],
        subtitleUrl1: json["subtitle_url1"] == null ? null : json["subtitle_url1"],
        subtitleLanguage2: json["subtitle_language2"] == null ? null : json["subtitle_language2"],
        subtitleUrl2: json["subtitle_url2"] == null ? null : json["subtitle_url2"],
        subtitleLanguage3: json["subtitle_language3"],
        subtitleUrl3: json["subtitle_url3"],
        imdbId: json["imdb_id"] == null ? null : json["imdb_id"],
        imdbRating: json["imdb_rating"] == null ? null : json["imdb_rating"],
        imdbVotes: json["imdb_votes"],
        seoTitle: json["seo_title"] == null ? null : json["seo_title"],
        seoDescription: json["seo_description"] == null ? null : json["seo_description"],
        seoKeyword: json["seo_keyword"] == null ? null : json["seo_keyword"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "video_access": videoAccessValues.reverse[videoAccess],
        "movie_lang_id": movieLangId,
        "movie_genre_id": movieGenreId,
        "video_title": videoTitle,
        "release_date": releaseDate,
        "duration": duration,
        "video_description": videoDescription,
        "video_slug": videoSlug,
        "video_image_thumb": videoImageThumb,
        "video_image": videoImage,
        "video_type": videoType,
        "video_quality": videoQuality,
        "video_url": videoUrl,
        "video_url_480": videoUrl480 == null ? null : videoUrl480,
        "video_url_720": videoUrl720 == null ? null : videoUrl720,
        "video_url_1080": videoUrl1080,
        "download_enable": downloadEnable == null ? null : downloadEnable,
        "download_url": downloadUrl == null ? null : downloadUrl,
        "subtitle_on_off": subtitleOnOff,
        "subtitle_language1": subtitleLanguage1 == null ? null : subtitleLanguage1,
        "subtitle_url1": subtitleUrl1 == null ? null : subtitleUrl1,
        "subtitle_language2": subtitleLanguage2 == null ? null : subtitleLanguage2,
        "subtitle_url2": subtitleUrl2 == null ? null : subtitleUrl2,
        "subtitle_language3": subtitleLanguage3,
        "subtitle_url3": subtitleUrl3,
        "imdb_id": imdbId == null ? null : imdbId,
        "imdb_rating": imdbRating == null ? null : imdbRating,
        "imdb_votes": imdbVotes,
        "seo_title": seoTitle == null ? null : seoTitle,
        "seo_description": seoDescription == null ? null : seoDescription,
        "seo_keyword": seoKeyword == null ? null : seoKeyword,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}

enum VideoAccess { FREE }

final videoAccessValues = EnumValues({
    "Free": VideoAccess.FREE
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
