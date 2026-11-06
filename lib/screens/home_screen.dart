import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/product.dart';
import '../theme/app_colors.dart';
import '../widgets/app_top_bar.dart';
import '../widgets/banner_card.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<Product> onOpenProduct;
  final VoidCallback onOpenCart;

  const HomeScreen({
    super.key,
    required this.onOpenProduct,
    required this.onOpenCart,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(viewportFraction: 0.92);
  int _bannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppTopBar(
        title: 'ShopEase',
        showMenu: true,
        onMenu: () {},
        onCartTap: widget.onOpenCart,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                hintStyle: TextStyle(color: AppColors.textMuted),
                prefixIcon: Icon(Icons.search, color: AppColors.textMuted),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 160,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (i) => setState(() => _bannerIndex = i),
              itemCount: MockData.banners.length,
              itemBuilder: (_, i) {
                final b = MockData.banners[i];
                return BannerCard(
                  title: b['title']!,
                  subtitle: b['subtitle']!,
                  image: b['image']!,
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(MockData.banners.length, (i) {
              final active = _bannerIndex == i;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: active ? 18 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: active ? AppColors.primary : AppColors.border,
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text('Popular',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary)),
              const Spacer(),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Showing all products'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('See all',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              mainAxisExtent: 250,
            ),
            itemCount: MockData.products.length,
            itemBuilder: (_, i) {
              final p = MockData.products[i];
              return ProductCard(
                product: p,
                onTap: () => widget.onOpenProduct(p),
              );
            },
          ),
        ],
      ),
    );
  }
}
