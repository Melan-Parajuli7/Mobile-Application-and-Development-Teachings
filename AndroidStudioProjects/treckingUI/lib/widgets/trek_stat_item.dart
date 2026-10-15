import 'package:flutter/material.dart';
import '../themes/app_color.dart';

class TrekStatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const TrekStatItem(
      {super.key, required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: AppColors.textDark),
            const SizedBox(width: 4),
            Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textGrey)),
      ],
    );
  }
}