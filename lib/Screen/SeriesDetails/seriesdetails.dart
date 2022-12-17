import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hoichoi_clone_app/Http/Showdetails/showdetails.dart';
import 'package:hoichoi_clone_app/Model/Episode/episode.dart';
import 'package:hoichoi_clone_app/Model/ShowDetails/showdetails.dart';
import 'package:hoichoi_clone_app/Screen/SeriesDetails/episode.dart';
import 'package:hoichoi_clone_app/Share/share.dart';
import 'package:hoichoi_clone_app/VideoOpen/videoopen.dart';
import 'package:hoichoi_clone_app/constants.dart';

class SeriesDetailspage extends StatefulWidget {
  final String showid, showname;
  const SeriesDetailspage(
      {Key? key, required this.showid, required this.showname})
      : super(key: key);

  @override
  State<SeriesDetailspage> createState() => _SeriesDetailspageState();
}

class _SeriesDetailspageState extends State<SeriesDetailspage> {
  int? seasonid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.showname),
        ),
        body: FutureBuilder<ShowDetails?>(
            future: HttpShowdetails().getshowdetails(showid: widget.showid),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                if (seasonid == null &&
                    snapshot.data!.videoStreamingApp!.seasonList!.isNotEmpty) {
                  seasonid = snapshot
                      .data!.videoStreamingApp!.seasonList!.first.seasonId;
                }
                var data = snapshot.data!.videoStreamingApp;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.network(data!.showPoster!),
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
                                        NativeShare().share(data.shareUrl!);
                                      },
                                      icon: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      ),
                                  focusColor: Colors.grey,
                                  )
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
                            Text(
                              data.showInfo!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  color: Colors.grey[900],
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        value: seasonid,
                                        dropdownColor: Colors.black,
                                        items: List.generate(
                                            data.seasonList!.length, (index) {
                                          var data2 = data.seasonList![index];
                                          return DropdownMenuItem(
                                            onTap: () {
                                              setState(() {
                                                seasonid = data2.seasonId;
                                              });
                                            },
                                            child: Text(data2.seasonName!),
                                            value: data2.seasonId,
                                          );
                                        }),
                                        onChanged: (value) {}),
                                  ),
                                )
                              ],
                            ),
                            seasonlist(),
                            movielist(
                                name: "Related Shows",
                                relatedShows: data.relatedShows),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: color,
                  ),
                );
              }
            })));
  }

  Widget seasonlist() {
    return FutureBuilder<Allepisode?>(
        future: HttpShowdetails().getshowepisode(seasonid: seasonid.toString()),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data!.videoStreamingApp!.length,
              itemBuilder: (context, index) {
                var data2 = data.videoStreamingApp![index];
                return EpisodePage(data2: data2);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: color,
              ),
            );
          }
        }));
  }

  Widget movielist({String? name, List<RelatedShow>? relatedShows}) {
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
            itemCount: relatedShows!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var data = relatedShows[index];
              return Container(
                margin: const EdgeInsets.only(right: 10),
                // constraints: BoxConstraints(
                //           maxHeight: 150,
                //           maxWidth: 100
                //         ),
                height: 150,
                width: 100,
                child: InkWell(
                  focusColor: Colors.red,
                  onFocusChange: (v){

                  },
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeriesDetailspage(
                            showid: data.showId.toString(),
                            showname: data.showTitle!,
                          ),
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
                          data.showPoster!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        data.showTitle!,
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
