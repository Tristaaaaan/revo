import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/dashboard/presentation/widgets/buttons/regular_button/regular_button.dart';
import 'package:revo/features/dashboard/presentation/widgets/buttons/regular_button/regular_button_cubit.dart';

class ButtonCard extends StatelessWidget {
  final String title;
  final String buttonKey;
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;
  final Widget? content;

  const ButtonCard({
    super.key,
    required this.title,
    required this.buttonKey,
    required this.buttonText,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegularButtonLoadingCubit(),
      child: BlocBuilder<RegularButtonLoadingCubit, Map<String, bool>>(
        builder: (context, state) {
          final isLoading = state[buttonKey] ?? false;

          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(title),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz),
                      ),
                    ],
                  ),

                  content ?? Container(),
                  const SizedBox(height: 12),
                  RegularButton(
                    onTap: isLoading
                        ? null
                        : () async {
                            context
                                .read<RegularButtonLoadingCubit>()
                                .setLoading(buttonKey, true);

                            await Future.delayed(const Duration(seconds: 3));
                            if (!context.mounted) return;

                            context
                                .read<RegularButtonLoadingCubit>()
                                .setLoading(buttonKey, false);

                            onTap();
                          },
                    text: buttonText,
                    backgroundColor: backgroundColor,
                    textColor: textColor,
                    buttonKey: buttonKey,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
