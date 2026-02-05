import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/features/dashboard/presentation/cubit/summary_toggle_cubit/summary_toggle_cubit.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildToggleButton(
                context,
                label: 'Total Call',
                selected: state == SummaryToggleOption.totalCalls,
                onTap: () => context.read<SummaryToggleCubit>().select(
                  SummaryToggleOption.totalCalls,
                ),
              ),
              _buildToggleButton(
                context,
                label: 'Total Quality',
                selected: state == SummaryToggleOption.totalQuality,
                onTap: () => context.read<SummaryToggleCubit>().select(
                  SummaryToggleOption.totalQuality,
                ),
              ),
              _buildToggleButton(
                context,
                label: 'Call Behavior',
                selected: state == SummaryToggleOption.callBehavior,
                onTap: () => context.read<SummaryToggleCubit>().select(
                  SummaryToggleOption.callBehavior,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildToggleButton(
    BuildContext context, {
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 11),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: selected
                ? Theme.of(context).colorScheme.primaryContainer
                : null,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: AppTextSize.xs,
              fontWeight: selected ? FontWeight.bold : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
