import 'package:flutter/material.dart';

import '../../Http/Genralist/genralist.dart';
import '../../Model/Genralist/genralist.dart';
import '../Movies/moviebygenre.dart';
import '../Movies/movies.dart';

class GenraListPage extends StatefulWidget {
  const GenraListPage({Key? key}) : super(key: key);

  @override
  State<GenraListPage> createState() => _GenraListPageState();
}

class _GenraListPageState extends State<GenraListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Category"),
        ),
        body: FutureBuilder<Genrelist?>(
            future: Httpgenra().getgenralist(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.videoStreamingApp!.length,
                    itemBuilder: ((context, index) {
                      var data = snapshot.data!.videoStreamingApp![index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Scaffold(
                                        backgroundColor: Colors.black,
                                        appBar: AppBar(
                                          title: Text(data.genreName!),
                                        ),
                                        body: MoviesbygenrePage(
                                          genreid: data.genreId.toString(),
                                        ),
                                      ))));
                        },
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(data.genreImage!),
                        ),
                        title: Text(data.genreName!),
                      );
                    }));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })));
  }
}
