import 'package:revo/features/calls/data/datasource/local/call_db.dart';
import 'package:revo/features/calls/data/model/call_model.dart';
import 'package:revo/features/calls/domain/repo/call_repo.dart';

class CallRepoImpl extends CallRepository {
  @override
  Future<List<CallModel>?> getRecentCalls() async {
    final List<CallModel> callData = MockCallData.generateCalls();

    // Sort by callTimeOut (latest first)
    callData.sort((a, b) => b.callTimeOut!.compareTo(a.callTimeOut!));

    await Future.delayed(const Duration(seconds: 5));
    return callData;
  }
}
