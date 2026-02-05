import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/jobs/presentation/component/icon_text.dart';
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

                developer.log('Jobs: ${jobs!.length}');

                return Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),

                          Text(
                            job.documentUrl ?? '',
                            style: const TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 8),

                          ImageText(
                            imagePath: 'assets/icons/calls/location.png',
                            text: job.address,
                          ),
                          SizedBox(height: 5),

                          ImageText(
                            imagePath: 'assets/icons/calls/schedule.png',
                            text: job.dateTime.toString(),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        job.dateTime.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
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
