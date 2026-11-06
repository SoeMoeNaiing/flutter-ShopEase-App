import 'package:flutter/material.dart';
import '../models/product.dart';
import '../state/cart_state.dart';
import '../theme/app_colors.dart';
import '../widgets/app_image.dart';
import '../widgets/app_top_bar.dart';
import '../widgets/qty_selector.dart';

enum ProductDetailsResult { openCart }

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppTopBar(
        title: 'Product Details',
        showBack: true,
        onCartTap: () =>
            Navigator.pop(context, ProductDetailsResult.openCart),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: AppImage(url: p.image, radius: 12),
                  ),
                ),
                const SizedBox(height: 16),
                Text(p.name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text('\$${p.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary)),
                    const SizedBox(width: 12),
                    const Icon(Icons.star, color: AppColors.accent, size: 18),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '${p.rating.toStringAsFixed(1)} (${p.reviews} reviews)',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: AppColors.textMuted, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                const Text('Description',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 6),
                Text(p.description,
                    style: const TextStyle(
                        color: AppColors.textMuted,
                        height: 1.5,
                        fontSize: 14)),
                const SizedBox(height: 18),
                Row(
                  children: [
                    const Text('Quantity',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    const Spacer(),
                    QtySelector(
                      qty: _qty,
                      onMinus: () =>
                          setState(() => _qty = _qty > 1 ? _qty - 1 : 1),
                      onPlus: () => setState(() => _qty++),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            decoration: const BoxDecoration(
              color: AppColors.surface,
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primary),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () {
                        CartState.instance.add(p, qty: _qty);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '$_qty × ${p.name} added to cart'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      child: const Text('Add to Cart',
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () {
                        CartState.instance.add(p, qty: _qty);
                        Navigator.pop(context, ProductDetailsResult.openCart);
                      },
                      child: const Text('Buy Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
