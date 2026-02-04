import 'package:revo/features/jobs/data/model/jobs_model.dart';

abstract class JobsRepository {
  Future<List<JobModel>?> getJobs();
}
