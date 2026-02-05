import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/features/calls/presentation/cubit/call_cubit.dart';
import 'package:revo/features/calls/presentation/cubit/call_states.dart';
import 'package:revo/features/dashboard/presentation/cubit/summary_toggle_cubit/summary_toggle_cubit.dart';
import 'package:revo/features/dashboard/presentation/widgets/call_summary_section/bar_chart/bar_chart.dart';
import 'package:revo/features/dashboard/presentation/widgets/call_summary_section/call_content.dart';
import 'package:revo/features/dashboard/presentation/widgets/call_summary_section/call_summary_toggle.dart';
import 'package:revo/features/dashboard/presentation/widgets/call_summary_section/pie_chart/circle_chart.dart';

class CallSummaryContent extends StatelessWidget {
  const CallSummaryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xs1),
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.md),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Toggle
            CallSummaryToggle(),
            // Header
            SizedBox(height: 16),
            BlocBuilder<SummaryToggleCubit, SummaryToggleOption>(
              builder: (context, state) {
                if (state == SummaryToggleOption.totalCalls) {
                  return CallContent(
                    header: "Total Calls Today",
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<CallCubit, CallState>(
                          builder: (context, state) {
                            return state.when(
                              initial: () => const SizedBox(),
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              loaded: (calls) {
                                final items = calls ?? [];

                                if (items.isEmpty) {
                                  return const Center(
                                    child: Text('No recent calls'),
                                  );
                                }

                                // Total calls
                                final totalCalls = items.length;

                                // --- Get calls per day for last 7 days ---
                                final today = DateTime.now();
                                final last7Days = List.generate(
                                  7,
                                  (i) => today.subtract(Duration(days: i)),
                                ).reversed.toList();

                                // Initialize map with 0 counts (DateTime -> count)
                                final Map<DateTime, int> callsPerDay = {
                                  for (var day in last7Days)
                                    DateTime(day.year, day.month, day.day): 0,
                                };

                                // Count calls per day
                                for (var call in items) {
                                  final callDate =
                                      DateTime.fromMillisecondsSinceEpoch(
                                        call.callTime,
                                      );

                                  final key = DateTime(
                                    callDate.year,
                                    callDate.month,
                                    callDate.day,
                                  );
                                  if (callsPerDay.containsKey(key)) {
                                    callsPerDay[key] = callsPerDay[key]! + 1;
                                  }
                                }

                                // Max count for scaling the chart
                                final maxCount = callsPerDay.values.isNotEmpty
                                    ? callsPerDay.values.reduce(
                                        (a, b) => a > b ? a : b,
                                      )
                                    : 1;

                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Summary Column
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Total Calls
                                          Text(
                                            totalCalls.toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 36,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          // Percentage change vs last week (example)
                                          RichText(
                                            text: const TextSpan(
                                              text: '+12%',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: ' vs. last week',
                                                  style: AppTextStyle.regularXs,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: AppSpacing.xl),
                                    Expanded(
                                      flex: 2,
                                      child: CustomBarChart(
                                        data: callsPerDay,
                                        maxY: maxCount,
                                      ),
                                    ),
                                  ],
                                );
                              },
                              error: (message) => Center(
                                child: Text('Error loading calls: $message'),
                              ),
                              empty: () =>
                                  const Center(child: Text('No recent calls')),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                } else if (state == SummaryToggleOption.totalQuality) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What kind of calls are coming in",
                        style: AppTextStyle.regularXs.copyWith(
                          color: AppTextStyle.regularXs.color?.withValues(
                            alpha: 0.4,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<CallCubit, CallState>(
                              builder: (context, state) {
                                return state.when(
                                  initial: () => const SizedBox(),
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  loaded: (calls) {
                                    final items = calls ?? [];

                                    if (items.isEmpty) {
                                      return const Center(
                                        child: Text('No recent calls'),
                                      );
                                    }

                                    // Group by description and count occurrences
                                    final Map<String, int> descriptionCount =
                                        {};
                                    for (var call in items) {
                                      final desc = call.description;
                                      descriptionCount[desc] =
                                          (descriptionCount[desc] ?? 0) + 1;
                                    }

                                    // Prepare percentages for the chart
                                    final List<double> percentages =
                                        descriptionCount.entries
                                            .map((e) => e.value.toDouble())
                                            .toList();

                                    // Prepare colors for each slice (looping through sequential)
                                    final List<Color> colors = List.generate(
                                      descriptionCount.length,
                                      (index) =>
                                          AppColors.sequential[index %
                                              AppColors.sequential.length],
                                    );
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Wrap(
                                                spacing: 8,
                                                runSpacing: 8,
                                                children: descriptionCount
                                                    .entries
                                                    .map((entry) {
                                                      final percentage =
                                                          (entry.value /
                                                                  items.length *
                                                                  100)
                                                              .toStringAsFixed(
                                                                0,
                                                              );
                                                      return CallInfo(
                                                        description: entry.key,
                                                        percentage:
                                                            '$percentage%',
                                                        color:
                                                            colors[descriptionCount
                                                                .keys
                                                                .toList()
                                                                .indexOf(
                                                                  entry.key,
                                                                )],
                                                      );
                                                    })
                                                    .toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: AppSpacing.lg),
                                        MultiCircleChart(
                                          values: percentages,
                                          maxStrokeWidth: 20,
                                          colors: colors,
                                        ),
                                      ],
                                    );
                                  },
                                  error: (message) => Center(
                                    child: Text(
                                      'Error loading calls: $message',
                                    ),
                                  ),
                                  empty: () => const Center(
                                    child: Text('No recent calls'),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What kind of calls are coming in",
                        style: AppTextStyle.regularXs.copyWith(
                          color: AppTextStyle.regularXs.color?.withValues(
                            alpha: 0.4,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<CallCubit, CallState>(
                              builder: (context, state) {
                                return state.when(
                                  initial: () => const SizedBox(),
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  loaded: (calls) {
                                    final items = calls ?? [];

                                    if (items.isEmpty) {
                                      return const Center(
                                        child: Text('No recent calls'),
                                      );
                                    }

                                    // Group by description and count occurrences
                                    final Map<String, int> descriptionCount =
                                        {};
                                    for (var call in items) {
                                      final desc = call.description;
                                      descriptionCount[desc] =
                                          (descriptionCount[desc] ?? 0) + 1;
                                    }

                                    // Prepare percentages for the chart
                                    final List<double> percentages =
                                        descriptionCount.entries
                                            .map((e) => e.value.toDouble())
                                            .toList();

                                    // Prepare colors for each slice (looping through sequential)
                                    final List<Color> colors = List.generate(
                                      descriptionCount.length,
                                      (index) =>
                                          AppColors.sequential[index %
                                              AppColors.sequential.length],
                                    );
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Wrap(
                                                spacing: 8,
                                                runSpacing: 8,
                                                children: descriptionCount
                                                    .entries
                                                    .map((entry) {
                                                      final percentage =
                                                          (entry.value /
                                                                  items.length *
                                                                  100)
                                                              .toStringAsFixed(
                                                                0,
                                                              );
                                                      return CallInfo(
                                                        description: entry.key,
                                                        percentage:
                                                            '$percentage%',
                                                        color:
                                                            colors[descriptionCount
                                                                .keys
                                                                .toList()
                                                                .indexOf(
                                                                  entry.key,
                                                                )],
                                                      );
                                                    })
                                                    .toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: AppSpacing.lg),
                                        MultiCircleChart(
                                          values: percentages,
                                          maxStrokeWidth: 20,
                                          colors: colors,
                                        ),
                                      ],
                                    );
                                  },
                                  error: (message) => Center(
                                    child: Text(
                                      'Error loading calls: $message',
                                    ),
                                  ),
                                  empty: () => const Center(
                                    child: Text('No recent calls'),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
            // Content
          ],
        ),
      ),
    );
  }
}

class CallInfo extends StatelessWidget {
  final String description;
  final String percentage;
  final Color color;
  const CallInfo({
    super.key,
    required this.description,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(backgroundColor: color, radius: 4),
            SizedBox(width: AppSpacing.sm),
            Text(
              description,
              style: AppTextStyle.regularXs.copyWith(
                color: AppTextStyle.regularXs.color?.withValues(alpha: 0.7),
              ),
            ),
            Spacer(),
            Text(
              percentage,
              style: AppTextStyle.boldMd3.copyWith(
                color: AppTextStyle.boldMd3.color?.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
