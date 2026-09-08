import 'package:flutter/material.dart';

class Insurance extends StatelessWidget {
  const Insurance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Insurance",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        ),
      ],
    );
  }
}
