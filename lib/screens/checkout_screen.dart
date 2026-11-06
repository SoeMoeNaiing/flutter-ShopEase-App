import 'package:flutter/material.dart';
import '../state/cart_state.dart';
import '../theme/app_colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartState.instance;
    final lines = cart.lines;
    final orderId = '#SE-${DateTime.now().millisecondsSinceEpoch % 1000000}';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.success,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Order Confirmed',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                    color: AppColors.success, shape: BoxShape.circle),
                child: const Icon(Icons.check, color: Colors.white, size: 64),
              ),
              const SizedBox(height: 24),
              const Text('Payment Successful!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary)),
              const SizedBox(height: 8),
              const Text('Thank you for your order.',
                  style: TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    _row('Order ID', orderId),
                    const SizedBox(height: 10),
                    const Divider(height: 1),
                    const SizedBox(height: 10),
                    ...lines.map((l) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _row(
                            '${l.qty} × ${l.product.name}',
                            '\$${(l.product.price * l.qty).toStringAsFixed(2)}',
                          ),
                        )),
                    const SizedBox(height: 4),
                    const Divider(height: 1),
                    const SizedBox(height: 10),
                    _row('Items', '${cart.totalItems}'),
                    const SizedBox(height: 8),
                    _row('Total', '\$${cart.totalPrice.toStringAsFixed(2)}',
                        bold: true),
                    const SizedBox(height: 8),
                    _row('Status', 'Confirmed ✓'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Back to Home',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(String k, String v, {bool bold = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(k,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.textMuted)),
        ),
        const SizedBox(width: 8),
        Text(v,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.w500,
              color: AppColors.textPrimary,
            )),
      ],
    );
  }
}
