import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoichoi_clone_app/Form/Welcome/welcome_screen.dart';
import 'package:hoichoi_clone_app/Provider/appdetails.dart';
import 'package:hoichoi_clone_app/mainpage.dart';
import 'package:provider/provider.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Future getappinfo() async {
    var box = Hive.box('data');
    Provider.of<Appdetailsprovidr>(context, listen: false)
        .getappdetails()
        .then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  MainPage())));
    });
  }

  @override
  void initState() {
    getappinfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset( 
              "images/WhatsApp_Image_2022-11-21_at_12.06.53_AM-removebg-preview.png",
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
