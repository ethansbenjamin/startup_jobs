import 'package:flutter/material.dart';
import 'package:flutter_graphql_bloc/api/models/models.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetail extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => JobDetail());
  }

  const JobDetail({this.job});

  final Job job;

  void _launchURL() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title ?? ""),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              job.title ?? "",
              style: TextStyle(fontSize: 20),
            ),
            RaisedButton(
              onPressed: () async {
                String url = job.applyUrl;
                if (await canLaunch(url)) {
                  await launch(
                    url,
                    forceWebView: true,
                    forceSafariVC: true,
                  );
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text("Apply"),
            ),
            Text(
              job.locationNames ?? "",
              style: TextStyle(fontSize: 20),
            ),
            Text(job.applyUrl ?? ""),
            MarkdownBody(data: job.description ?? ""),
          ],
        ),
      )),
    );
  }
}
