import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_bloc/api/api.dart';
import 'package:flutter_graphql_bloc/bloc/jobs_bloc.dart';
import 'package:flutter_graphql_bloc/widgets/widgets.dart';

void main() => runApp(MyApp(apiClient: ApiClient.create()));

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.apiClient})
      : assert(apiClient != null),
        super(key: key);

  final ApiClient apiClient;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Color.fromRGBO(229, 53, 171, 1)),
      home: BlocProvider(
        create: (_) => JobsBloc(
          apiClient: apiClient,
        )..add(JobsFetchStarted()),
        child: JobsPage(),
      ),
    );
  }
}

class JobsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        // title: Text('GraphQL Startup Jobs'),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://marmelab.com/images/blog/graphql/logo.png",
              height: 50,
            ),
            Text(
              "Startup Jobs",
              style: TextStyle(color: Theme.of(context).accentColor),
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: BlocBuilder<JobsBloc, JobsState>(
          builder: (context, state) {
            if (state is JobsLoadInProgress) {
              return CircularProgressIndicator();
            } else if (state is JobsLoadSuccess) {
              return ListView.builder(
                itemCount: state.jobs.length,
                itemBuilder: (context, index) {
                  final job = state.jobs[index];
                  return JobCard(job: job);
                },
              );
            } else {
              return Text('Oops something went wrong!');
            }
          },
        ),
      ),
    );
  }
}
