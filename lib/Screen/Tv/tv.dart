import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/Tv/tv.dart';
import 'package:hoichoi_clone_app/Http/Tvdetails/tvdetails.dart';
import 'package:hoichoi_clone_app/Model/Tv/tv.dart';
import 'package:hoichoi_clone_app/Playvideo/playvideo.dart';
import 'package:hoichoi_clone_app/Screen/Tvdetails/tvdetails.dart';
import 'package:hoichoi_clone_app/Screen/VideoPlayer/videoplayer.dart';
import 'package:hoichoi_clone_app/Screen/VideoView/videoview.dart';
import 'package:hoichoi_clone_app/Toast/toast.dart';
import 'package:hoichoi_clone_app/VideoOpen/videoopen.dart';
import 'package:hoichoi_clone_app/constants.dart';

import '../../Http/Movie_genre/movie_genre.dart';
import '../../Model/Movies/movies.dart';
import '../../VideoOpen/videopayer2.dart';

class TvPage extends StatefulWidget {
  final String genreid;
  const TvPage({Key? key, required this.genreid}) : super(key: key);

  @override
  State<TvPage> createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> {
  int pagechangeindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: tvlist(),
    );
  }

  Widget imageslider() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                pagechangeindex = value;
              });
            },
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                child: Image.asset(
                  'images/1.jpg',
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,
                  (index) => Container(
                        margin: const EdgeInsets.only(right: 6),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: pagechangeindex == index
                                ? Colors.red
                                : Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                      )),
            ),
          )
        ],
      ),
    );
  }

  Widget tvlist() {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<Tv?>(
        future: HttpTv().gettv(),
        builder: ((context, snapshot) {
          Widget child;
          if (snapshot.hasData) {
            child = SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                child:
                Wrap(
                  spacing: 5,



                  children: [
                    for (var data in snapshot.data!.videoStreamingApp!)
                      InkWell(
                        focusColor: Colors.red,
                        onFocusChange: (vale){

                        },
                        onTap: () {
                          print(data.tvAccess);
                          if (Playvideo().playvideo(context) == true) {
                            HttpTvDetails()
                                .gettvdetails(tvid: data.tvId.toString())
                                .then((value) {
                              // ExoPlayer().exoplayerbuild(
                              //     value!.videoStreamingApp!.tvUrl!);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => VideoPlayer2(
                                        videourl:
                                        value!.videoStreamingApp!.tvUrl!,
                                        // title:
                                        //     value.videoStreamingApp!.tvTitle!,
                                      ))));
                            });
                          } else if (data.tvAccess == "Free" &&
                              Playvideo().playvideo(context) == false) {
                            HttpTvDetails()
                                .gettvdetails(tvid: data.tvId.toString())
                                .then((value) {
                              // ExoPlayer().exoplayerbuild(
                              //     value!.videoStreamingApp!.tvUrl!);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => VideoPlayer2(
                                        videourl:
                                        value!.videoStreamingApp!.tvUrl!,
                                        // title:
                                        //     value.videoStreamingApp!.tvTitle!,
                                      ))));
                            });
                          } else {
                            ShowToastMessage()
                                .showsuccess("Choose a membership package");
                          }
                        },
                        child: Container(
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height:  150,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),


                                    // image: DecorationImage(
                                    //   fit: BoxFit.cover,
                                    //   // colorFilter:
                                    //   // item[index]?  ColorFilter.mode(Colors.black.withOpacity(0.2),
                                    //   //     BlendMode.dstATop): null,
                                    //   image:  NetworkImage(
                                    //     data.moviePoster!,
                                    //   ),
                                    // )
                                  ),
                                  child: Image.network(
                                    data.tvLogo!,
                                    fit: BoxFit.cover,
                                    //opacity:focusNode.hasFocus? const AlwaysStoppedAnimation(.5):const AlwaysStoppedAnimation(1),
                                  )

                                // height: size.height * 0.2,
                                // width: size.width * 0.3,

                                // child: Image.network(
                                //
                                //
                                //   fit: BoxFit.cover,
                                //   color:  Colors.grey.withOpacity(0.2),
                                // ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  data.tvTitle!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      )

                  ],
                )
                // GridView.builder(
                //     itemCount: snapshot.data!.videoStreamingApp!.length,
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 3,
                //         //childAspectRatio: 0.2,
                //         crossAxisSpacing: 2,
                //         mainAxisSpacing: 2),
                //     itemBuilder: (context, index) {
                //       var data = snapshot.data!.videoStreamingApp![index];
                //       return InkWell(
                //         focusColor: Colors.red,
                //         onFocusChange: (vale){
                //
                //         },
                //         onTap: () {
                //           print(data.tvAccess);
                //           if (Playvideo().playvideo(context) == true) {
                //             HttpTvDetails()
                //                 .gettvdetails(tvid: data.tvId.toString())
                //                 .then((value) {
                //               // ExoPlayer().exoplayerbuild(
                //               //     value!.videoStreamingApp!.tvUrl!);
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: ((context) => VideoPlayer2(
                //                             videourl:
                //                                 value!.videoStreamingApp!.tvUrl!,
                //                             // title:
                //                             //     value.videoStreamingApp!.tvTitle!,
                //                           ))));
                //             });
                //           } else if (data.tvAccess == "Free" &&
                //               Playvideo().playvideo(context) == false) {
                //             HttpTvDetails()
                //                 .gettvdetails(tvid: data.tvId.toString())
                //                 .then((value) {
                //               // ExoPlayer().exoplayerbuild(
                //               //     value!.videoStreamingApp!.tvUrl!);
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: ((context) => VideoPlayer2(
                //                             videourl:
                //                                 value!.videoStreamingApp!.tvUrl!,
                //                             // title:
                //                             //     value.videoStreamingApp!.tvTitle!,
                //                           ))));
                //             });
                //           } else {
                //             ShowToastMessage()
                //                 .showsuccess("Choose a membership package");
                //           }
                //
                //           // Navigator.push(
                //           //     context,
                //           //     MaterialPageRoute(
                //           //         builder: ((context) =>
                //           //             TvDetailsPage(tvid: data.tvId.toString()))));
                //           // Navigator.push(
                //           //     context,
                //           //     MaterialPageRoute(
                //           //         builder: ((context) =>  ChewieDemo(url: data.,))));
                //         },
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Container(
                //               height: 250,
                //               decoration: BoxDecoration(
                //                   borderRadius: const BorderRadius.all(Radius.circular(10)),
                //
                //
                //                   image: DecorationImage(
                //                     fit: BoxFit.cover,
                //                     // colorFilter:
                //                     // item[index]?  ColorFilter.mode(Colors.black.withOpacity(0.2),
                //                     //     BlendMode.dstATop): null,
                //                     image:  NetworkImage(
                //                       data.tvLogo!,
                //                     ),
                //                   )
                //               ),
                //
                //               // height: size.height * 0.2,
                //               // width: size.width * 0.3,
                //
                //               // child: Image.network(
                //               //
                //               //
                //               //   fit: BoxFit.cover,
                //               //   color:  Colors.grey.withOpacity(0.2),
                //               // ),
                //             ),
                //             Container(
                //               padding: EdgeInsets.all(5),
                //               child: Text(
                //                 data.tvTitle!,
                //                 maxLines: 1,
                //               ),
                //             )
                //           ],
                //         ),
                //       );
                //     }),
              ),
            );
          } else if (snapshot.hasError) {
            child = Text(snapshot.error.toString());
          } else {
            child = const Center(
              child: CircularProgressIndicator(
                color: color,
              ),
            );
          }
          return child;
        }));
  }
}
