import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/features/dashboard/presentation/cubit/toggle_cubit/toggle_cubit.dart';

class CallsJobsToggle extends StatelessWidget {
  const CallsJobsToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleCubit, ToggleOption>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: ToggleButtons(
            borderRadius: BorderRadius.circular(AppRadius.md),

            isSelected: [
              state == ToggleOption.recentCalls,
              state == ToggleOption.jobsScheduled,
            ],
            onPressed: (index) {
              final cubit = context.read<ToggleCubit>();
              cubit.select(
                index == 0
                    ? ToggleOption.recentCalls
                    : ToggleOption.jobsScheduled,
              );
              developer.log("index: ${cubit.state}");
            },
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Recent Calls"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Jobs Scheduled"),
              ),
            ],
          ),
        );
      },
    );
  }
}
