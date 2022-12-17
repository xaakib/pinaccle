import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hoichoi_clone_app/Provider/allpages.dart';
import 'package:provider/provider.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  @override
  Widget build(BuildContext context) {
    final allpage = Provider.of<AllpageProvider>(context);
    var data = allpage.allpages!.allPages!
        .where((element) => element.pageSlug == "terms-of-use")
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(data.first.pageTitle!),
      ),
      body: Html(data: data.first.pageContent),
    );
  }
}
