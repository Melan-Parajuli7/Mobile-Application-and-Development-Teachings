import 'package:flutter/material.dart';
import '../models/trek.dart';
import '../widgets/app_image.dart';
import '../themes/app_color.dart';
import '../widgets/trek_stat_item.dart';
import '../widgets/booking_card.dart';

class TripDetailsScreen extends StatelessWidget {
  final Trek trek;

  const TripDetailsScreen({super.key, required this.trek});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _header(context),
                  Transform.translate(
                    offset: const Offset(0, -24),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                      ),
                      child: _content(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: BookingCard(price: trek.price, onBook: () {}),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    final top = MediaQuery.of(context).padding.top + 8;
    return SizedBox(
      height: 280,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AppImage(trek.image),
          Positioned(
            top: top,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Positioned(
            top: top,
            right: 16,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.favorite_border, color: AppColors.textDark),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 36,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(trek.difficulty,
                  style: const TextStyle(color: Colors.white, fontSize: 11)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(trek.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on_outlined, size: 15, color: AppColors.primary),
            Text(' ${trek.country}   ',
                style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
            const Icon(Icons.star, size: 15, color: AppColors.star),
            Text(' ${trek.rating} (${trek.reviews})',
                style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
          ],
        ),
        const Divider(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TrekStatItem(
                icon: Icons.calendar_today_outlined,
                value: trek.duration,
                label: 'Duration'),
            TrekStatItem(icon: Icons.terrain, value: trek.difficulty, label: 'Difficulty'),
            TrekStatItem(icon: Icons.access_time, value: trek.bestTime, label: 'Best Time'),
          ],
        ),
        const Divider(height: 28),
        const Text('Overview',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(trek.overview,
            style: const TextStyle(fontSize: 13, color: AppColors.textGrey, height: 1.5)),
        const SizedBox(height: 18),
        const Text('Highlights',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        for (final h in trek.highlights)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: [
                const Icon(Icons.check, size: 16, color: AppColors.primary),
                const SizedBox(width: 8),
                Expanded(child: Text(h, style: const TextStyle(fontSize: 13))),
              ],
            ),
          ),
      ],
    );
  }
}