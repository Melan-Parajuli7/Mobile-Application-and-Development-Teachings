import 'package:flutter/material.dart';
import '../datas/sample_treks.dart';
import '../models/trek.dart';
import '../themes/app_color.dart';
import '../widgets/category_items.dart';
import '../widgets/freatured_trek_card.dart';
import '../widgets/popular_destination_card.dart';
import '../widgets/recommend_trek_card.dart';
import '../widgets/section_header.dart';
import 'trip_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tab = 0;

  void _open(Trek trek) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TripDetailsScreen(trek: trek)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good Morning,', style: TextStyle(fontSize: 14)),
                    Text('Melan Dada',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none, size: 26)),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search treks, destinations, or places...',
                hintStyle: const TextStyle(fontSize: 13, color: AppColors.textGrey),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFFF1F3F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            FeaturedTrekCard(trek: everest, onTap: () => _open(everest)),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryItem(
                    icon: Icons.terrain, label: 'Trekking', color: Color(0xFF0F8F6F)),
                CategoryItem(icon: Icons.map, label: 'Tours', color: Color(0xFF2D7FF9)),
                CategoryItem(icon: Icons.hotel, label: 'Hotels', color: Color(0xFFFF8A3D)),
                CategoryItem(
                    icon: Icons.explore, label: 'Explore', color: Color(0xFF8E4DFF)),
              ],
            ),
            const SizedBox(height: 22),
            SectionHeader(
                title: 'Popular Destinations', actionText: 'See All', onAction: () {}),
            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: popularTreks.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, i) => PopularDestinationCard(
                  trek: popularTreks[i],
                  onTap: () => _open(popularTreks[i]),
                ),
              ),
            ),
            const SizedBox(height: 22),
            const SectionHeader(title: 'Recommended For You'),
            const SizedBox(height: 12),
            for (final t in recommendedTreks)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: RecommendedTrekCard(trek: t, onTap: () => _open(t)),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab,
        onTap: (i) => setState(() => _tab = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textGrey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}