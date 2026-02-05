import 'package:flutter/material.dart';
import 'package:revo/features/dashboard/presentation/widgets/access_info_section/access_info.dart';
import 'package:revo/features/dashboard/presentation/widgets/appbar/dash_appbar.dart';
import 'package:revo/features/dashboard/presentation/widgets/call_job_section/calljob_section.dart';
import 'package:revo/features/dashboard/presentation/widgets/call_summary_section/call_summary.dart';
import 'package:revo/features/dashboard/presentation/widgets/team_job_section/team_job.dart';
import 'package:revo/features/dashboard/presentation/widgets/template_section/templates.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            DashboardAppbar(),
            AccessInfo(),
            CallSummary(),
            TeamJob(),
            Template(),
            CallJob(),
          ],
        ),
      ),
    );
  }
}
