import 'package:flutter/material.dart';
import './home_screen.dart';
import '../widgets/app_image.dart';
import "../themes/app_theme.dart";

class landingScreen extends StatelessWidget {
  const landingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AppImage('assets/images/welcome.jpg'),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF1E5A96).withValues(alpha: 0.6),
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.5),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Icon(Icons.landscape, color: Colors.white, size: 64),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 34, color: Colors.white),
                      children: [
                        TextSpan(text: 'Trek', style: TextStyle(fontWeight: FontWeight.w600)),
                        TextSpan(text: 'Nepal', style: TextStyle(fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Discover  •  Explore  •  Go Further',
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const homeScreen()),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      label: const Text('Get Started', style: TextStyle(fontSize: 16)),
                      icon: const Icon(Icons.arrow_forward, size: 18),
                      iconAlignment: IconAlignment.end,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? ',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      GestureDetector(
                        onTap: () {
                        },
                        child: const Text('Log In',
                            style: TextStyle(
                                color: Color(0xFF4FE3B5),
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}