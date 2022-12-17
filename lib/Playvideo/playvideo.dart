import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Provider/userplan.dart';
import 'package:provider/provider.dart';

class Playvideo {
  bool playvideo(BuildContext context) {
    final userplan = Provider.of<UserplanProvider>(context, listen: false);
    if (userplan.userplan !=null && userplan.userplan!.videoStreamingApp!.currentPlan != null) {
      return true;
    } else {
      return false;
    }
  }
}
