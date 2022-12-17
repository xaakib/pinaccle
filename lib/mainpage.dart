import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hoichoi_clone_app/Provider/appdetails.dart';
import 'package:hoichoi_clone_app/Screen/Homepage/homepage.dart';
import 'package:hoichoi_clone_app/Screen/Menu/menu.dart';
import 'package:hoichoi_clone_app/Screen/Movies/movies.dart';
import 'package:hoichoi_clone_app/Screen/Search/search.dart';
import 'package:provider/provider.dart';
import 'Form/Welcome/welcome_screen.dart';
import 'Screen/Notification/notification.dart';
import 'Screen/Shows/shows.dart';
import 'Screen/Tv/tv.dart';
import 'Widget/Nav_bar/navbuttombar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();
//  FocusScopeNode notify = FocusScopeNode();
  String name = "";
  var box = Hive.box('data');

  bool loading = false;
  bool focues = false;
  bool notify = false;


  @override
  void initState() {
    loading = true;
    Provider.of<Appdetailsprovidr>(context, listen: false)
        .getappdetails()
        .then((value) {
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final appdetails = Provider.of<Appdetailsprovidr>(context);
    return loading
        ? const Center(child: CircularProgressIndicator(color: Colors.red))
        : Scaffold(
            bottomNavigationBar: SafeArea(
              bottom: true,
              child: Container(
                height: 60,
                child: Column(
                  children: [
                    NavbarPage(
                      indexchange: (value) {
                        pageController.animateToPage(value,
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeIn);
                        if (value == 0) {
                          setState(() {
                            name = "";
                          });
                        } else if (value == 1) {
                          setState(() {
                            name = "Movies";
                          });
                        } else if (value == 2) {
                          setState(() {
                            name = "Series";
                          });
                        } else if (value == 3) {
                          setState(() {
                            name = "Live Tv";
                          });
                        } else if (value == 4) {
                          setState(() {
                            name = "Menu";
                          });
                        }
                      },
                    ),

                    // Container(height: 50, child: AdWidget(ad: bannerAd!))
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              centerTitle: true,
              title: name == ""
                  ? Image.network(
                      appdetails.appdetails!.videoStreamingApp!.first.appLogo!,
                      height: 40)
                  : Text(name),
              leading: IconButton(
                focusColor: Colors.grey,
                  onPressed: () {
                    redirectpage(const Notificationpage());
                  },
                  icon: const Icon(Icons.notifications), color: notify?Colors.grey:Colors.white ,),
              actions: [

                IconButton(
                  focusColor: Colors.grey,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SearchPage())));
                    },
                    icon: const Icon(Icons.search), color: focues? Colors.grey: Colors.white,)
              ],
            ),
            body: Container(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  const HomePage(),
                  // ShowsPage(genreid: "1"),
                  const MoviesPage(genreid: "1"),
                  const ShowsPage(genreid: "2"),
                  TvPage(genreid: "9"),
                  //  const MoviesPage(genreid: "9"),
                  box.get('userid') == null ? WelcomeScreen() : const Menupage()
                ],
              ),
            ),
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
