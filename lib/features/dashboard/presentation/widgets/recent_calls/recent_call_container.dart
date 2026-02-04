import 'package:flutter/material.dart';

class RecentCallContainer extends StatelessWidget {
  const RecentCallContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.call_end_outlined),
        SizedBox(width: 12),
        Column(children: [Text('Call Name'), Text('Call Time')]),
        Spacer(),
        Text("Time"),
      ],
    );
  }
}
