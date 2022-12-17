// To parse this JSON data, do
//
//     final homepagemovie = homepagemovieFromJson(jsonString);

import 'dart:convert';

Homepagemovie homepagemovieFromJson(String str) => Homepagemovie.fromJson(json.decode(str));

String homepagemovieToJson(Homepagemovie data) => json.encode(data.toJson());

class Homepagemovie {
    Homepagemovie({
        this.videoStreamingApp,
        this.statusCode,
    });

    VideoStreamingApp? videoStreamingApp;
    int? statusCode;

    factory Homepagemovie.fromJson(Map<String, dynamic> json) => Homepagemovie(
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
        this.slider,
        this.recentlyWatched,
        this.latestMovies,
        this.latestShows,
        this.popularMovies,
        this.popularShows,
        this.homeSections3Title,
        this.homeSections3Type,
        this.homeSections3LangId,
        this.homeSections3,
        // this.homeSections4Title,
        // this.homeSections4Type,
        // this.homeSections4LangId,
        // this.homeSections4,
        // this.homeSections5Title,
        // this.homeSections5Type,
        // this.homeSections5LangId,
        this.homeSections5,
    });

    List<Slider>? slider;
    List<dynamic>? recentlyWatched;
    List<HomeSections3>? latestMovies;
    List<HomeSections4> ?latestShows;
    List<HomeSections3>? popularMovies;
    List<HomeSections4>? popularShows;
    String ?homeSections3Title;
    String ?homeSections3Type;
    int? homeSections3LangId;
    List<HomeSections3>? homeSections3;
    // String ?homeSections4Title;
    // String? homeSections4Type;
    // int? homeSections4LangId;
    // List<HomeSections4>? homeSections4;
    // String ?homeSections5Title;
    // String? homeSections5Type;
    // int? homeSections5LangId;
    List<HomeSections3>? homeSections5;

    factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
        slider: List<Slider>.from(json["slider"].map((x) => Slider.fromJson(x))),
        recentlyWatched: List<dynamic>.from(json["recently_watched"].map((x) => x)),
        latestMovies: List<HomeSections3>.from(json["latest_movies"].map((x) => HomeSections3.fromJson(x))),
        latestShows: List<HomeSections4>.from(json["latest_shows"].map((x) => HomeSections4.fromJson(x))),
        popularMovies: List<HomeSections3>.from(json["popular_movies"].map((x) => HomeSections3.fromJson(x))),
        popularShows: List<HomeSections4>.from(json["popular_shows"].map((x) => HomeSections4.fromJson(x))),
        homeSections3Title: json["home_sections3_title"],
        homeSections3Type: json["home_sections3_type"],
        homeSections3LangId: json["home_sections3_lang_id"],
        homeSections3: List<HomeSections3>.from(json["home_sections3"].map((x) => HomeSections3.fromJson(x))),
        // homeSections4Title: json["home_sections4_title"],
        // homeSections4Type: json["home_sections4_type"],
        // homeSections4LangId: json["home_sections4_lang_id"],
        // homeSections4: List<HomeSections4>.from(json["home_sections4"].map((x) => HomeSections4.fromJson(x))),
        // homeSections5Title: json["home_sections5_title"],
        // homeSections5Type: json["home_sections5_type"],
        // homeSections5LangId: json["home_sections5_lang_id"],
        homeSections5: List<HomeSections3>.from(json["home_sections5"].map((x) => HomeSections3.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "slider": List<dynamic>.from(slider!.map((x) => x.toJson())),
        "recently_watched": List<dynamic>.from(recentlyWatched!.map((x) => x)),
        "latest_movies": List<dynamic>.from(latestMovies!.map((x) => x.toJson())),
        "latest_shows": List<dynamic>.from(latestShows!.map((x) => x.toJson())),
        "popular_movies": List<dynamic>.from(popularMovies!.map((x) => x.toJson())),
        "popular_shows": List<dynamic>.from(popularShows!.map((x) => x.toJson())),
        "home_sections3_title": homeSections3Title,
        "home_sections3_type": homeSections3Type,
        "home_sections3_lang_id": homeSections3LangId,
        "home_sections3": List<dynamic>.from(homeSections3!.map((x) => x.toJson())),
        // "home_sections4_title": homeSections4Title,
        // "home_sections4_type": homeSections4Type,
        // "home_sections4_lang_id": homeSections4LangId,
        // "home_sections4": List<dynamic>.from(homeSections4!.map((x) => x.toJson())),
        // "home_sections5_title": homeSections5Title,
        // "home_sections5_type": homeSections5Type,
        // "home_sections5_lang_id": homeSections5LangId,
        "home_sections5": List<dynamic>.from(homeSections5!.map((x) => x.toJson())),
    };
}

class HomeSections3 {
    HomeSections3({
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
    MovieAccess? movieAccess;

    factory HomeSections3.fromJson(Map<String, dynamic> json) => HomeSections3(
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

class HomeSections4 {
    HomeSections4({
        this.showId,
        this.showTitle,
        this.showPoster,
    });

    int? showId;
    String? showTitle;
    String? showPoster;

    factory HomeSections4.fromJson(Map<String, dynamic> json) => HomeSections4(
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

class Slider {
    Slider({
        this.sliderTitle,
        this.sliderType,
        this.sliderPostId,
        this.sliderImage,
    });

    String? sliderTitle;
    String? sliderType;
    int? sliderPostId;
    String ?sliderImage;

    factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        sliderTitle: json["slider_title"],
        sliderType: json["slider_type"],
        sliderPostId: json["slider_post_id"],
        sliderImage: json["slider_image"],
    );

    Map<String, dynamic> toJson() => {
        "slider_title": sliderTitle,
        "slider_type": sliderType,
        "slider_post_id": sliderPostId,
        "slider_image": sliderImage,
    };
}

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




// To parse this JSON data, do
//
//     final homepagemovie = homepagemovieFromJson(jsonString);

// import 'dart:convert';

// Homepagemovie homepagemovieFromJson(String str) => Homepagemovie.fromJson(json.decode(str));

// String homepagemovieToJson(Homepagemovie data) => json.encode(data.toJson());

// class Homepagemovie {
//     Homepagemovie({
//         this.videoStreamingApp,
//         this.statusCode,
//     });

//     VideoStreamingApp? videoStreamingApp;
//     int? statusCode;

//     factory Homepagemovie.fromJson(Map<String, dynamic> json) => Homepagemovie(
//         videoStreamingApp: VideoStreamingApp.fromJson(json["VIDEO_STREAMING_APP"]),
//         statusCode: json["status_code"],
//     );

//     Map<String, dynamic> toJson() => {
//         "VIDEO_STREAMING_APP": videoStreamingApp!.toJson(),
//         "status_code": statusCode,
//     };
// }

// class VideoStreamingApp {
//     VideoStreamingApp({
//         this.slider,
//         this.recentlyWatched,
//         this.latestShows,
//         this.popularShows,
//         this.homeSections3Title,
//         this.homeSections3Type,
//         this.homeSections3LangId,
//         this.homeSections3,
//         this.homeSections4Title,
//         this.homeSections4Type,
//         this.homeSections4LangId,
//         this.homeSections4,
//         this.homeSections5Title,
//         this.homeSections5Type,
//         this.homeSections5LangId,
//         this.homeSections5,
//     });

//     List<Slider>? slider;
//     List<dynamic>? recentlyWatched;
//     List<HomeSections4>? latestShows;
//     List<HomeSections4>? popularShows;
//     String ?homeSections3Title;
//     String? homeSections3Type;
//     dynamic homeSections3LangId;
//     List<HomeSections3>? homeSections3;
//     String? homeSections4Title;
//     String? homeSections4Type;
//     dynamic homeSections4LangId;
//     List<HomeSections4>? homeSections4;
//     String? homeSections5Title;
//     String? homeSections5Type;
//     dynamic homeSections5LangId;
//     List<dynamic>? homeSections5;

//     factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
//         slider: List<Slider>.from(json["slider"].map((x) => Slider.fromJson(x))),
//         recentlyWatched: List<dynamic>.from(json["recently_watched"].map((x) => x)),
//         latestShows: List<HomeSections4>.from(json["latest_shows"].map((x) => HomeSections4.fromJson(x))),
//         popularShows: List<HomeSections4>.from(json["popular_shows"].map((x) => HomeSections4.fromJson(x))),
//         homeSections3Title: json["home_sections3_title"],
//         homeSections3Type: json["home_sections3_type"],
//         homeSections3LangId: json["home_sections3_lang_id"],
//         homeSections3: List<HomeSections3>.from(json["home_sections3"].map((x) => HomeSections3.fromJson(x))),
//         homeSections4Title: json["home_sections4_title"],
//         homeSections4Type: json["home_sections4_type"],
//         homeSections4LangId: json["home_sections4_lang_id"],
//         homeSections4: List<HomeSections4>.from(json["home_sections4"].map((x) => HomeSections4.fromJson(x))),
//         homeSections5Title: json["home_sections5_title"],
//         homeSections5Type: json["home_sections5_type"],
//         homeSections5LangId: json["home_sections5_lang_id"],
//         homeSections5: List<dynamic>.from(json["home_sections5"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "slider": List<dynamic>.from(slider!.map((x) => x.toJson())),
//         "recently_watched": List<dynamic>.from(recentlyWatched!.map((x) => x)),
//         "latest_shows": List<dynamic>.from(latestShows!.map((x) => x.toJson())),
//         "popular_shows": List<dynamic>.from(popularShows!.map((x) => x.toJson())),
//         "home_sections3_title": homeSections3Title,
//         "home_sections3_type": homeSections3Type,
//         "home_sections3_lang_id": homeSections3LangId,
//         "home_sections3": List<dynamic>.from(homeSections3!.map((x) => x.toJson())),
//         "home_sections4_title": homeSections4Title,
//         "home_sections4_type": homeSections4Type,
//         "home_sections4_lang_id": homeSections4LangId,
//         "home_sections4": List<dynamic>.from(homeSections4!.map((x) => x.toJson())),
//         "home_sections5_title": homeSections5Title,
//         "home_sections5_type": homeSections5Type,
//         "home_sections5_lang_id": homeSections5LangId,
//         "home_sections5": List<dynamic>.from(homeSections5!.map((x) => x)),
//     };
// }

// class HomeSections3 {
//     HomeSections3({
//         this.movieId,
//         this.movieTitle,
//         this.moviePoster,
//         this.movieDuration,
//         this.movieAccess,
//     });

//     int? movieId;
//     String? movieTitle;
//     String? moviePoster;
//     String? movieDuration;
//     String? movieAccess;

//     factory HomeSections3.fromJson(Map<String, dynamic> json) => HomeSections3(
//         movieId: json["movie_id"],
//         movieTitle: json["movie_title"],
//         moviePoster: json["movie_poster"],
//         movieDuration: json["movie_duration"],
//         movieAccess: json["movie_access"],
//     );

//     Map<String, dynamic> toJson() => {
//         "movie_id": movieId,
//         "movie_title": movieTitle,
//         "movie_poster": moviePoster,
//         "movie_duration": movieDuration,
//         "movie_access": movieAccess,
//     };
// }

// class HomeSections4 {
//     HomeSections4({
//         this.showId,
//         this.showTitle,
//         this.showPoster,
//     });

//     int? showId;
//     String? showTitle;
//     String? showPoster;

//     factory HomeSections4.fromJson(Map<String, dynamic> json) => HomeSections4(
//         showId: json["show_id"],
//         showTitle: json["show_title"],
//         showPoster: json["show_poster"],
//     );

//     Map<String, dynamic> toJson() => {
//         "show_id": showId,
//         "show_title": showTitle,
//         "show_poster": showPoster,
//     };
// }

// class Slider {
//     Slider({
//         this.sliderTitle,
//         this.sliderType,
//         this.sliderPostId,
//         this.sliderImage,
//     });

//     String? sliderTitle;
//     String? sliderType;
//     int? sliderPostId;
//     String? sliderImage;

//     factory Slider.fromJson(Map<String, dynamic> json) => Slider(
//         sliderTitle: json["slider_title"],
//         sliderType: json["slider_type"],
//         sliderPostId: json["slider_post_id"],
//         sliderImage: json["slider_image"],
//     );

//     Map<String, dynamic> toJson() => {
//         "slider_title": sliderTitle,
//         "slider_type": sliderType,
//         "slider_post_id": sliderPostId,
//         "slider_image": sliderImage,
//     };
// }
