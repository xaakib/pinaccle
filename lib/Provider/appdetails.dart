import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/Appdetails/appdetails.dart';
import 'package:hoichoi_clone_app/Model/Appdetails/appdetails.dart';

class Appdetailsprovidr extends ChangeNotifier {
  Appdetails? appdetails;

  Future getappdetails() async {
    appdetails = await HttpAppdetails().getappdetails();
    notifyListeners();
  }
}
