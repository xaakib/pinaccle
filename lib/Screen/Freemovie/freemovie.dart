import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/Freemovie/freemovie.dart';
import 'package:hoichoi_clone_app/Model/Freemovie/freemovie.dart';
import 'package:hoichoi_clone_app/Playvideo/playvideo.dart';
import 'package:hoichoi_clone_app/Screen/Movie_Details/moviedetails.dart';
import 'package:hoichoi_clone_app/constants.dart';

class FreemoviePage extends StatefulWidget {
  const FreemoviePage({Key? key}) : super(key: key);

  @override
  State<FreemoviePage> createState() => _FreemoviePageState();
}

class _FreemoviePageState extends State<FreemoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Free Movie"),
      ),
      body: movielist(),
    );
  }

  Widget movielist() {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<Freemovie?>(
        future: HttpFreemovie().getfreemovie(),
        builder: ((context, snapshot) {
          Widget child;
          if (snapshot.hasData) {
            child = GridView.builder(
                itemCount: snapshot.data!.freeMovies!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  var data = snapshot.data!.freeMovies![index];
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => MovieDetailspage(
                      //           movieid: data.movieId.toString(),
                      //           moviename: data.movieTitle!),
                      //     ));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailspage(
                                movieid: data.id.toString(),
                                moviename: data.videoTitle!),
                          ));
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 180,
                            // height: size.height * 0.2,
                            // width: size.width * 0.3,
                            margin: EdgeInsets.all(5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                snapshot.data!.imageVideoUrl! +
                                    "/${data.videoImage}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            data.videoTitle!,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            child = Text(snapshot.error.toString());
          } else {
            child = Center(
              child: CircularProgressIndicator(color: color),
            );
          }
          return child;
        }));
  }
}
