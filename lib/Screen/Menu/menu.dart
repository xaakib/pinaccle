import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoichoi_clone_app/Form/Welcome/welcome_screen.dart';
import 'package:hoichoi_clone_app/Screen/AboutUS/aboutus.dart';
import 'package:hoichoi_clone_app/Screen/Contactus/contactus.dart';
import 'package:hoichoi_clone_app/Screen/Download/download.dart';
import 'package:hoichoi_clone_app/Screen/Faq/faq.dart';
import 'package:hoichoi_clone_app/Screen/Freemovie/freemovie.dart';
import 'package:hoichoi_clone_app/Screen/Genre/genre.dart';
import 'package:hoichoi_clone_app/Screen/History/history.dart';
import 'package:hoichoi_clone_app/Screen/Language/language.dart';
import 'package:hoichoi_clone_app/Screen/Setting/setting.dart';
import 'package:hoichoi_clone_app/Screen/SubscriptionPlan/subscriptionplan.dart';
import 'package:hoichoi_clone_app/Screen/Termscondition/terms.dart';
import 'package:hoichoi_clone_app/Screen/privecy_Policy/privacy_policy.dart';

import '../GenraList/genralist.dart';
import '../Notification/notification.dart';

class Menupage extends StatefulWidget {
  const Menupage({Key? key}) : super(key: key);

  @override
  State<Menupage> createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('data');
    return SingleChildScrollView(
      child: Column(
        children: [
          menu(
              name: "ALL CATEGORY",
              imagepath: "images/genre.png",
              onTap: () {
                redirectpage(GenraListPage());
              }),
          menu(
              name: "FREE MOVIE",
              imagepath: "images/free.png",
              onTap: () {
                redirectpage(FreemoviePage());
              }),

          // // menu(name: "UPCOMING", imagepath: "images/upcoming.png"),
          menu(
              name: "Notification",
              imagepath: "images/language.png",
              onTap: () {
                redirectpage(Notificationpage());
              }),
          menu(
              name: "ABOUT US",
              imagepath: "images/information.png",
              onTap: () {
                redirectpage(AboutUsPage());
              }),
          // menu(name: "WATCHLIST", imagepath: "images/book-mark.png"),
          menu(
              name: "HISTORY",
              imagepath: "images/history.png",
              onTap: () {
                redirectpage(Historypage());
              }),
          menu(
              name: "SETTING",
              imagepath: "images/settings.png",
              onTap: () {
                redirectpage(SettingPage());
              }),
          menu(
              name: "TERMS OF SERVICE",
              imagepath: "images/audit.png",
              onTap: () {
                redirectpage(TermsPage());
              }),
          menu(
              name: "PRIVACY POLICY",
              imagepath: "images/shield.png",
              onTap: () {
                redirectpage(PrivecyPolicyPage());
              }),
          menu(
              name: "CONTACT US",
              imagepath: "images/contact-book.png",
              onTap: () {
                redirectpage(ContactUsPage());
              }),
          menu(
              name: "FAQ",
              imagepath: "images/information(1).png",
              onTap: () {
                redirectpage(FaqPage());
              }),
          menu(
              name: "SUBSCRIPTION",
              imagepath: "images/gift.png",
              onTap: () {
                redirectpage(SubscriptionPlanPage());
              }),
          menu(
              name: "LOGOUT",
              imagepath: "assets/icons/power-off.png",
              onTap: () {
                box.clear();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: ((context) => WelcomeScreen())),
                    (route) => false);
              }),

          // menu(
          //     name: "Download",
          //     imagepath: "images/language.png",
          //     onTap: () {
          //       redirectpage(DownloadPage());
          //     }),
        ],
      ),
    );
  }

  Widget menu({String? name, String? imagepath, GestureTapCallback? onTap}) {
    return InkWell(
      focusColor: Colors.grey,
      onFocusChange: (a){},
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10, left: 10),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(
                imagepath!,
                height: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Text(
              name!,
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }

  Widget login() {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // InkWell(
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) {
        //           return LoginScreen();
        //         },
        //       ),
        //     );
        //   },
        //   child: Container(
        //     margin: EdgeInsets.only(left: 10, right: 10),
        //     alignment: Alignment.center,
        //     width: size.width,
        //     height: 50,
        //     child: Text("LOGIN"),
        //     decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        //   ),
        // ),
        SizedBox(height: 5),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SubscriptionPlanPage();
                },
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            width: size.width,
            height: 50,
            child: Text(
              "SUBSCRIBE",
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
                color: Colors.red, border: Border.all(color: Colors.red)),
          ),
        ),
      ],
    );
  }

  void redirectpage(Widget pagename) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pagename,
        ));
  }
}
