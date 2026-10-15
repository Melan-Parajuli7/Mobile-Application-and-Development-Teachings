import 'package:flutter/material.dart';
import '../themes/app_color.dart';

class BookingCard extends StatelessWidget {
  final int price;
  final VoidCallback onBook;

  const BookingCard({super.key, required this.price, required this.onBook});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5F1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('From',
                  style: TextStyle(fontSize: 11, color: AppColors.textGrey)),
              Text('\$$price',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.dark)),
              const Text('per person',
                  style: TextStyle(fontSize: 11, color: AppColors.textGrey)),
            ],
          ),
          ElevatedButton.icon(
            onPressed: onBook,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.dark,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            ),
            label: const Text('Book Now'),
            icon: const Icon(Icons.arrow_forward, size: 16),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }
}