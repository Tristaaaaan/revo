import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/jobs/domain/usecase/job_usecase.dart';
import 'package:revo/features/jobs/presentation/cubits/jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  final GetScheduledJobsUseCase useCase;

  JobsCubit(this.useCase) : super(const JobsState.initial()) {
    getJobs();
  }

  Future<void> getJobs() async {
    emit(const JobsState.loading());

    try {
      final jobs = await useCase.execute();
      if (isClosed) return;

      if (jobs == null || jobs.isEmpty) {
        emit(const JobsState.empty());
        return;
      }

      emit(JobsState.loaded(jobs));
    } catch (e) {
      emit(JobsState.error(e.toString()));
    }
  }
}
