// import 'package:flutter/material.dart';

// class Sliderpage extends StatefulWidget {
//   const Sliderpage({Key? key}) : super(key: key);

//   @override
//   State<Sliderpage> createState() => _SliderpageState();
// }

// class _SliderpageState extends State<Sliderpage> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height * 0.25,
//       width: size.width,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           PageView.builder(
//             onPageChanged: (value) {
//               setState(() {
//                 pagechangeindex = value;
//               });
//             },
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return Container(
//                 child: Image.asset(
//                   'images/1.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               );
//             },
//           ),
//           Container(
//             padding: EdgeInsets.only(bottom: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                   5,
//                   (index) => Container(
//                         margin: EdgeInsets.only(right: 6),
//                         height: 10,
//                         width: 10,
//                         decoration: BoxDecoration(
//                             color: pagechangeindex == index
//                                 ? Colors.red
//                                 : Colors.white,
//                             borderRadius: BorderRadius.circular(100)),
//                       )),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
