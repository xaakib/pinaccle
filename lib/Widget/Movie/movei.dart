import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {
  final String name;
  const MovieList({Key? key, required this.name}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 5, top: 10, bottom: 5),
          child: Text(
            widget.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          height: 1,
          width: size.width,
          color: Colors.black,
        ),
        SizedBox(height: 5),
        Container(
          height: size.height * 0.23,
          width: size.width,
          margin: EdgeInsets.only(left: 5),
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.2,
                    width: size.width * 0.3,
                    margin: EdgeInsets.only(right: 2),
                    child: Image.asset('images/1.jpg'),
                  ),
                  Text("Srijit Mukherji")
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
