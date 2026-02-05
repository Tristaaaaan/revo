import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/features/dashboard/presentation/cubit/summary_toggle_cubit/summary_toggle_cubit.dart';
import 'package:revo/features/dashboard/presentation/widgets/call_summary/call_content.dart';
import 'package:revo/features/dashboard/presentation/widgets/call_summary/call_summary_toggle.dart';

class CallSummaryContent extends StatelessWidget {
  const CallSummaryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(16),
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
                        Text(
                          "142",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
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
                  );
                } else if (state == SummaryToggleOption.totalQuality) {
                  return Text("What kind of calls are coming in");
                } else {
                  return Text("What kind of calls are coming in");
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
