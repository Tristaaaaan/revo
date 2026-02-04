import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/dashboard/presentation/cubit/toggle_cubit/toggle_cubit.dart';

class ToggleBloc extends StatelessWidget {
  const ToggleBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleCubit, ToggleOption>(
      builder: (context, state) {
        return Center(
          child: ToggleButtons(
            borderRadius: BorderRadius.circular(12),
            isSelected: [
              state == ToggleOption.recentCalls,
              state == ToggleOption.jobsScheduled,
            ],
            onPressed: (index) {
              if (index == 0) {
                context.read<ToggleCubit>().select(ToggleOption.recentCalls);
              } else {
                context.read<ToggleCubit>().select(ToggleOption.jobsScheduled);
              }
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
