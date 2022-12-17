import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/Allpages/allpages.dart';
import 'package:hoichoi_clone_app/Model/Allpages/allpage.dart';

class AllpageProvider extends ChangeNotifier {
  Allpages? allpages;

  Future getallpage() async {
    allpages = await HttpAllpages().getallpages();
    notifyListeners();
  }
}
