// import 'package:chewie/chewie.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hoichoi_clone_app/Custom/materialcontroll.dart';
// // ignore: depend_on_referenced_packages
// import 'package:video_player/video_player.dart';

// class ChewieDemo extends StatefulWidget {
//   final String videourl;
//   const ChewieDemo({
//     Key? key,
//     this.title = 'Chewie Demo',
//     required this.videourl,
//   }) : super(key: key);

//   final String title;

//   @override
//   State<StatefulWidget> createState() {
//     return _ChewieDemoState();
//   }
// }

// class _ChewieDemoState extends State<ChewieDemo> {
//   TargetPlatform? _platform;
//   late VideoPlayerController _videoPlayerController1;
//   late VideoPlayerController _videoPlayerController2;
//   ChewieController? _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeLeft,
//     ]);
//     initializePlayer();
//   }

//   @override
//   void dispose() {
//     _videoPlayerController1.dispose();
//     _videoPlayerController2.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }

//   List<String> srcs = [
//     "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4",
//     "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4"
//   ];

//   Future<void> initializePlayer() async {
//     _videoPlayerController1 = VideoPlayerController.network(widget.videourl);
//     await Future.wait([
//       _videoPlayerController1.initialize(),
//     ]);
//     _createChewieController();
//     setState(() {});
//   }

//   void _createChewieController() {
//     // final subtitles = [
//     //     Subtitle(
//     //       index: 0,
//     //       start: Duration.zero,
//     //       end: const Duration(seconds: 10),
//     //       text: 'Hello from subtitles',
//     //     ),
//     //     Subtitle(
//     //       index: 0,
//     //       start: const Duration(seconds: 10),
//     //       end: const Duration(seconds: 20),
//     //       text: 'Whats up? :)',
//     //     ),
//     //   ];

//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController1,
//       autoPlay: true,
//       looping: true,
//       // customControls: Container(
//       //   height: 50,
//       //   width: 50,
//       //   color: Colors.red,
//       // ),
//       // overlay: Container(
//       //   height: 50,
//       //   width: 50,
//       //   color: Colors.red,
//       // ),
//       // placeholder: Container(
//       //   height: 50,
//       //   width: 50,
//       //   color: Colors.red,
//       // ),
//       showControls: true,
//       allowFullScreen: true,
//       fullScreenByDefault: false,
//       customControls: CustomMaterialControls(),

//       additionalOptions: (context) {
//         return <OptionItem>[
//           OptionItem(
//             onTap: toggleVideo,
//             iconData: Icons.live_tv_sharp,
//             title: 'Toggle Video Src',
//           ),
//         ];
//       },

//       hideControlsTimer: const Duration(seconds: 1),

//       // Try playing around with some of these other options:

//       // showControls: false,
//       // materialProgressColors: ChewieProgressColors(
//       //   playedColor: Colors.red,
//       //   handleColor: Colors.blue,
//       //   backgroundColor: Colors.grey,
//       //   bufferedColor: Colors.lightGreen,
//       // ),
//       // placeholder: Container(
//       //   color: Colors.grey,
//       // ),
//       // autoInitialize: true,
//     );
//   }

//   int currPlayIndex = 0;

//   Future<void> toggleVideo() async {
//     await _videoPlayerController1.pause();
//     currPlayIndex = currPlayIndex == 0 ? 1 : 0;
//     await initializePlayer();
//   }

//   Future<bool?> showwarning(BuildContext context) async {
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//         .then((value) => Navigator.pop(context));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         final warning = await showwarning(context);
//         return warning ?? false;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         // appBar: AppBar(
//         //   title: Text(widget.title),
//         // ),
//         body: SafeArea(
//           bottom: true,
//           top: true,
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Center(
//                   child: _chewieController != null &&
//                           _chewieController!
//                               .videoPlayerController.value.isInitialized
//                       ? Chewie(
//                           controller: _chewieController!,
//                         )
//                       : Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             CircularProgressIndicator(),
//                             SizedBox(height: 20),
//                             Text('Loading'),
//                           ],
//                         ),
//                 ),
//               ),
//               // TextButton(
//               //   onPressed: () {
//               //     _chewieController?.enterFullScreen();
//               //   },
//               //   child: const Text('Fullscreen'),
//               // ),
//               // Row(
//               //   children: <Widget>[
//               //     Expanded(
//               //       child: TextButton(
//               //         onPressed: () {
//               //           setState(() {
//               //             _videoPlayerController1.pause();
//               //             _videoPlayerController1.seekTo(Duration.zero);
//               //             _createChewieController();
//               //           });
//               //         },
//               //         child: const Padding(
//               //           padding: EdgeInsets.symmetric(vertical: 16.0),
//               //           child: Text("Landscape Video"),
//               //         ),
//               //       ),
//               //     ),
//               //     Expanded(
//               //       child: TextButton(
//               //         onPressed: () {
//               //           setState(() {
//               //             _videoPlayerController2.pause();
//               //             _videoPlayerController2.seekTo(Duration.zero);
//               //             _chewieController = _chewieController!.copyWith(
//               //               videoPlayerController: _videoPlayerController2,
//               //               autoPlay: true,
//               //               looping: true,
//               //               /* subtitle: Subtitles([
//               //                   Subtitle(
//               //                     index: 0,
//               //                     start: Duration.zero,
//               //                     end: const Duration(seconds: 10),
//               //                     text: 'Hello from subtitles',
//               //                   ),
//               //                   Subtitle(
//               //                     index: 0,
//               //                     start: const Duration(seconds: 10),
//               //                     end: const Duration(seconds: 20),
//               //                     text: 'Whats up? :)',
//               //                   ),
//               //                 ]),
//               //                 subtitleBuilder: (context, subtitle) => Container(
//               //                   padding: const EdgeInsets.all(10.0),
//               //                   child: Text(
//               //                     subtitle,
//               //                     style: const TextStyle(color: Colors.white),
//               //                   ),
//               //                 ), */
//               //             );
//               //           });
//               //         },
//               //         child: const Padding(
//               //           padding: EdgeInsets.symmetric(vertical: 16.0),
//               //           child: Text("Portrait Video"),
//               //         ),
//               //       ),
//               //     )
//               //   ],
//               // ),
//               // Row(
//               //   children: <Widget>[
//               //     Expanded(
//               //       child: TextButton(
//               //         onPressed: () {
//               //           setState(() {
//               //             _platform = TargetPlatform.android;
//               //           });
//               //         },
//               //         child: const Padding(
//               //           padding: EdgeInsets.symmetric(vertical: 16.0),
//               //           child: Text("Android controls"),
//               //         ),
//               //       ),
//               //     ),
//               //     Expanded(
//               //       child: TextButton(
//               //         onPressed: () {
//               //           setState(() {
//               //             _platform = TargetPlatform.iOS;
//               //           });
//               //         },
//               //         child: const Padding(
//               //           padding: EdgeInsets.symmetric(vertical: 16.0),
//               //           child: Text("iOS controls"),
//               //         ),
//               //       ),
//               //     )
//               //   ],
//               // ),
//               // Row(
//               //   children: <Widget>[
//               //     Expanded(
//               //       child: TextButton(
//               //         onPressed: () {
//               //           setState(() {
//               //             _platform = TargetPlatform.windows;
//               //           });
//               //         },
//               //         child: const Padding(
//               //           padding: EdgeInsets.symmetric(vertical: 16.0),
//               //           child: Text("Desktop controls"),
//               //         ),
//               //       ),
//               //     ),
//               //   ],
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
