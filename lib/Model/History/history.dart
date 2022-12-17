// To parse this JSON data, do
//
//     final history = historyFromJson(jsonString);

import 'dart:convert';

History historyFromJson(String str) => History.fromJson(json.decode(str));

String historyToJson(History data) => json.encode(data.toJson());

class History {
    History({
        this.history,
        this.imageVideoUrl,
        this.statusCode,
    });

    List<HistoryElement>? history;
    String? imageVideoUrl;
    String? statusCode;

    factory History.fromJson(Map<String, dynamic> json) => History(
        history: List<HistoryElement>.from(json["history"].map((x) => HistoryElement.fromJson(x))),
        imageVideoUrl: json["image_video_url"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "history": List<dynamic>.from(history!.map((x) => x.toJson())),
        "image_video_url": imageVideoUrl,
        "status_code": statusCode,
    };
}

class HistoryElement {
    HistoryElement({
        this.id,
        this.videoType,
        this.userId,
        this.videoId,
        this.videoTitle,
        this.videoImage,
        this.videoUrl,
    });

    int? id;
    String ?videoType;
    int? userId;
    int? videoId;
    String? videoTitle;
    String? videoImage;
    String? videoUrl;

    factory HistoryElement.fromJson(Map<String, dynamic> json) => HistoryElement(
        id: json["id"],
        videoType: json["video_type"],
        userId: json["user_id"],
        videoId: json["video_id"],
        videoTitle: json["video_title"],
        videoImage: json["video_image"],
        videoUrl: json["video_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "video_type": videoType,
        "user_id": userId,
        "video_id": videoId,
        "video_title": videoTitle,
        "video_image": videoImage,
        "video_url": videoUrl,
    };
}
