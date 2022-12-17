import 'package:hoichoi_clone_app/Db/Practice/practicedb.dart';
import 'package:hoichoi_clone_app/Db/Practice/practicemodel.dart';

class Dbinit {
  final DownloadDB downloadDB = DownloadDB();

  Future<List<DownloadSave>> getsingledownload(int videoid) async {
    return await downloadDB.getsingledownload(videoid);
  }

  Future insertquestion(
      {int? videoid,
      String? proccess,
      String? thumbnail,
      String? savepath}) async {
    getsingledownload(videoid!).then((value) {
      if (value.isNotEmpty &&
          value.any((element) => element.videoid == videoid)) {
        downloadDB.update(
            proccess: proccess,
            savepath: savepath,
            thumbnail: thumbnail,
            videoid: videoid);
        print("update");
      } else {
        DownloadSave downloadSave = DownloadSave(
            proccess: proccess,
            savepath: savepath,
            thumbnail: thumbnail,
            videoid: videoid);
        downloadDB.insertdata(downloadSave);
        print("insert");
      }
    });
  }

  Future<List<DownloadSave>> getdownloadmovie() async {
    return await downloadDB.getdata();
  }
}
