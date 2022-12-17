import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hoichoi_clone_app/Provider/allpages.dart';
import 'package:provider/provider.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    final allpage = Provider.of<AllpageProvider>(context);
    var data = allpage.allpages!.allPages!
        .where((element) => element.pageSlug == "contact-us")
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(data.first.pageTitle!),
      ),
      body: Html(data: data.first.pageContent),
    );
  }
}
