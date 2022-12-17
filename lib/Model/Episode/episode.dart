// To parse this JSON data, do
//
//     final allepisode = allepisodeFromJson(jsonString);

import 'dart:convert';

Allepisode allepisodeFromJson(String str) => Allepisode.fromJson(json.decode(str));

String allepisodeToJson(Allepisode data) => json.encode(data.toJson());

class Allepisode {
    Allepisode({
        this.videoStreamingApp,
        this.userPlanStatus,
        this.totalRecords,
        this.statusCode,
    });

    List<VideoStreamingApp>? videoStreamingApp;
    bool? userPlanStatus;
    int ?totalRecords;
    int? statusCode;

    factory Allepisode.fromJson(Map<String, dynamic> json) => Allepisode(
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
        userPlanStatus: json["user_plan_status"],
        totalRecords: json["total_records"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp!.map((x) => x.toJson())),
        "user_plan_status": userPlanStatus,
        "total_records": totalRecords,
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    VideoStreamingApp({
        this.episodeId,
        this.episodeTitle,
        this.episodeImage,
        this.videoAccess,
        this.description,
        this.duration,
        this.releaseDate,
        this.imdbRating,
        this.videoType,
        this.videoUrl,
        this.videoUrl480,
        this.videoUrl720,
        this.videoUrl1080,
        this.langId,
        this.languageName,
        this.genreList,
        this.seriesName,
        this.seasonName,
        this.downloadEnable,
        this.downloadUrl,
        this.subtitleLanguage1,
        this.subtitleUrl1,
        this.subtitleLanguage2,
        this.subtitleUrl2,
        this.subtitleLanguage3,
        this.subtitleUrl3,
        this.videoQuality,
        this.subtitleOnOff,
    });

    int? episodeId;
    String? episodeTitle;
    String? episodeImage;
    String? videoAccess;
    String? description;
    dynamic duration;
    String? releaseDate;
    String? imdbRating;
    String? videoType;
    String? videoUrl;
    String? videoUrl480;
    String? videoUrl720;
    String? videoUrl1080;
    int? langId;
    String? languageName;
    List<String>? genreList;
    String? seriesName;
    String? seasonName;
    String? downloadEnable;
    String? downloadUrl;
    String? subtitleLanguage1;
    String? subtitleUrl1;
    String? subtitleLanguage2;
    String? subtitleUrl2;
    String? subtitleLanguage3;
    String? subtitleUrl3;
    String? videoQuality;
    String? subtitleOnOff;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        episodeId: json["episode_id"],
        episodeTitle: json["episode_title"],
        episodeImage: json["episode_image"],
        videoAccess: json["video_access"],
        description: json["description"],
        duration: json["duration"],
        releaseDate: json["release_date"],
        imdbRating: json["imdb_rating"],
        videoType: json["video_type"],
        videoUrl: json["video_url"],
        videoUrl480: json["video_url_480"],
        videoUrl720: json["video_url_720"],
        videoUrl1080: json["video_url_1080"],
        langId: json["lang_id"],
        languageName: json["language_name"],
        genreList: List<String>.from(json["genre_list"].map((x) => x)),
        seriesName: json["series_name"],
        seasonName: json["season_name"],
        downloadEnable: json["download_enable"],
        downloadUrl: json["download_url"],
        subtitleLanguage1: json["subtitle_language1"],
        subtitleUrl1: json["subtitle_url1"],
        subtitleLanguage2: json["subtitle_language2"],
        subtitleUrl2: json["subtitle_url2"],
        subtitleLanguage3: json["subtitle_language3"],
        subtitleUrl3: json["subtitle_url3"],
        videoQuality: json["video_quality"],
        subtitleOnOff: json["subtitle_on_off"],
    );

    Map<String, dynamic> toJson() => {
        "episode_id": episodeId,
        "episode_title": episodeTitle,
        "episode_image": episodeImage,
        "video_access": videoAccess,
        "description": description,
        "duration": duration,
        "release_date": releaseDate,
        "imdb_rating": imdbRating,
        "video_type": videoType,
        "video_url": videoUrl,
        "video_url_480": videoUrl480,
        "video_url_720": videoUrl720,
        "video_url_1080": videoUrl1080,
        "lang_id": langId,
        "language_name": languageName,
        "genre_list": List<dynamic>.from(genreList!.map((x) => x)),
        "series_name": seriesName,
        "season_name": seasonName,
        "download_enable": downloadEnable,
        "download_url": downloadUrl,
        "subtitle_language1": subtitleLanguage1,
        "subtitle_url1": subtitleUrl1,
        "subtitle_language2": subtitleLanguage2,
        "subtitle_url2": subtitleUrl2,
        "subtitle_language3": subtitleLanguage3,
        "subtitle_url3": subtitleUrl3,
        "video_quality": videoQuality,
        "subtitle_on_off": subtitleOnOff,
    };
}
