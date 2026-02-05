import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/features/dashboard/presentation/widgets/template_section/templates_content.dart';
import 'package:revo/features/dashboard/presentation/widgets/template_section/templates_header.dart';

class Template extends StatelessWidget {
  const Template({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TeamplatesHeader(),
            SizedBox(height: AppSpacing.sm),
            TemplatesBody(),
          ],
        ),
      ),
    );
  }
}
