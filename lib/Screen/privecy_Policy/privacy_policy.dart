import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hoichoi_clone_app/Provider/allpages.dart';
import 'package:provider/provider.dart';

class PrivecyPolicyPage extends StatefulWidget {
  const PrivecyPolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivecyPolicyPage> createState() => _PrivecyPolicyPageState();
}

class _PrivecyPolicyPageState extends State<PrivecyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    final allpage = Provider.of<AllpageProvider>(context);
    var data = allpage.allpages!.allPages!
        .where((element) => element.pageSlug == "privacy-policy")
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(data.first.pageTitle!),
      ),
      body: Html(data: data.first.pageContent),
    );
  }
}
