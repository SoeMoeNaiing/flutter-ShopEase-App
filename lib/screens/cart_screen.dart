import 'package:flutter/material.dart';
import '../state/cart_state.dart';
import '../theme/app_colors.dart';
import '../widgets/app_image.dart';
import '../widgets/app_top_bar.dart';

class CartScreen extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onCheckout;
  const CartScreen({super.key, required this.onBack, required this.onCheckout});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CartState.instance,
      builder: (context, _) {
        final cart = CartState.instance;
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppTopBar(
            title: 'My Cart',
            showBack: true,
            onBack: onBack,
            onCartTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("You're already in the cart"),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
          body: cart.isEmpty ? _emptyState() : _cartList(context, cart),
        );
      },
    );
  }

  Widget _emptyState() => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.shopping_cart_outlined,
                  size: 72, color: AppColors.textMuted),
              SizedBox(height: 16),
              Text('Your cart is empty',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary)),
              SizedBox(height: 6),
              Text('Tap a product on Home to see it here',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textMuted)),
            ],
          ),
        ),
      );

  Widget _cartList(BuildContext context, CartState cart) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: cart.lines.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, i) {
              final line = cart.lines[i];
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 84,
                      height: 84,
                      child: AppImage(url: line.product.image, radius: 12),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  line.product.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: AppColors.textPrimary),
                                ),
                              ),
                              InkWell(
                                onTap: () => cart.remove(line.product),
                                borderRadius: BorderRadius.circular(20),
                                child: const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.delete_outline,
                                      size: 20, color: AppColors.textMuted),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text('\$${line.product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              _qtyBtn(Icons.remove,
                                  () => cart.decrement(line.product)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text('${line.qty}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ),
                              _qtyBtn(
                                  Icons.add, () => cart.increment(line.product)),
                              const Spacer(),
                              Text(
                                '\$${(line.product.price * line.qty).toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        _bottomBar(context, cart),
      ],
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, size: 16, color: AppColors.primary),
        ),
      );

  Widget _bottomBar(BuildContext context, CartState cart) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  '${cart.totalItems} item${cart.totalItems == 1 ? "" : "s"}',
                  style: const TextStyle(color: AppColors.textMuted),
                ),
                const Spacer(),
                const Text('Total  ',
                    style: TextStyle(color: AppColors.textMuted)),
                Text('\$${cart.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary)),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: onCheckout,
                child: const Text('Checkout',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
