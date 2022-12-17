import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoichoi_clone_app/Db/Dbinit/dbinit.dart';
import 'package:hoichoi_clone_app/Http/EpisodeRecentwatch/episoderecentwatch.dart';
import 'package:hoichoi_clone_app/Playvideo/playvideo.dart';
import 'package:hoichoi_clone_app/Provider/download.dart';
import 'package:hoichoi_clone_app/Screen/VideoPlayer/videoplayer.dart';
import 'package:hoichoi_clone_app/Screen/VideoView/videoview.dart';
import 'package:hoichoi_clone_app/Toast/toast.dart';
import 'package:hoichoi_clone_app/VideoOpen/videoopen.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'package:provider/provider.dart';

import '../../Model/Episode/episode.dart';
import '../../VideoOpen/videopayer2.dart';

class EpisodePage extends StatefulWidget {
  final VideoStreamingApp data2;
  const EpisodePage({Key? key, required this.data2}) : super(key: key);

  @override
  State<EpisodePage> createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage> {
  int progress = 0;
  bool downloading = false;
  var progressString = "";

  ReceivePort _receivePort = ReceivePort();

  static downloadingCallback(id, status, progress) {
    ///Looking up for a send port
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloading");

    ///ssending the data
    sendPort!.send([id, status, progress]);
  }

  // Future startdownload(String url, int pdfid) async {
  //   var box = Hive.box('download');
  //   Dio dio = Dio();
  //   var dir = await getApplicationDocumentsDirectory();
  //   final filename = path.basename(url);
  //   print(filename);

  //   final file = File('${dir.path}/$filename');
  //   // await file.writeAsBytes(bytes, flush: true);
  //   try {
  //     await dio.download(url, "${dir.path}/$filename",
  //         onReceiveProgress: (rec, total) {
  //       setState(() {
  //         downloading = true;
  //         progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
  //         print(progressString);
  //       });
  //     });
  //     return progressString;
  //   } catch (e) {
  //     print(e);
  //   }

  //   setState(() {
  //     downloading = false;
  //     progressString = "Completed";
  //     box.put(pdfid, "${dir.path}/$filename");
  //   });
  //   print("Download completed");
  //   return progressString;
  // }

  offlinedownload(String savepath) {
    Dbinit().insertquestion(
        proccess: progress.toString(),
        savepath: savepath,
        thumbnail: widget.data2.episodeImage,
        videoid: widget.data2.episodeId);
  }


  @override
  void initState() {
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, "downloading");

    ///Listening for the data is comming other isolataes
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });

      print(progress);
    });

    // FlutterDownloader.registerCallback(downloadingCallback);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // final download = Provider.of<Downloadprovider>(context);
    return InkWell(
      focusColor: Colors.red,
      onFocusChange: (d){},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: size.height * 0.1,
        width: size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.data2.episodeImage!,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                      onPressed: () {
                        print(widget.data2.videoAccess);
                        if (Playvideo().playvideo(context) == true) {
                          // ExoPlayer().exoplayerbuild(widget.data2.videoUrl!);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => VideoPlayer2(
                                        videourl: widget.data2.videoUrl!,
                                      ))));
                          HttpEpisoderecentWatch()
                              .episoderecent(widget.data2.episodeId.toString());
                        } else if (widget.data2.videoAccess == "FREE" &&
                            Playvideo().playvideo(context) == false) {
                          // print(data.movieAccess.toString().split('.').last);
                          print("Buy ANy member SHip package");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => VideoPlayer2(
                                        videourl: widget.data2.videoUrl!,
                                      ))));
                          HttpEpisoderecentWatch()
                              .episoderecent(widget.data2.episodeId.toString());
                        } else {
                          ShowToastMessage()
                              .showsuccess("Chosse a membership package");
                        }
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 45,
                        color: color,
                      ),
                 focusColor: Colors.red,
                  )

                ],
              ),
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: Text(
                    widget.data2.episodeTitle!,
                    maxLines: 1,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(height: 2),
                  Expanded(
                    // child: Text(
                    //   !,
                    //   maxLines: 3,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: TextStyle(
                    //       color: Colors.white.withOpacity(0.7)),
                    // ),
                    child: Html(data: widget.data2.description),
                  )
                ],
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     download.startdownload(widget.data2.videoUrl!,
            //         widget.data2.episodeId!, widget.data2.episodeImage!);
            //   },
            //   child: Container(
            //     child: const Icon(
            //       Icons.download,
            //       size: 35,
            //       color: Colors.white,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
