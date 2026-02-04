import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/calls/presentation/recent_call_container.dart';
import 'package:revo/features/dashboard/presentation/cubit/toggle_cubit/toggle_cubit.dart';
import 'package:revo/features/dashboard/presentation/widgets/toggle_buttons/toggle_buttons.dart';
import 'package:revo/features/jobs/presentation/widget/schedule_container.dart';

class CallHistoryView extends StatelessWidget {
  const CallHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      // This is a trick: wrap everything in a single SliverList with 1 child: Column
      delegate: SliverChildListDelegate([
        // Toggle button
        Padding(padding: const EdgeInsets.all(16), child: CallsJobsToggle()),

        // Toggle-dependent content
        BlocBuilder<ToggleCubit, ToggleOption>(
          builder: (context, state) {
            if (state == ToggleOption.recentCalls) {
              return RecentCallContainer(); // returns Column of items
            } else {
              return JobsScheduledContainer(); // returns Column of items
            }
          },
        ),
      ]),
    );
  }
}
