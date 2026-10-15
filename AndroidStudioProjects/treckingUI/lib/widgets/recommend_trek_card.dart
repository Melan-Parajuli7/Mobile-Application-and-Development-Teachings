import 'package:flutter/material.dart';
import '../models/trek.dart';
import '../themes/app_color.dart';
import 'app_image.dart';

class RecommendedTrekCard extends StatelessWidget {
  final Trek trek;
  final VoidCallback onTap;

  const RecommendedTrekCard({super.key, required this.trek, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8),
          ],
        ),
        child: Row(
          children: [
            AppImage(trek.image, width: 100, height: 70, radius: BorderRadius.circular(10)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(trek.name,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  const SizedBox(height: 2),
                  Text('${trek.duration} • ${trek.difficulty}',
                      style: const TextStyle(fontSize: 11, color: AppColors.textGrey)),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined,
                          size: 13, color: AppColors.primary),
                      Text(' ${trek.country}  ',
                          style: const TextStyle(fontSize: 11, color: AppColors.textGrey)),
                      const Icon(Icons.star, size: 13, color: AppColors.star),
                      Text(' ${trek.rating}', style: const TextStyle(fontSize: 11)),
                    ],
                  ),
                ],
              ),
            ),
            const CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xFFF1F3F5),
              child: Icon(Icons.arrow_forward, size: 16, color: AppColors.textDark),
            ),
            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }
}