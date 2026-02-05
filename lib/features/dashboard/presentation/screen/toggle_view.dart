import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/calls/presentation/recent_call_container.dart';
import 'package:revo/features/dashboard/presentation/cubit/toggle_cubit/toggle_cubit.dart';
import 'package:revo/features/dashboard/presentation/widgets/buttons/view_all/view_all.dart';
import 'package:revo/features/dashboard/presentation/widgets/toggle_buttons/toggle_buttons.dart';
import 'package:revo/features/jobs/presentation/widget/schedule_container.dart';

class CallHistoryView extends StatelessWidget {
  const CallHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: CallsJobsToggle(),
        ),
        SliverToBoxAdapter(child: ViewAllButton()),
        BlocBuilder<ToggleCubit, ToggleOption>(
          builder: (context, state) {
            if (state == ToggleOption.recentCalls) {
              return RecentCallContainer();
            } else {
              return JobsScheduledContainer();
            }
          },
        ),
      ],
    );
  }
}
