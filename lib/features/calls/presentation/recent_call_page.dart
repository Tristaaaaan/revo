import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/calls/data/repo/call_repo_impl.dart';
import 'package:revo/features/calls/domain/usecase/call_usecase.dart';
import 'package:revo/features/calls/presentation/cubit/call_cubit.dart';
import 'package:revo/features/dashboard/presentation/cubit/toggle_cubit/toggle_cubit.dart';
import 'package:revo/features/dashboard/presentation/screen/toggle_view.dart';
import 'package:revo/features/jobs/data/repo/jobs_repo_impl.dart';
import 'package:revo/features/jobs/domain/usecase/job_usecase.dart';
import 'package:revo/features/jobs/presentation/cubits/jobs_cubit.dart';

// class CallHistoryPage extends StatelessWidget {
//   const CallHistoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) {
//         final repository = CallRepoImpl();
//         final useCase = GetRecentCallsUseCase(repository);
//         return CallCubit(useCase);
//       },
//       child: RecentCallContainer(),
//     );
//   }
// }

class CallHistoryPage extends StatelessWidget {
  const CallHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final repo = CallRepoImpl();
            final useCase = GetRecentCallsUseCase(repo);
            return CallCubit(useCase);
          },
        ),
        BlocProvider(
          create: (_) {
            final repo = JobsRepoImpl();
            final useCase = GetScheduledJobsUseCase(repo);
            return JobsCubit(useCase);
          },
        ),
        BlocProvider(create: (_) => ToggleCubit()),
      ],
      child: const CallHistoryView(),
    );
  }
}
