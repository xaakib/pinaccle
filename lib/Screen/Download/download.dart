import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Db/Dbinit/dbinit.dart';
import 'package:hoichoi_clone_app/Db/Practice/practicemodel.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Download"),
      ),
      body: FutureBuilder<List<DownloadSave>?>(
        future: Dbinit().getdownloadmovie(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  var data = snapshot.data![index];
                  return Container(
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Image.network(data.thumbnail!),
                        ),
                        Text(data.proccess!)
                      ],
                    ),
                  );
                }));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
