import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/Userprofile/userprofile.dart';
import 'package:hoichoi_clone_app/Provider/userplan.dart';
import 'package:hoichoi_clone_app/constants.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController newpassword = TextEditingController();

  Future getuserprofile() async {
    var data = await Httpuserprofile().getuserprofile();
    name.text = data!.videoStreamingApp!.first.name!;
    email.text = data.videoStreamingApp!.first.email!;
    phone.text = data.videoStreamingApp!.first.phone!;
  }

  bool loading = true;

  @override
  void initState() {
    getuserprofile().then((value) {
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        centerTitle: true,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(color: color),
            )
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    acountinfo(),
                    subscription(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget acountinfo() {
    return Container(
      color: Colors.white.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Account Info",
              style: TextStyle(
                  color: color, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          testfield(name: "Name", controller: name),
          testfield(name: "Email", controller: email),
          testfield(name: "Phone", controller: phone),
          testfield(name: "New Password", controller: newpassword),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: color,
                onPressed: () {
                  Httpuserprofile().updateuserprofile(
                      name: name.text,
                      email: email.text,
                      password: newpassword.text,
                      phone: phone.text,
                      useraddress: "",
                      userimage: "");
                },
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget testfield({String? name, TextEditingController? controller}) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(
            name!,
            style: TextStyle(color: Colors.white),
          ),
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }

  Widget subscription() {
    final userplan = Provider.of<UserplanProvider>(context);
    int timestamp = userplan.userplan!.videoStreamingApp!.expiredOn ?? 0;
    return Container(
      margin: EdgeInsets.only(top: 30),
      color: Colors.white.withOpacity(0.2),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "SUBSCRIPTION",
              style: TextStyle(
                  color: color, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Next Billing date",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: Text(DateFormat().format(
                DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000000))),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Current Plan",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child:
                Text(userplan.userplan!.videoStreamingApp!.currentPlan ?? ""),
          ),
        ],
      ),
    );
  }
}
