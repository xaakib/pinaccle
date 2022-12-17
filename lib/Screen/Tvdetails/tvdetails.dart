import 'package:flutter/material.dart';
import 'package:hoichoi_clone_app/Http/Tvdetails/tvdetails.dart';
import 'package:hoichoi_clone_app/VideoOpen/videoopen.dart';

class TvDetailsPage extends StatefulWidget {
  final String tvid;
  const TvDetailsPage({Key? key, required this.tvid}) : super(key: key);

  @override
  State<TvDetailsPage> createState() => _TvDetailsPageState();
}

class _TvDetailsPageState extends State<TvDetailsPage> {
  bool loading = true;

  Future tvopen() async {
    HttpTvDetails().gettvdetails(tvid: widget.tvid).then((value) {
      ExoPlayer().exoplayerbuild(value!.videoStreamingApp!.tvUrl!);
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    tvopen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container();
  }
}
