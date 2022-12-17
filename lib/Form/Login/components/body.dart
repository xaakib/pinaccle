import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hoichoi_clone_app/Form/Login/components/background.dart';
import 'package:hoichoi_clone_app/Form/Signup/signup_screen.dart';
import 'package:hoichoi_clone_app/Form/components/already_have_an_account_acheck.dart';
import 'package:hoichoi_clone_app/Form/components/rounded_button.dart';
import 'package:hoichoi_clone_app/Form/components/rounded_input_field.dart';
import 'package:hoichoi_clone_app/Form/components/rounded_password_field.dart';
import 'package:hoichoi_clone_app/Http/Login/login.dart';
import 'package:hoichoi_clone_app/Provider/appdetails.dart';
import 'package:hoichoi_clone_app/mainpage.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../components/text_field_container.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
List<LogicalKeyboardKey> keys =[];
  Future login() async {
    var box = Hive.box('data');
    print(email.text);
    print(password.text);
    final logindata =
        await HttpLogin().login(email: email.text, password: password.text);
    box.put('userid', logindata!.videoStreamingApp!.first.userId!.id);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: ((context) => MainPage())),
        (route) => false);
  }

  @override
  void initState() {
    emailFocus.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appdetails = Provider.of<Appdetailsprovidr>(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              appdetails.appdetails!.videoStreamingApp!.first.appLogo!,
              height: 100,
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
        TextFieldContainer(
          child: TextField(
            focusNode: emailFocus,
            autofocus: true,
            onSubmitted: (value){
              passwordFocus.requestFocus();
            },
            controller: email,
            onChanged: (value){

            },
            cursorColor: color,

            decoration: InputDecoration(
              // icon: Icon(
              //   icon,
              //   color: kPrimaryColor,
              // ),
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,

            ),
          ),
        ),

        TextFieldContainer(
          child: TextField(

            focusNode: passwordFocus,
            controller: password,
            obscureText: true,
            onChanged: (val){},
            onSubmitted: (val){
              passwordFocus.unfocus();
            },
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey),
              // icon: Icon(
              //   Icons.lock,
              //   color: kPrimaryColor,
              // ),
              suffixIcon: Icon(
                Icons.visibility,
                color: color,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
            // RoundedPasswordField(
            //   controller: password,
            //   onChanged: (value) {}, focusNode: passwordFocus,
            // ),
            RoundedButton(
              text: "LOGIN",
              press: () async{
                print("log");
               await login();


              },
            ),
            // SizedBox(height: size.height * 0.03),
            // AlreadyHaveAnAccountCheck(
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
    );
  }
}
