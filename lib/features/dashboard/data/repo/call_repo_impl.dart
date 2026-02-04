import 'package:revo/features/dashboard/data/datasource/local/call_db.dart';
import 'package:revo/features/dashboard/data/model/call_model.dart';
import 'package:revo/features/dashboard/domain/repo/call_repo.dart';

class CallRepoImpl extends CallRepository {
  @override
  Future<List<CallModel>?> getRecentCalls() async {
    final List<CallModel> callData = MockCallData.generateCalls();
    await Future.delayed(const Duration(seconds: 5));
    return callData;
  }
}
