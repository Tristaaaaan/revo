import 'package:revo/features/dashboard/data/model/call_model.dart';

abstract class CallRepository {
  Future<List<CallModel>?> getRecentCalls();
}
