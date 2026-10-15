import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BorderRadius? radius;

  const AppImage(this.path, {super.key, this.width, this.height, this.radius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image.asset(
        path,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('AppImage failed to load "$path": $error');
          return Container(
            width: width,
            height: height,
            color: const Color(0xFF9CC3D5),
            child: const Icon(Icons.landscape, color: Colors.white70, size: 40),
          );
        },
      ),
    );
  }
}