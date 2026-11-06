import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../theme/app_colors.dart';
import '../widgets/app_image.dart';
import '../widgets/app_top_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppTopBar(title: 'Profile'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 72,
                  height: 72,
                  child: AppImage(
                    url: MockData.userAvatar,
                    radius: 36,
                    fallbackIcon: Icons.person_outline,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Alex Morgan',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('alex.morgan@shopease.app',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.white70, fontSize: 13)),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.verified,
                              color: AppColors.accent, size: 14),
                          SizedBox(width: 4),
                          Text('Premium Member',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(child: _StatCard(value: '12', label: 'Orders')),
              SizedBox(width: 12),
              Expanded(child: _StatCard(value: '3', label: 'Wishlist')),
              SizedBox(width: 12),
              Expanded(child: _StatCard(value: '4.9', label: 'Rating')),
            ],
          ),
          const SizedBox(height: 20),
          _section('Account'),
          _tile(Icons.person_outline, 'Edit Profile'),
          _tile(Icons.location_on_outlined, 'Shipping Addresses'),
          _tile(Icons.credit_card, 'Payment Methods'),
          _tile(Icons.receipt_long_outlined, 'Order History'),
          const SizedBox(height: 12),
          _section('Preferences'),
          _tile(Icons.notifications_outlined, 'Notifications'),
          _tile(Icons.lock_outline, 'Privacy & Security'),
          _tile(Icons.help_outline, 'Help & Support'),
          const SizedBox(height: 12),
          _section('More'),
          _tile(Icons.info_outline, 'About ShopEase'),
          _tile(Icons.logout, 'Log Out', color: Colors.redAccent),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _section(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 8),
        child: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.textMuted)),
      );

  Widget _tile(IconData icon, String title, {Color? color}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: ListTile(
        leading: Icon(icon, color: color ?? AppColors.primary),
        title: Text(title,
            style: TextStyle(
                color: color ?? AppColors.textPrimary,
                fontWeight: FontWeight.w500)),
        trailing: Icon(Icons.chevron_right, color: color ?? AppColors.textMuted),
        onTap: () {},
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary)),
          const SizedBox(height: 4),
          Text(label,
              style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
        ],
      ),
    );
  }
}
