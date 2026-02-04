import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/jobs/presentation/cubits/jobs_cubit.dart';
import 'package:revo/features/jobs/presentation/cubits/jobs_state.dart';

class JobsScheduledContainer extends StatelessWidget {
  const JobsScheduledContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsCubit, JobsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SliverToBoxAdapter(child: SizedBox()),
          loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          loaded: (jobs) {
            final items = jobs ?? [];
            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final job = items[index];
                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 12,
                    left: 16,
                    right: 16,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "${job.name} • ${job.address}",
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }, childCount: items.length),
            );
          },
          error: (message) => SliverToBoxAdapter(
            child: Center(child: Text('Error loading jobs: $message')),
          ),
          empty: () => const SliverToBoxAdapter(
            child: Center(child: Text('No jobs scheduled')),
          ),
        );
      },
    );
  }
}
