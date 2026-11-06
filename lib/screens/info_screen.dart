import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import '../widgets/app_image.dart';
import '../widgets/app_top_bar.dart';

class InfoScreen extends StatelessWidget {
  final VoidCallback onBack;

  const InfoScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppTopBar(title: 'About Us', showBack: true, onBack: onBack),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
        children: [
          Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: AppImage(
                url: MockData.shopAvatar,
                radius: 60,
                fallbackIcon: Icons.storefront_outlined,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text('ShopEase',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary)),
          ),
          const SizedBox(height: 6),
          const Center(
            child: Text('Your Everyday Marketplace',
                style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 14,
                    fontStyle: FontStyle.italic)),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Text(
              MockData.aboutText,
              style: const TextStyle(
                height: 1.6,
                color: AppColors.textPrimary,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _contactRow(Icons.email_outlined, 'support@shopease.app'),
          _contactRow(Icons.phone_outlined, '+1 (555) 123-4567'),
          _contactRow(Icons.location_on_outlined, '123 Market St, San Francisco, CA'),
          _contactRow(Icons.access_time, 'Mon – Sat, 9:00 AM – 6:00 PM'),
        ],
      ),
    );
  }

  Widget _contactRow(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text,
                style: const TextStyle(color: AppColors.textPrimary)),
          ),
        ],
      ),
    );
  }
}
