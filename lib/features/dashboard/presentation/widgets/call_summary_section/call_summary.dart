import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/calls/data/repo/call_repo_impl.dart';
import 'package:revo/features/calls/domain/usecase/call_usecase.dart';
import 'package:revo/features/calls/presentation/cubit/call_cubit.dart';
import 'package:revo/features/dashboard/presentation/cubit/summary_toggle_cubit/summary_toggle_cubit.dart';
import 'package:revo/features/dashboard/presentation/widgets/call_summary_section/summary_content.dart';

class CallSummary extends StatelessWidget {
  const CallSummary({super.key});

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
        BlocProvider(create: (_) => SummaryToggleCubit()),
      ],
      child: CallSummaryContent(),
    );
  }
}
