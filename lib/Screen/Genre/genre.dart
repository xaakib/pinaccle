import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/Genre/genre.dart';
import 'package:hoichoi_clone_app/Model/Genre/genre.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({Key? key}) : super(key: key);

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genre"),
      ),
      body: genre(),
    );
  }

  Widget genre() {
    return FutureBuilder<Genre?>(
        future: HttpGenre().getgenre(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.videoStreamingApp!.length,
                itemBuilder: ((context, index) {
                  var data = snapshot.data!.videoStreamingApp![index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                            height: 45,
                            width: 45,
                            child: Image.network(
                              data.genreImage!,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(width: 10),
                        Text(
                          data.genreName!,
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  );
                }));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
