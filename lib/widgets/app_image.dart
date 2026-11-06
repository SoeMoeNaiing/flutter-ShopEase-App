import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Drop-in replacement for Image.network that never leaves the UI blank:
/// - shows a subtle loader while fetching
/// - on error shows a soft gradient + icon placeholder
class AppImage extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final double? width;
  final double? height;
  final double radius;
  final IconData fallbackIcon;

  const AppImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.radius = 0,
    this.fallbackIcon = Icons.image_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        url,
        fit: fit,
        width: width,
        height: height,
        // shorter timeouts on slow networks
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            width: width,
            height: height,
            color: AppColors.border,
            alignment: Alignment.center,
            child: const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stack) => Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.border, Color(0xFFF3F0FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          alignment: Alignment.center,
          child: Icon(fallbackIcon, color: AppColors.textMuted, size: 32),
        ),
      ),
    );
  }
}
