import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/dashboard/data/repo/call_repo_impl.dart';
import 'package:revo/features/dashboard/domain/usecase/call_usecase.dart';
import 'package:revo/features/dashboard/presentation/providers/call_cubit.dart';
import 'package:revo/features/dashboard/presentation/widgets/recent_calls/recent_call_container.dart';

class CallHistoryPage extends StatelessWidget {
  const CallHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final repository = CallRepoImpl();
        final useCase = GetRecentCallsUseCase(repository);
        return CallCubit(useCase);
      },
      child: RecentCallContainer(),
    );
  }
}
