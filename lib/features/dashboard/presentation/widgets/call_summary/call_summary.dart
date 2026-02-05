import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/dashboard/presentation/cubit/summary_toggle_cubit/summary_toggle_cubit.dart';
import 'package:revo/features/dashboard/presentation/widgets/call_summary/summary_content.dart';

class CallSummary extends StatelessWidget {
  const CallSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SummaryToggleCubit(),
      child: CallSummaryContent(),
    );
  }
}
