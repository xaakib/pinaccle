import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/Search/search.dart';
import 'package:hoichoi_clone_app/Http/Tvdetails/tvdetails.dart';
import 'package:hoichoi_clone_app/Model/SearchResult/searchresult.dart';
import 'package:hoichoi_clone_app/Playvideo/playvideo.dart';
import 'package:hoichoi_clone_app/Screen/Movie_Details/moviedetails.dart';
import 'package:hoichoi_clone_app/Screen/SeriesDetails/seriesdetails.dart';
import 'package:hoichoi_clone_app/VideoOpen/videoopen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchtext = TextEditingController();

  Future<SearchResult?>? searchresult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          textInputAction: TextInputAction.search,
          controller: searchtext,
          onFieldSubmitted: (value) {
            setState(() {
              searchresult = HttpSearch().getsearchresult(search: value);
            });
          },
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.grey[800],
            hintText: "Search Movie",
            hintStyle: const TextStyle(color: Colors.white),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
          ),
        ),
      ),
      body: FutureBuilder<SearchResult?>(
          future: searchresult,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  movie(snapshot.data!.videoStreamingApp!.movies),
                  // show(snapshot.data!.videoStreamingApp!.shows),
                  // tv(snapshot.data!.videoStreamingApp!.liveTv)
                ],
              );
            } else {
              return Center(
                child: Container(),
              );
            }
          })),
    );
  }

  Widget movie(List<Movie>? movies) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5, top: 10, bottom: 5),
            child: const Text(
              "Movie",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red, fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            height: 1,
            width: size.width,
            color: Colors.red,
          ),
          const SizedBox(height: 5),
          movies!.isEmpty
              ? Container()
              : GridView.builder(
                  itemCount: movies.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.57,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    var data = movies[index];
                    return InkWell(
                      onTap: () {
                        if (Playvideo().playvideo(context) == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailspage(
                                    movieid: data.movieId.toString(),
                                    moviename: data.movieTitle!),
                              ));
                        } else if (data.movieAccess
                                    .toString()
                                    .split('.')
                                    .last ==
                                "FREE" &&
                            Playvideo().playvideo(context) == false) {
                          print(data.movieAccess.toString().split('.').last);
                          print("Buy ANy member SHip package");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailspage(
                                    movieid: data.movieId.toString(),
                                    moviename: data.movieTitle!),
                              ));
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 180,
                            // height: size.height * 0.2,
                            // width: size.width * 0.3,
                            margin: const EdgeInsets.only(right: 2),
                            child: Image.network(
                              data.moviePoster!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              data.movieTitle!,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    );
                  })
        ],
      ),
    );
  }

  Widget show(List<Show>? shows) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5, top: 10, bottom: 5),
            child: const Text(
              "Shows",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red, fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            height: 1,
            width: size.width,
            color: Colors.red,
          ),
          shows!.isEmpty
              ? Container()
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: shows.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.57,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    var data = shows[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeriesDetailspage(
                                  showid: data.showId.toString(),
                                  showname: data.showTitle!),
                            ));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 180,
                            // height: size.height * 0.2,
                            // width: size.width * 0.3,
                            margin: const EdgeInsets.only(right: 2),
                            child: Image.network(
                              data.showPoster!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              data.showTitle!,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    );
                  })
        ],
      ),
    );
  }

  Widget tv(List<LiveTv>? liveTv) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5, top: 10, bottom: 5),
            child: const Text(
              "Tv",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red, fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            height: 1,
            width: size.width,
            color: Colors.red,
          ),
          liveTv!.isEmpty
              ? Container()
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: liveTv.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.57,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    var data = liveTv[index];
                    return InkWell(
                      onTap: () {
                        print(data.tvAccess);
                        if (Playvideo().playvideo(context) == true) {
                          HttpTvDetails()
                              .gettvdetails(tvid: data.tvId.toString())
                              .then((value) {
                            ExoPlayer().exoplayerbuild(
                                value!.videoStreamingApp!.tvUrl!);
                          });
                        } else if (data.tvAccess == "Free" &&
                            Playvideo().playvideo(context) == false) {
                          HttpTvDetails()
                              .gettvdetails(tvid: data.tvId.toString())
                              .then((value) {
                            ExoPlayer().exoplayerbuild(
                                value!.videoStreamingApp!.tvUrl!);
                          });
                        }
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) =>
                        //             TvDetailsPage(tvid: data.tvId.toString()))));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) =>  ChewieDemo(url: data.,))));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 180,
                            // height: size.height * 0.2,
                            // width: size.width * 0.3,
                            margin: const EdgeInsets.only(right: 2),
                            child: Image.network(
                              data.tvLogo!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              data.tvTitle!,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    );
                  })
        ],
      ),
    );
  }
}
