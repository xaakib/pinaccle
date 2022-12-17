// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hoichoi_clone_app/constants.dart';
// import 'package:video_player/video_player.dart';
// // ignore: depend_on_referenced_packages

// class ChewieDemo extends StatefulWidget {
//   final String url;
//   const ChewieDemo({
//     Key? key,
//     this.title = 'Live',
//     required this.url,
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

//   ChewieController? _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
//     initializePlayer();
//   }

//   @override
//   void dispose() {
//     _videoPlayerController1.dispose();

//     _chewieController?.dispose();
//     super.dispose();
//   }

//   Future<void> initializePlayer() async {
//     _videoPlayerController1 = VideoPlayerController.network(widget.url);

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

//     // final subtitles = [
//     //   Subtitle(
//     //     index: 0,
//     //     start: Duration.zero,
//     //     end: const Duration(seconds: 10),
//     //     text: const TextSpan(
//     //       children: [
//     //         TextSpan(
//     //           text: 'Hello',
//     //           style: TextStyle(color: Colors.red, fontSize: 22),
//     //         ),
//     //         TextSpan(
//     //           text: ' from ',
//     //           style: TextStyle(color: Colors.green, fontSize: 20),
//     //         ),
//     //         TextSpan(
//     //           text: 'subtitles',
//     //           style: TextStyle(color: Colors.blue, fontSize: 18),
//     //         )
//     //       ],
//     //     ),
//     //   ),
//     //   Subtitle(
//     //     index: 0,
//     //     start: const Duration(seconds: 10),
//     //     end: const Duration(seconds: 20),
//     //     text: 'Whats up? :)',
//     //     // text: const TextSpan(
//     //     //   text: 'Whats up? :)',
//     //     //   style: TextStyle(color: Coklors.amber, fontSize: 22, fontStyle: FontStyle.italic),
//     //     // ),
//     //   ),
//     // ];

//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController1,
//       autoPlay: true,
//       looping: false,
//       allowFullScreen: true,

//       showControls: true,
//       showControlsOnInitialize: true,
//       showOptions: true,

//       // additionalOptions: (context) {
//       //   return <OptionItem>[
//       //     OptionItem(
//       //       onTap: (){
//       //         _chewieController.
//       //       },
//       //       iconData: Icons.live_tv_sharp,
//       //       title: 'Toggle Video Src',
//       //     ),
//       //   ];
//       // },
//       // subtitle: Subtitles(subtitles),
//       subtitleBuilder: (context, dynamic subtitle) => Container(
//         padding: const EdgeInsets.all(10.0),
//         child: subtitle is InlineSpan
//             ? RichText(
//                 text: subtitle,
//               )
//             : Text(
//                 subtitle.toString(),
//                 style: const TextStyle(color: Colors.black),
//               ),
//       ),

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
//     print(MediaQuery.of(context).orientation);
//     return WillPopScope(
//       onWillPop: () async {
//         final warning = await showwarning(context);
//         return warning ?? false;
//       },
//       child: Scaffold(
//         // appBar: AppBar(
//         //   title: Text(widget.title),
//         //   leading: IconButton(
//         //       onPressed: () {
//         //         SystemChrome.setPreferredOrientations(
//         //                 [DeviceOrientation.portraitUp])
//         //             .then((value) => Navigator.pop(context));
//         //       },
//         //       icon: Icon(Icons.arrow_back_ios)),
//         // ),
//         body: Center(
//           child: _chewieController != null &&
//                   _chewieController!.videoPlayerController.value.isInitialized
//               ? Chewie(
//                   controller: _chewieController!,
//                 )
//               : Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: const [
//                     CircularProgressIndicator(
//                       color: color,
//                     ),
//                     SizedBox(height: 20),
//                     // Text('Loading'),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }
// }
