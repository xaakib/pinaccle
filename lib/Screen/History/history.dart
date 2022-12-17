import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/History/history.dart';
import 'package:hoichoi_clone_app/Model/History/history.dart';
import 'package:hoichoi_clone_app/Screen/Movie_Details/moviedetails.dart';
import 'package:hoichoi_clone_app/Screen/SeriesDetails/seriesdetails.dart';
import 'package:hoichoi_clone_app/constants.dart';

class Historypage extends StatefulWidget {
  const Historypage({Key? key}) : super(key: key);

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: movielist(),
    );
  }

  Widget movielist() {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<History?>(
        future: HttpHistory().gethistory(),
        builder: ((context, snapshot) {
          Widget child;
          if (snapshot.hasData) {
            String imageurl = snapshot.data!.imageVideoUrl!;
            child = Container(
              margin: EdgeInsets.all(10),
              child: GridView.builder(
                  itemCount: snapshot.data!.history!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.58,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.history![index];
                    return InkWell(
                      onTap: () {
                        if (data.videoType == "Movies") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailspage(
                                    movieid: data.videoId!.toString(),
                                    moviename: data.videoTitle!),
                              ));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SeriesDetailspage(
                                    showid: data.videoId!.toString(),
                                    showname: data.videoTitle!),
                              ));
                        }
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => MovieDetailspage(
                        //           movieid: data.movieId.toString(),
                        //           moviename: data.movieTitle!),
                        //     ));
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
                                  "${imageurl}/${data.videoImage!}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                data.videoTitle!,
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
            child = Center(
              child: CircularProgressIndicator(color: color),
            );
          }
          return child;
        }));
  }
}
