// To parse this JSON data, do
//
//     final appdetails = appdetailsFromJson(jsonString);

import 'dart:convert';

Appdetails appdetailsFromJson(String str) => Appdetails.fromJson(json.decode(str));

String appdetailsToJson(Appdetails data) => json.encode(data.toJson());

class Appdetails {
    Appdetails({
        this.videoStreamingApp,
        this.userStatus,
        this.statusCode,
    });

    List<VideoStreamingApp>? videoStreamingApp;
    bool? userStatus;
    int ?statusCode;

    factory Appdetails.fromJson(Map<String, dynamic> json) => Appdetails(
        videoStreamingApp: List<VideoStreamingApp>.from(json["VIDEO_STREAMING_APP"].map((x) => VideoStreamingApp.fromJson(x))),
        userStatus: json["user_status"],
        statusCode: json["status_code"],
    );

    Map<String, dynamic> toJson() => {
        "VIDEO_STREAMING_APP": List<dynamic>.from(videoStreamingApp!.map((x) => x.toJson())),
        "user_status": userStatus,
        "status_code": statusCode,
    };
}

class VideoStreamingApp {
    VideoStreamingApp({
        this.appPackageName,
        this.appName,
        this.appLogo,
        this.appVersion,
        this.appCompany,
        this.appEmail,
        this.appWebsite,
        this.appContact,
        this.appAbout,
        this.appPrivacy,
        this.publisherId,
        this.interstitalAd,
        this.interstitialAdType,
        this.interstitalAdId,
        this.interstitalAdClick,
        this.bannerAd,
        this.bannerAdType,
        this.bannerAdId,
        this.success,
    });

    String? appPackageName;
    String? appName;
    String? appLogo;
    String? appVersion;
    String? appCompany;
    String? appEmail;
    String? appWebsite;
    String? appContact;
    String? appAbout;
    String? appPrivacy;
    dynamic publisherId;
    String? interstitalAd;
    String? interstitialAdType;
    dynamic interstitalAdId;
    String? interstitalAdClick;
    String? bannerAd;
    String? bannerAdType;
    dynamic bannerAdId;
    String? success;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        appPackageName: json["app_package_name"],
        appName: json["app_name"],
        appLogo: json["app_logo"],
        appVersion: json["app_version"],
        appCompany: json["app_company"],
        appEmail: json["app_email"],
        appWebsite: json["app_website"],
        appContact: json["app_contact"],
        appAbout: json["app_about"],
        appPrivacy: json["app_privacy"],
        publisherId: json["publisher_id"],
        interstitalAd: json["interstital_ad"],
        interstitialAdType: json["interstitial_ad_type"],
        interstitalAdId: json["interstital_ad_id"],
        interstitalAdClick: json["interstital_ad_click"],
        bannerAd: json["banner_ad"],
        bannerAdType: json["banner_ad_type"],
        bannerAdId: json["banner_ad_id"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "app_package_name": appPackageName,
        "app_name": appName,
        "app_logo": appLogo,
        "app_version": appVersion,
        "app_company": appCompany,
        "app_email": appEmail,
        "app_website": appWebsite,
        "app_contact": appContact,
        "app_about": appAbout,
        "app_privacy": appPrivacy,
        "publisher_id": publisherId,
        "interstital_ad": interstitalAd,
        "interstitial_ad_type": interstitialAdType,
        "interstital_ad_id": interstitalAdId,
        "interstital_ad_click": interstitalAdClick,
        "banner_ad": bannerAd,
        "banner_ad_type": bannerAdType,
        "banner_ad_id": bannerAdId,
        "success": success,
    };
}
