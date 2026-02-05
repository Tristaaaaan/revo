import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/calls/presentation/recent_call_container.dart';
import 'package:revo/features/dashboard/presentation/cubit/toggle_cubit/toggle_cubit.dart';
import 'package:revo/features/dashboard/presentation/widgets/call_job_section/calljob_toggle.dart';
import 'package:revo/features/jobs/presentation/widget/schedule_container.dart';

class CallJobContent extends StatelessWidget {
  const CallJobContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        CallsJobsToggle(),
        BlocBuilder<CallJobToggleCubit, CallJobToggleOption>(
          builder: (context, state) {
            if (state == CallJobToggleOption.recentCalls) {
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
