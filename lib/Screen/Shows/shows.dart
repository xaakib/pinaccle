import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/Shows/shows.dart';
import 'package:hoichoi_clone_app/Model/Shows/shows.dart';
import 'package:hoichoi_clone_app/Screen/SeriesDetails/seriesdetails.dart';
import 'package:hoichoi_clone_app/constants.dart';

import '../../Http/Movie_genre/movie_genre.dart';
import '../../Model/Movies/movies.dart';

class ShowsPage extends StatefulWidget {
  final String genreid;
  const ShowsPage({Key? key, required this.genreid}) : super(key: key);

  @override
  State<ShowsPage> createState() => _ShowsPageState();
}

class _ShowsPageState extends State<ShowsPage> {
  int pagechangeindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showlist(),
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

  Widget showlist() {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<Shows?>(
        future: Httpshow().getshows(),
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
                                builder: (context) => SeriesDetailspage(
                                    showid: data.showId.toString(),
                                    showname: data.showTitle!),
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
                                    data.showPoster!,
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
                                  data.showTitle!,
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
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => SeriesDetailspage(
                //                     showid: data.showId.toString(),
                //                     showname: data.showTitle!),
                //               ));
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
                //                       data.showPoster!,
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
                //                 data.showTitle!,
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
            child = Center(
              child: CircularProgressIndicator(
                color: color,
              ),
            );
          }
          return child;
        }));
  }

  // Widget movielist({String? name}) {
  //   Size size = MediaQuery.of(context).size;
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         padding: EdgeInsets.only(left: 5, top: 10, bottom: 5),
  //         child: Text(
  //           name!,
  //           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
  //         ),
  //       ),
  //       Container(
  //         margin: EdgeInsets.only(left: 5, right: 5),
  //         height: 1,
  //         width: size.width,
  //         color: Colors.white,
  //       ),
  //       SizedBox(height: 5),
  //       Container(
  //         height: size.height * 0.23,
  //         width: size.width,
  //         margin: EdgeInsets.only(left: 5),
  //         child: ListView.builder(
  //           itemCount: 10,
  //           scrollDirection: Axis.horizontal,
  //           itemBuilder: (context, index) {
  //             return Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   height: size.height * 0.2,
  //                   width: size.width * 0.3,
  //                   margin: EdgeInsets.only(right: 2),
  //                   child: Image.asset('images/1.jpg'),
  //                 ),
  //                 Text("Srijit Mukherji")
  //               ],
  //             );
  //           },
  //         ),
  //       )
  //     ],
  //   );
  // }
}
