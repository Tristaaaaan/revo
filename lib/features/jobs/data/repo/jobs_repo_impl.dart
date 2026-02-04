import 'package:revo/features/jobs/data/model/jobs_model.dart';
import 'package:revo/features/jobs/domain/repo/jobs_repo.dart';

class JobsRepoImpl extends JobsRepository {
  @override
  Future<List<JobModel>?> getJobs() async {
    return [
      JobModel(
        id: "1",
        name: "Job 1",
        address: "Address 1",
        dateTime: DateTime.now().millisecondsSinceEpoch,
        status: "Pending",
        documentUrl: "https://example.com",
      ),
      JobModel(
        id: "2",
        name: "Job 2",
        address: "Address 2",
        dateTime: DateTime.now().millisecondsSinceEpoch,
        status: "Pending",
        documentUrl: "https://example.com",
      ),
    ];
  }
}
