import 'package:revo/features/dashboard/data/model/call_model.dart';
import 'package:revo/features/dashboard/domain/repo/call_repo.dart';

class GetRecentCallsUseCase {
  final CallRepository repository;

  GetRecentCallsUseCase(this.repository);

  Future<List<CallModel>?> execute() async {
    return await repository.getRecentCalls();
  }
}
