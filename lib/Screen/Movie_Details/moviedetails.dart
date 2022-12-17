import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hoichoi_clone_app/Http/Moviedetails/moviedetails.dart';
import 'package:hoichoi_clone_app/Model/MovieDetails/moviedetails.dart';
import 'package:hoichoi_clone_app/Playvideo/playvideo.dart';
import 'package:hoichoi_clone_app/Screen/VideoPlayer/videoplayer.dart';
import 'package:hoichoi_clone_app/Screen/VideoView/videoview.dart';
import 'package:hoichoi_clone_app/Share/share.dart';
import 'package:hoichoi_clone_app/Toast/toast.dart';
import 'package:hoichoi_clone_app/VideoOpen/videoopen.dart';
import 'package:hoichoi_clone_app/constants.dart';

import '../../VideoOpen/videopayer2.dart';

class MovieDetailspage extends StatefulWidget {
  final String movieid, moviename;
  const MovieDetailspage(
      {Key? key, required this.movieid, required this.moviename})
      : super(key: key);

  @override
  State<MovieDetailspage> createState() => _MovieDetailspageState();
}

class _MovieDetailspageState extends State<MovieDetailspage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.moviename),
        ),
        body: FutureBuilder<MovieDetails?>(
            future: HttpMoviedetails().getmoviedetail(movieid: widget.movieid),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          height: 200,
                          width: double.infinity,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                  data!.videoStreamingApp!.movieImage!,
                                  fit: BoxFit.cover),
                              IconButton(
                                focusColor: Colors.grey,

                                  onPressed: () {
                                    if (Playvideo().playvideo(context) ==
                                        true) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => VideoPlayer2(
                                                    videourl: data.videoStreamingApp!
                                                        .videoUrl!,

                                                  ))));
                                    } else if (data.videoStreamingApp!
                                                .movieAccess ==
                                            "Free" &&
                                        Playvideo().playvideo(context) ==
                                            false) {
                                      // ExoPlayer().exoplayerbuild(
                                      //     data.videoStreamingApp!.videoUrl!);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => VideoPlayer2(
                                                    videourl: data.videoStreamingApp!
                                                        .videoUrl!,

                                                  ))));
                                      print(
                                          data.videoStreamingApp!.movieAccess);
                                      print("Buy ANy member SHip package");
                                    } else {
                                      ShowToastMessage().showsuccess(
                                          "Chosse a membership package");
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.play_arrow,
                                    size: 55,
                                    color: color,
                                  ))
                            ],
                          )),
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(

                                      onPressed: () {
                                        NativeShare().share(
                                            data.videoStreamingApp!.shareUrl!);
                                      },
                                      icon: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      ),
                                  focusColor: Colors.grey,
                                  ),

                                ],
                              ),
                            ),
                            // Row(
                            //   children: [
                            //     const Text(
                            //       "DIRECTOR",
                            //       style: const TextStyle(
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //     const SizedBox(
                            //       width: 20,
                            //     ),
                            //     Text(
                            //       "Indranil Roychowdhury",
                            //       style: TextStyle(
                            //           color: Colors.white.withOpacity(0.7)),
                            //     )
                            //   ],
                            // ),
                            // const SizedBox(height: 2),
                            // Row(
                            //   children: [
                            //     const Text("STARRING",
                            //         style: const TextStyle(
                            //             fontWeight: FontWeight.bold)),
                            //     const SizedBox(width: 19),
                            //     Text(
                            //       "Indranil Roychowdhury,Indranil Roychowdhury",
                            //       style: TextStyle(
                            //           color: Colors.white.withOpacity(0.7)),
                            //     )
                            //   ],
                            // ),
                            const SizedBox(height: 7),
                            Html(data: data.videoStreamingApp!.description),
                            const SizedBox(height: 5),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Container(
                            //       padding: const EdgeInsets.all(10),
                            //       decoration: BoxDecoration(
                            //           border: Border.all(color: Colors.white)),
                            //       child: const Text("WATCH TRAILER"),
                            //     )
                            //   ],
                            // ),
                            const SizedBox(height: 10),
                            movielist(
                                name: "Related Movies",
                                movie: data.videoStreamingApp!.relatedMovies)
                            // seasonlist(),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: color),
                );
              }
            })));
  }

  Widget seasonlist() {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 2),
          height: size.height * 0.12,
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                child: Image.asset(
                  'images/1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                        child: const Text(
                      "The standard chunk of Lorem Ipsum",
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(height: 2),
                    Expanded(
                      child: Text(
                        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: const Icon(
                  Icons.download,
                  size: 35,
                  color: Colors.white,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget movielist({String? name, List<RelatedMovie>? movie}) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 5, top: 10, bottom: 5),
          child: Text(
            name!,
            style: const TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          height: 1,
          width: size.width,
          color: Colors.white,
        ),
        const SizedBox(height: 5),
        Container(
          height: size.height * 0.23,
          width: size.width,
          margin: const EdgeInsets.only(left: 5),
          child: ListView.builder(
            itemCount: movie!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var data = movie[index];
              return Container(
                margin: const EdgeInsets.only(right: 10),
                // constraints: BoxConstraints(
                //           maxHeight: 150,
                //           maxWidth: 100
                //         ),
                height: 150,
                width: 100,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailspage(
                              movieid: data.movieId.toString(),
                              moviename: data.movieTitle!),
                        ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        width: 100,
                        // height: size.height * 0.2,
                        // width: size.width * 0.3,
                        margin: const EdgeInsets.only(right: 2),
                        child: Image.network(
                          data.moviePoster!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        data.movieTitle!,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
