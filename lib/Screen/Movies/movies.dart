import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hoichoi_clone_app/Http/Movies/movies.dart';
import 'package:hoichoi_clone_app/Model/Movies/movies.dart';
import 'package:hoichoi_clone_app/Playvideo/playvideo.dart';
import 'package:hoichoi_clone_app/Screen/Movie_Details/moviedetails.dart';
import 'package:hoichoi_clone_app/Screen/VideoView/videoview.dart';
import 'package:hoichoi_clone_app/Toast/toast.dart';
import 'package:hoichoi_clone_app/constants.dart';

import '../../Form/Welcome/welcome_screen.dart';
import '../../Http/Movie_genre/movie_genre.dart';

class MoviesPage extends StatefulWidget {
  final String genreid;
  const MoviesPage({Key? key, required this.genreid}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  int pagechangeindex = 0;
  var box = Hive.box('data');

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: movielist(),
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
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,
                  (index) => Container(
                        margin: EdgeInsets.only(right: 6),
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

  Widget movielist() {
    Size size = MediaQuery.of(context).size;

    List item =[];
    return FutureBuilder<Movies?>(
        future: Httpmoviegenre().getmovie(genreid: widget.genreid),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => box.get('userid') == null
                            ? WelcomeScreen()
                            : MovieDetailspage(
                            movieid: data.movieId.toString(),
                            moviename: data.movieTitle!),
                      ));
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
                            data.moviePoster!,
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
                          data.movieTitle!,
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
                //         crossAxisCount: 4,
                //         childAspectRatio: 0.9,
                //         crossAxisSpacing: 2,
                //         mainAxisSpacing: 1),
                //     itemBuilder: (context, index) {
                //       var data = snapshot.data!.videoStreamingApp![index];
                //
                //       return InkWell(
                //         focusColor: Colors.red,
                //         onFocusChange: (vale){
                //
                //         },
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => box.get('userid') == null
                //                     ? WelcomeScreen()
                //                     : MovieDetailspage(
                //                         movieid: data.movieId.toString(),
                //                         moviename: data.movieTitle!),
                //               ));
                //         },
                //         child: Container(
                //           height: 180,
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Container(
                //                 height: 150,
                //                 width: MediaQuery.of(context).size.width*0.24,
                //                 decoration: BoxDecoration(
                //                   color: Colors.grey,
                //                   borderRadius: const BorderRadius.all(Radius.circular(10)),
                //
                //
                //                   image: DecorationImage(
                //                     fit: BoxFit.cover,
                //                     // colorFilter:
                //                     // item[index]?  ColorFilter.mode(Colors.black.withOpacity(0.2),
                //                     //     BlendMode.dstATop): null,
                //                     image:  NetworkImage(
                //                         data.moviePoster!,
                //                     ),
                //                   )
                //                 ),
                //
                //                 // height: size.height * 0.2,
                //                 // width: size.width * 0.3,
                //
                //                 // child: Image.network(
                //                 //
                //                 //
                //                 //   fit: BoxFit.cover,
                //                 //   color:  Colors.grey.withOpacity(0.2),
                //                 // ),
                //               ),
                //               Container(
                //                 padding: EdgeInsets.all(5),
                //                 child: Text(
                //                   data.movieTitle!,
                //                   maxLines: 1,
                //                   overflow: TextOverflow.ellipsis,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       );
                //     }),
              ),
            );
          } else if (snapshot.hasError) {
            child = Center(child: Text(snapshot.error.toString()));
          } else {
            child = const Center(
              child: CircularProgressIndicator(color: color),
            );
          }
          return child;
        }));
  }
}
