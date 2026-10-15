import 'package:flutter/material.dart';
import '../models/trek.dart';
import '../themes/app_color.dart';
import 'app_image.dart';

class FeaturedTrekCard extends StatelessWidget {
  final Trek trek;
  final VoidCallback onTap;

  const FeaturedTrekCard({super.key, required this.trek, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 115,
        child: Stack(
          children: [
            Positioned.fill(
              child: AppImage(trek.image, radius: BorderRadius.circular(18)),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withValues(alpha: 0.65)],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 14,
              bottom: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('Featured',
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                  const SizedBox(height: 6),
                  Text(trek.name,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const Text('The journey of a lifetime',
                      style: TextStyle(color: Colors.white70, fontSize: 11)),
                ],
              ),
            ),
            const Positioned(
              right: 14,
              bottom: 14,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_forward, size: 18, color: AppColors.textDark),
              ),
            ),
          ],
        ),
      ),
    );
  }
}