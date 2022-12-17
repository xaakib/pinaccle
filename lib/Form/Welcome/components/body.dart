import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hoichoi_clone_app/Form/Login/login_screen.dart';
import 'package:hoichoi_clone_app/Form/Signup/signup_screen.dart';
import 'package:hoichoi_clone_app/Form/Welcome/components/background.dart';
import 'package:hoichoi_clone_app/Form/components/rounded_button.dart';
import 'package:hoichoi_clone_app/Provider/appdetails.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appdetails = Provider.of<Appdetailsprovidr>(context);
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    appdetails.appdetails!.videoStreamingApp!.first.appLogo!,
                    height: 150,
                  ),
                ],
              ),
            ),
            // SvgPicture.asset(
            //   "assets/icons/chat.svg",
            //   height: size.height * 0.45,
            // ),

            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                    text: "LOGIN",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                  // RoundedButton(
                  //   text: "SIGN UP",
                  //   color: kPrimaryLightColor,
                  //   textColor: Colors.black,
                  //   press: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) {
                  //           return SignUpScreen();
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
