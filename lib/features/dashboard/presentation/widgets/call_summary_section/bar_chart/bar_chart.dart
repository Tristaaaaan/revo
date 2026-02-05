import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomBarChart extends StatelessWidget {
  final Map<DateTime, int> data; // Date -> call count
  final int maxY; // maximum value for scaling

  const CustomBarChart({super.key, required this.data, required this.maxY});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    // Sort data by date
    final sortedDates = data.keys.toList()..sort();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: sortedDates.map((date) {
        final count = data[date]!;
        final isToday =
            DateFormat('yyyy-MM-dd').format(date) ==
            DateFormat('yyyy-MM-dd').format(today);

        final heightFactor = maxY > 0 ? count / maxY : 0.0;

        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 70 * heightFactor, // scale bar height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                begin: Alignment.topCenter, // gradient starts at bottom
                end: Alignment.bottomCenter, // fades towards top
                colors: isToday
                    ? [Colors.blue, Colors.blue.withValues(alpha: 0.01)]
                    : [
                        Color(0xFF2A2A2A), // bottom dark
                        Color(0xFF151515), // top dark
                      ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
