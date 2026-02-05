import 'package:revo/features/jobs/data/datasource/local/jobs_db.dart';
import 'package:revo/features/jobs/data/model/jobs_model.dart';
import 'package:revo/features/jobs/domain/repo/jobs_repo.dart';

class JobsRepoImpl extends JobsRepository {
  @override
  Future<List<JobModel>?> getJobs() async {
    final List<JobModel> jobData = MockJobsData.generateJobs(count: 10);
    await Future.delayed(const Duration(seconds: 5));

    return jobData;
  }
}
