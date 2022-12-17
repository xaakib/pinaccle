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

class MoviesbygenrePage extends StatefulWidget {
  final String genreid;
  const MoviesbygenrePage({Key? key, required this.genreid}) : super(key: key);

  @override
  State<MoviesbygenrePage> createState() => _MoviesbygenrePageState();
}

class _MoviesbygenrePageState extends State<MoviesbygenrePage> {
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
    return FutureBuilder<Movies?>(
        future: Httpmoviegenre().getmoviebygenre(genreid: widget.genreid),
        builder: ((context, snapshot) {
          Widget child;
          if (snapshot.hasData) {
            child = Container(
              margin: EdgeInsets.all(10),
              child: GridView.builder(
                  itemCount: snapshot.data!.videoStreamingApp!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.58,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.videoStreamingApp![index];
                    return InkWell(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 180,
                              // height: size.height * 0.2,
                              // width: size.width * 0.3,

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  data.moviePoster!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                data.movieTitle!,
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            child = Text(snapshot.error.toString());
          } else {
            child = const Center(
              child: CircularProgressIndicator(color: color),
            );
          }
          return child;
        }));
  }
}
