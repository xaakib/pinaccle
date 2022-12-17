// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hoichoi_clone_app/Db/Dbinit/dbinit.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

// class Downloadprovider extends ChangeNotifier {
//   bool downloading = false;
//   var progressString = "";

//   Future startdownload(String url, int videoid, thumbnail) async {
//     var box = Hive.box('download');
//     Dio dio = Dio();
//     var dir = await getApplicationDocumentsDirectory();
//     final filename = path.basename(url);
//     print(filename);

//     final file = File('${dir.path}/$filename');
//     // await file.writeAsBytes(bytes, flush: true);
//     try {
//       await dio.download(
//         url,
//         "${dir.path}/$filename",
//         onReceiveProgress: (rec, total) {
//           downloading = true;
//           progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
//         },
//       );
//       Future.delayed(const Duration(seconds: 1), () {
//         Dbinit().insertquestion(
//             proccess: progressString,
//             savepath: "${dir.path}/$filename",
//             thumbnail: thumbnail,
//             videoid: videoid);
//       });
//       notifyListeners();
//     } catch (e) {
//       print(e);
//     }

//     downloading = false;
//     progressString = "Completed";
//     // box.put(pdfid, "${dir.path}/$filename");

//     print("Download completed");
//     notifyListeners();
//   }
// }
