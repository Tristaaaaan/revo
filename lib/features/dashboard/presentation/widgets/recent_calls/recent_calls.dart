import 'package:flutter/material.dart';
import 'package:revo/features/dashboard/presentation/widgets/recent_calls/recent_call_container.dart';

class RecentCalls extends StatelessWidget {
  const RecentCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const RecentCallContainer();
      },
    );
  }
}
