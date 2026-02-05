import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/features/dashboard/presentation/cubit/summary_toggle_cubit/summary_toggle_cubit.dart';
import 'package:revo/shared/enum/shared_enums.dart';
import 'package:revo/shared/widgets/button/toggle_button.dart';

class CallSummaryToggle extends StatelessWidget {
  const CallSummaryToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryToggleCubit, SummaryToggleOption>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xff0A0A0A),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Row(
            children: [
              Expanded(
                child: ToggleButton(
                  selectedColor: Theme.of(context).colorScheme.primaryContainer,
                  label: 'Total Call',
                  selected: state == SummaryToggleOption.totalCalls,
                  onTap: () => context.read<SummaryToggleCubit>().select(
                    SummaryToggleOption.totalCalls,
                  ),
                ),
              ),
              Expanded(
                child: ToggleButton(
                  selectedColor: Theme.of(context).colorScheme.primaryContainer,

                  label: 'Total Quality',
                  selected: state == SummaryToggleOption.totalQuality,
                  onTap: () => context.read<SummaryToggleCubit>().select(
                    SummaryToggleOption.totalQuality,
                  ),
                ),
              ),
              Expanded(
                child: ToggleButton(
                  selectedColor: Theme.of(context).colorScheme.primaryContainer,

                  label: 'Call Behavior',
                  selected: state == SummaryToggleOption.callBehavior,
                  onTap: () => context.read<SummaryToggleCubit>().select(
                    SummaryToggleOption.callBehavior,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
