import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc() : super(JobsInitial());

  @override
  Stream<JobsState> mapEventToState(
    JobsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
