import 'package:flutter/material.dart';
import '../models/trek.dart';
import '../themes/app_color.dart';
import 'app_image.dart';

class PopularDestinationCard extends StatelessWidget {
  final Trek trek;
  final VoidCallback onTap;

  const PopularDestinationCard({super.key, required this.trek, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImage(trek.image,
                height: 80, width: double.infinity, radius: BorderRadius.circular(10)),
            const SizedBox(height: 6),
            Text(trek.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 13, color: AppColors.primary),
                Text(' ${trek.country}',
                    style: const TextStyle(fontSize: 11, color: AppColors.textGrey)),
                const Spacer(),
                const Icon(Icons.star, size: 13, color: AppColors.star),
                Text(' ${trek.rating}',
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}