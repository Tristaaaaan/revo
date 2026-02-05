import 'package:revo/features/jobs/data/model/jobs_model.dart';
import 'package:revo/features/jobs/domain/repo/jobs_repo.dart';

class GetScheduledJobsUseCase {
  final JobsRepository repository;

  GetScheduledJobsUseCase(this.repository);

  Future<List<JobModel>?> execute() => repository.getJobs();
}
