import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hoichoi_clone_app/Http/Allpages/allpages.dart';
import 'package:hoichoi_clone_app/Http/Homepage/homepage.dart';
import 'package:hoichoi_clone_app/Http/PAymentSetting/paymentsetting.dart';
import 'package:hoichoi_clone_app/Http/Userplan/userplan.dart';
import 'package:hoichoi_clone_app/Model/homepage/homepage.dart';
import 'package:hoichoi_clone_app/Playvideo/playvideo.dart';
import 'package:hoichoi_clone_app/Provider/allpages.dart';
import 'package:hoichoi_clone_app/Provider/paymentsetting.dart';
import 'package:hoichoi_clone_app/Provider/userplan.dart';
import 'package:hoichoi_clone_app/Screen/Movie_Details/moviedetails.dart';
import 'package:hoichoi_clone_app/Screen/SeriesDetails/seriesdetails.dart';
import 'package:hoichoi_clone_app/Toast/toast.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:provider/provider.dart';

import '../../Form/Welcome/welcome_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pagechangeindex = 0;
  var box = Hive.box('data');

  @override
  void initState() {
    // HttpAllpages().getallpages();
    // HttpUserplan().getuserplan();
    // HttpPaymentSetting().getpaymentsetting();

    Provider.of<UserplanProvider>(context, listen: false).getuserplan();
    Provider.of<PaymentSettingProvider>(context, listen: false)
        .getpaymentsetting();
    Provider.of<AllpageProvider>(context, listen: false).getallpage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Homepagemovie?>(
        future: HttpHomepage().gethomepagemovie(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.videoStreamingApp;
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    imageslider(data),
                    movielist(name: "Latest movie", movie: data!.latestMovies!),
                    serieslist(name: "Latest shows", series: data.latestShows),
                    serieslist(
                        name: "Popular shows", series: data.popularShows),
                    movielist(
                        name: "Popular movies", movie: data.popularMovies),

                    // movielist(
                    //     name: "ENGLISH MOVIES", movie: data.homeSections3),
                    // serieslist(
                    //     name: "HINDI SERIES", series: data.homeSections4),
                    // movielist(name: "HINDI MOVIES", movie: []),
                    // movielist(name: "BANGLADESH TOP 10"),
                    // movielist(name: "INSPIRING BIOPICS"),
                    // movielist(name: "SHADES OF JAYA AHSAN")
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: color,
              ),
            );
          }
        }));
  }

  Widget imageslider(VideoStreamingApp? data) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // PageView.builder(
          //   onPageChanged: (value) {
          //     setState(() {
          //       pagechangeindex = value;
          //     });
          //   },
          //   itemCount: data!.slider!.length,
          //   itemBuilder: (context, index) {
          //     var slide = data.slider![index];
          //     return InkWell(
          //       onTap: () {
          //         if (slide.sliderType == "Shows") {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => SeriesDetailspage(
          //                     showid: slide.sliderPostId!.toString(),
          //                     showname: slide.sliderTitle!),
          //               ));
          //         } else {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => MovieDetailspage(
          //                     movieid: slide.sliderPostId!.toString(),
          //                     moviename: slide.sliderTitle!),
          //               ));
          //         }
          //       },
          //       child: Container(
          //         child: CachedNetworkImage(
          //           imageUrl: slide.sliderImage!,
          //           fit: BoxFit.cover,
          //           placeholder: (context, url) => Center(
          //               child: CircularProgressIndicator(
          //             color: Colors.red,
          //           )),
          //           errorWidget: (context, url, error) => Icon(Icons.error),
          //         ),
          //       ),
          //     );
          //   },
          // ),
          CarouselSlider(
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      pagechangeindex = index;
                    });
                  },
                  autoPlayInterval: Duration(seconds: 5),
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  aspectRatio: 0.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  height: 220),
              items: List<Widget>.generate(data!.slider!.length, (index) {
                var slide = data.slider![index];
                return InkWell(
                  onTap: () {
                    if (slide.sliderType == "Shows") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => box.get('userid') == null
                                ? WelcomeScreen()
                                : SeriesDetailspage(
                                    showid: slide.sliderPostId!.toString(),
                                    showname: slide.sliderTitle!),
                          ));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => box.get('userid') == null
                                ? WelcomeScreen()
                                : MovieDetailspage(
                                    movieid: slide.sliderPostId!.toString(),
                                    moviename: slide.sliderTitle!),
                          ));
                    }
                  },
                  child: Container(
                    child: CachedNetworkImage(
                      imageUrl: slide.sliderImage!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        color: Colors.red,
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                );
              })),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  data.slider!.length,
                  (index) => Container(
                        margin: EdgeInsets.only(right: 6),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color:
                                pagechangeindex == index ? color : Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                      )),
            ),
          )
        ],
      ),
    );
  }

  Widget movielist({String? name, List<HomeSections3>? movie}) {
    Size size = MediaQuery.of(context).size;
    final FocusNode focusNode = FocusNode();
List<bool> focus = [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 5, top: 10, bottom: 5),
          child: Text(
            name!,
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          height: 1,
          width: size.width,
          color: Colors.white,
        ),
        SizedBox(height: 5),
        Container(
          height: 180,
          width: size.width,
          margin: EdgeInsets.only(left: 5),
          child: ListView.builder(
            itemCount: movie!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {

              var data = movie[index];
              return Container(
                margin: EdgeInsets.only(right: 10),
                // constraints: BoxConstraints(
                //           maxHeight: 150,
                //           maxWidth: 100
                //         ),
                height: 160,
                width: 100,
                child: InkWell(
                  onFocusChange: (value){

                  },
                  focusColor: Colors.red,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height:  150,
                        width: 100,
                        // height: size.height * 0.2,
                        // width: size.width * 0.3,
                        margin: EdgeInsets.only(right: 2),
                        child: Image.network(
                          data.moviePoster!,
                          fit: BoxFit.cover,
                          //opacity:focusNode.hasFocus? const AlwaysStoppedAnimation(.5):const AlwaysStoppedAnimation(1),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          data.movieTitle!,
                          overflow: TextOverflow.ellipsis,
                        ),
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

  Widget serieslist({String? name, List<dynamic>? series}) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 5, top: 10, bottom: 5),
          child: Text(
            name!,
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          height: 1,
          width: size.width,
          color: Colors.white,
        ),
        SizedBox(height: 5),
        Container(
          height: 180,
          width: size.width,
          margin: EdgeInsets.only(left: 5),
          child: ListView.builder(
            itemCount: series!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var data = series[index];
              return Container(
                margin: EdgeInsets.only(right: 10),
                height: 160,
                width: 100,
                child: InkWell(
                  focusColor: Colors.red,
                  onFocusChange: (value){

                  },
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => box.get('userid') == null
                              ? WelcomeScreen()
                              : SeriesDetailspage(
                                  showid: data.showId.toString(),
                                  showname: data.showTitle!),
                        ));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => box.get('userid') == null
                    //           ? WelcomeScreen()
                    //           : MovieDetailspage(
                    //               movieid: data.showId.toString(),
                    //               moviename: data.showTitle!),
                    //     ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        width: 250,
                        // height: size.height * 0.2,
                        // width: size.width * 0.3,
                        margin: EdgeInsets.only(right: 2),
                        child: Image.network(
                          data.showPoster!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          data.showTitle!,
                          overflow: TextOverflow.ellipsis,
                        ),
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
