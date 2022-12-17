import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/Language/language.dart';
import 'package:hoichoi_clone_app/Model/Language/language.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  int pagechangeindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language"),
      ),
      body: Container(
        child: languagelist(),
      ),
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

  Widget languagelist() {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<Language?>(
        future: HttpLanguage().getlanguage(),
        builder: ((context, snapshot) {
          Widget child;
          if (snapshot.hasData) {
            child = GridView.builder(
                itemCount: snapshot.data!.videoStreamingApp!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  var data = snapshot.data!.videoStreamingApp![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        // height: size.height * 0.2,
                        // width: size.width * 0.3,
                        margin: EdgeInsets.only(right: 2),
                        child: Image.network(
                          data.languageImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        data.languageName!,
                        maxLines: 1,
                      )
                    ],
                  );
                });
          } else if (snapshot.hasError) {
            child = Text(snapshot.error.toString());
          } else {
            child = Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          return child;
        }));
  }
}
