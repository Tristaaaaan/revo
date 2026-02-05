import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';

class TemplatesBody extends StatelessWidget {
  const TemplatesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Create New Container
          Container(
            width: 96,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Create New',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),

          const SizedBox(width: AppSpacing.md),

          // Welcome Message Container
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // take minimal height
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/calls/wave.png",
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Text('Welcome Message', style: AppTextStyle.boldSm),
                      const Spacer(),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Thank you for calling! How can I help you today?',
                    style: AppTextStyle.regularXs.copyWith(
                      color: AppTextStyle.regularXs.color?.withValues(
                        alpha: 0.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
