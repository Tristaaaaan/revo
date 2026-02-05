import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/common/component/button/text_button.dart';
import 'package:revo/common/component/button/toggle_button.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/features/dashboard/presentation/cubit/toggle_cubit/toggle_cubit.dart';

class CallsJobsToggle extends StatelessWidget {
  const CallsJobsToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallJobToggleCubit, CallJobToggleOption>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xff111315),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: Row(
                      children: [
                        ToggleButton(
                          selectedColor: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer,
                          label: 'Recent Calls',
                          selected: state == CallJobToggleOption.recentCalls,
                          onTap: () => context
                              .read<CallJobToggleCubit>()
                              .select(CallJobToggleOption.recentCalls),
                        ),
                        ToggleButton(
                          selectedColor: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer,
                          label: 'Jobs Scheduled',
                          selected: state == CallJobToggleOption.jobsScheduled,
                          onTap: () => context
                              .read<CallJobToggleCubit>()
                              .select(CallJobToggleOption.jobsScheduled),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              CustomTextButtom(text: "View All"),
            ],
          ),
        );
      },
    );
  }
}
