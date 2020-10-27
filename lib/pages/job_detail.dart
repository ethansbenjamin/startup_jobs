import 'package:flutter/material.dart';
import 'package:flutter_graphql_bloc/api/models/models.dart';

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
      body: Center(
        child: Text("Fucker"),
      ),
    );
  }
}
