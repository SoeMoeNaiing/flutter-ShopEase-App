import 'package:flutter/material.dart';
import '../models/product.dart';
import '../state/cart_state.dart';
import '../widgets/bottom_nav.dart';
import 'home_screen.dart';
import 'info_screen.dart';
import 'cart_screen.dart';
import 'checkout_screen.dart';
import 'profile_screen.dart';
import 'product_details_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});
  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _index = 0;

  void _goToTab(int i) => setState(() => _index = i);
  void _goHome() => setState(() => _index = 0);

  Future<void> _openProduct(Product p) async {
    final result = await Navigator.push<ProductDetailsResult>(
      context,
      MaterialPageRoute(builder: (_) => ProductDetailsScreen(product: p)),
    );
    if (result == ProductDetailsResult.openCart && mounted) {
      _goToTab(2);
    }
  }

  Future<void> _openCheckout() async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => const CheckoutScreen()),
    );
    if (result == true) {
      CartState.instance.clear();
      _goHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        onOpenProduct: _openProduct,
        onOpenCart: () => _goToTab(2),
      ),
      InfoScreen(onBack: () => _goToTab(0)),
      CartScreen(onBack: () => _goToTab(0), onCheckout: _openCheckout),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _index, children: pages),
      bottomNavigationBar: BottomNav(currentIndex: _index, onTap: _goToTab),
    );
  }
}
