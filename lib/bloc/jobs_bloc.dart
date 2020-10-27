import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_graphql_bloc/api/api.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  // require an api client parameter to create a JobsBloc
  JobsBloc({@required ApiClient apiClient})
      // make sure the client is not null
      : assert(apiClient != null),
        // then assign that client to the private variable stored
        _apiClient = apiClient,
        // call the initial state of the app
        super(JobsLoadInProgress());

  final ApiClient _apiClient;

  @override
  Stream<JobsState> mapEventToState(
    JobsEvent event,
  ) async* {
    // if we have started to fetch jobs
    if (event is JobsFetchStarted) {
      // start loading the jobs
      yield JobsLoadInProgress();
      try {
        // fetch the jobs, if they successfuly load then yield them as a success
        final jobs = await _apiClient.fetchJobs();
        yield JobsLoadSuccess(jobs);
      } catch (error) {
        yield JobsLoadFailiure();
      }
    }
  }
}
