import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hoichoi_clone_app/Provider/allpages.dart';
import 'package:provider/provider.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    final allpage = Provider.of<AllpageProvider>(context);
    var data = allpage.allpages!.allPages!
        .where((element) => element.pageSlug == "faq")
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(data.first.pageTitle!),
      ),
      body: Html(data: data.first.pageContent),
    );
  }
}
