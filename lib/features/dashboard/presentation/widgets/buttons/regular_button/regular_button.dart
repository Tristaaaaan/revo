import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/features/dashboard/presentation/widgets/buttons/regular_button/regular_button_cubit.dart';

class RegularButton extends StatelessWidget {
  final bool? withIcon;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final String buttonKey;
  final bool? withoutLoading;
  final void Function()? onTap;
  final bool? suffixIcon;
  final bool? withBorder;
  final double width;

  const RegularButton({
    super.key,
    this.withBorder = false,
    this.withIcon = true,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.buttonKey,
    this.withoutLoading = false,
    this.onTap,
    this.suffixIcon = true,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegularButtonLoadingCubit, Map<String, bool>>(
      builder: (context, state) {
        final isLoading = state[buttonKey] ?? false;

        return GestureDetector(
          onTap: withoutLoading!
              ? onTap
              : isLoading
              ? () {}
              : () async {
                  onTap?.call();
                },
          child: Container(
            width: width,

            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: .5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              border: withBorder!
                  ? Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 3,
                    )
                  : null,
            ),
            child: Row(
              children: [
                Expanded(
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (suffixIcon!) ...[
                              const SizedBox(width: 10),
                              Icon(
                                Icons.chevron_right,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ],
                            Text(
                              text,
                              style: TextStyle(fontSize: 12, color: textColor),
                            ),
                          ],
                        ),
                ),
                if (withIcon == true) const SizedBox(width: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
