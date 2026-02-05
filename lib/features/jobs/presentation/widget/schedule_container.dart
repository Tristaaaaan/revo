import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/core/appimages/app_images.dart';
import 'package:revo/features/jobs/presentation/component/icon_text.dart';
import 'package:revo/features/jobs/presentation/cubits/jobs_cubit.dart';
import 'package:revo/features/jobs/presentation/cubits/jobs_state.dart';
import 'package:revo/features/jobs/presentation/widget/document_chip.dart';

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
                final time = DateTime.fromMillisecondsSinceEpoch(
                  job.dateTime ?? 0,
                );

                String jobTime = DateFormat('h:mm a').format(time);
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
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
                          Text(job.name, style: AppTextStyle.boldMd2),
                          SizedBox(height: 5),

                          DocumentChip(text: job.documentUrl ?? ''),
                          SizedBox(height: AppSpacing.md),
                          ImageText(
                            imagePath: AppImages.location,
                            text: job.address,
                          ),
                          SizedBox(height: 5),
                          ImageText(
                            imagePath: AppImages.schedule,
                            text: job.status ?? '',
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        jobTime,
                        style: AppTextStyle.regularXs.copyWith(
                          color: AppTextStyle.regularXs.color?.withValues(
                            alpha: 0.4,
                          ),
                        ),
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
