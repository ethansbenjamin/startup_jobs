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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.company.name ?? ""),
        backgroundColor: Theme.of(context).accentColor,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
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
                      child: Text(
                        "Apply",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Theme.of(context).accentColor,
                    ),
                    Text(
                      job.locationNames ?? "",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: MarkdownBody(data: job.description ?? "")))
            ],
          ),
        ),
      ),
    );
  }
}
