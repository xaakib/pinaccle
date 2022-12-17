import 'dart:io';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';




class VideoPlayer2 extends StatefulWidget {
  final String videourl;
  const VideoPlayer2({Key? key, required this.videourl})
      : super(key: key);

  @override
  _VideoPlayer2State createState() => _VideoPlayer2State();
}

class _VideoPlayer2State extends State<VideoPlayer2> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  bool loading = true;

 

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.network(widget.videourl)
      ..initialize().then((value) => setState(() {
            loading = false;
          }))
      ..play();
    _customVideoPlayerController = CustomVideoPlayerController(
      customVideoPlayerSettings: CustomVideoPlayerSettings(
          enterFullscreenButton: IconButton(
            onPressed: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeLeft,
              ]);
              _customVideoPlayerController.setFullscreen(true);
            },
            icon: Icon(
              Icons.fullscreen,
              color: Colors.white,
            ),
          ),
          exitFullscreenButton: IconButton(
            onPressed: () {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);
              _customVideoPlayerController.setFullscreen(false);
            },
            icon: Icon(
              Icons.fullscreen_exit,
              color: Colors.white,
            ),
          ),
          settingsButton: Row(
            children: [
              IconButton(
                  onPressed: () {
                    SystemChrome.setPreferredOrientations(
                        [DeviceOrientation.portraitUp]);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ))
            ],
          )),
      context: context,
      videoPlayerController: videoPlayerController,
    );
  
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            CustomVideoPlayer(
                customVideoPlayerController: _customVideoPlayerController),
            loading
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ),
                  )
                : Container(),
            loading
                ? Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
