import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:line_icons/line_icons.dart';

class NavbarPage extends StatefulWidget {
  final Function indexchange;
  const NavbarPage({Key? key, required this.indexchange}) : super(key: key);

  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  index = 0;
                  widget.indexchange(0);
                });
              },
              child: IconButton(
                focusColor: Colors.grey,
                onPressed: (){
                  setState(() {
                    index = 0;
                    widget.indexchange(0);
                  });
                },
                icon: Column(
                  children: [
                    Expanded(
                      child: Icon(
                        LineIcons.home,
                        color: index == 0 ? color : Colors.white,
                      ),
                    ),
                   SizedBox(height: 5),
                    Expanded(
                      child: Text(
                        "Home",
                        style: TextStyle(
                          color: index == 0 ? color : Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  index = 1;
                  widget.indexchange(1);
                });
              },
              child: IconButton(
                focusColor: Colors.grey,
                onPressed: (){
                  setState(() {
                    index = 1;
                    widget.indexchange(1);
                  });
                },
                icon: Column(
                  children: [
                    Expanded(
                      child: Icon(
                        LineIcons.television,
                        color: index == 1 ? color : Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    
                    Expanded(
                      child: Text(
                        "Movies",
                        style: TextStyle(
                          color: index == 1 ? color : Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  index = 2;
                  widget.indexchange(2);
                });
              },
              child: 
              
              IconButton(
                focusColor: Colors.grey,
                onPressed:(){
                  setState(() {
                    index = 2;
                    widget.indexchange(2);
                  });
                } ,
                icon: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'images/film-reel.png',
                        height: 22,
                        color: index == 2 ? color : Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),

                    Expanded(
                      child: Text(
                        "Series",
                        style: TextStyle(
                          color: index == 2 ? color : Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  index = 3;
                  widget.indexchange(3);
                });
              },
              child:
              IconButton(
                focusColor: Colors.grey,
                onPressed: (){
                  setState(() {
                    index = 3;
                    widget.indexchange(3);
                  });
                },
                icon: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'images/film-reel.png',
                        height: 22,
                        color: index == 3 ? color : Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),

                    Expanded(
                      child: Text(
                        "Live Tv",
                        style: TextStyle(
                          color: index == 3 ? color : Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  index = 4;
                  widget.indexchange(4);
                });
              },
              child:

              IconButton(
                focusColor: Colors.grey,
                onPressed: (){
                  setState(() {
                    index = 4;
                    widget.indexchange(4);
                  });
                },
                icon: Column(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.menu,
                        color: index == 4 ? color : Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),

                    Expanded(
                      child: Text(
                        "Menu",
                        style: TextStyle(
                          color: index == 4 ? color : Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
