import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hoichoi_clone_app/Provider/allpages.dart';
import 'package:provider/provider.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    final allpage = Provider.of<AllpageProvider>(context);
    var data = allpage.allpages!.allPages!
        .where((element) => element.pageSlug == "about-us")
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(data.first.pageTitle!),
      ),
      body: Html(data: data.first.pageContent),
    );
  }
}
