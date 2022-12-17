class DownloadSave {
    DownloadSave({
        this.id,
        this.videoid,
        this.proccess,
        this.thumbnail,
        this.savepath,
    });

    int? id;
    int? videoid;
    String? proccess;
    String? thumbnail;
    String? savepath;

    factory DownloadSave.fromJson(Map<String, dynamic> json) => DownloadSave(
        id: json["id"],
        videoid: json["videoid"],
        proccess: json["proccess"],
        thumbnail: json["thumbnail"],
        savepath: json["savepath"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "videoid": videoid,
        "proccess": proccess,
        "thumbnail": thumbnail,
        "savepath": savepath,
    };
}