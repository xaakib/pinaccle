import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/Userplan/userplan.dart';
import 'package:hoichoi_clone_app/Model/Userplan/userplan.dart';

class UserplanProvider extends ChangeNotifier {
  Userplan? userplan;

  Future getuserplan() async {
    userplan = await HttpUserplan().getuserplan();
    notifyListeners();
  }
}
