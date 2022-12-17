// To parse this JSON data, do
//
//     final allpages = allpagesFromJson(jsonString);

import 'dart:convert';

Allpages allpagesFromJson(String str) => Allpages.fromJson(json.decode(str));

String allpagesToJson(Allpages data) => json.encode(data.toJson());

class Allpages {
  Allpages({
    this.allPages,
    this.statusCode,
  });

  List<AllPage>? allPages;
  String? statusCode;

  factory Allpages.fromJson(Map<String, dynamic> json) => Allpages(
        allPages: List<AllPage>.from(
            json["all_pages"].map((x) => AllPage.fromJson(x))),
        statusCode: json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "all_pages": List<dynamic>.from(allPages!.map((x) => x.toJson())),
        "status_code": statusCode,
      };
}

class AllPage {
  AllPage({
    this.id,
    this.pageTitle,
    this.pageSlug,
    this.pageContent,
    this.status,
  });

  int? id;
  String? pageTitle;
  String? pageSlug;
  String? pageContent;
  int? status;

  factory AllPage.fromJson(Map<String, dynamic> json) => AllPage(
        id: json["id"],
        pageTitle: json["page_title"],
        pageSlug: json["page_slug"],
        pageContent: json["page_content"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "page_title": pageTitle,
        "page_slug": pageSlug,
        "page_content": pageContent,
        "status": status,
      };
}
