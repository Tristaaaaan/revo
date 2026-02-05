import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/core/apptext/app_text.dart';
import 'package:revo/features/dashboard/presentation/cubit/toggle_cubit/toggle_cubit.dart';
import 'package:revo/shared/enum/shared_enums.dart';
import 'package:revo/shared/widgets/button/text_button.dart';
import 'package:revo/shared/widgets/button/toggle_button.dart';

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
                    width: 250,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xff111315),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ToggleButton(
                            selectedColor: Theme.of(
                              context,
                            ).colorScheme.secondaryContainer,
                            label: AppText.recentCalls,
                            selected: state == CallJobToggleOption.recentCalls,
                            onTap: () => context
                                .read<CallJobToggleCubit>()
                                .select(CallJobToggleOption.recentCalls),
                          ),
                        ),
                        Expanded(
                          child: ToggleButton(
                            selectedColor: Theme.of(
                              context,
                            ).colorScheme.secondaryContainer,
                            label: AppText.jobsScheduled,
                            selected:
                                state == CallJobToggleOption.jobsScheduled,
                            onTap: () => context
                                .read<CallJobToggleCubit>()
                                .select(CallJobToggleOption.jobsScheduled),
                          ),
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
