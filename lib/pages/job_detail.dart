import 'package:flutter/material.dart';
import 'package:flutter_graphql_bloc/api/models/models.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
        title: Text(job.title ?? ""),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * .9,
        child: ListView(
          children: [
            Text(job.title ?? ""),
            Text(job.locationNames ?? ""),
            Text(job.applyUrl ?? ""),
            MarkdownBody(data: job.description ?? ""),
          ],
        ),
      ),
    );
  }
}
