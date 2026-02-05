import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/shared/widgets/button/regular_button/regular_button_cubit.dart';

class RegularButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final String buttonKey;
  final bool? withoutLoading;
  final void Function()? onTap;
  final bool? suffixIcon;
  final double width;

  const RegularButton({
    super.key,
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
            height: 30,
            width: width,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: isLoading
                      ? Center(
                          child: SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (suffixIcon!) ...[
                              Icon(Icons.add, size: 12, color: Colors.white),
                              const SizedBox(width: 5),
                            ],

                            Text(
                              text,
                              style: TextStyle(fontSize: 12, color: textColor),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
