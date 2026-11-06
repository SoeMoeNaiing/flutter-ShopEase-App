import 'package:flutter/material.dart';
import '../state/cart_state.dart';
import '../theme/app_colors.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final bool showMenu;
  final VoidCallback? onBack;
  final VoidCallback? onMenu;
  final VoidCallback? onCartTap;

  const AppTopBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.showMenu = false,
    this.onBack,
    this.onMenu,
    this.onCartTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: false,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: onBack ?? () => Navigator.maybePop(context),
            )
          : showMenu
              ? IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: onMenu ?? () {},
                )
              : null,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      actions: [
        AnimatedBuilder(
          animation: CartState.instance,
          builder: (_, __) {
            final count = CartState.instance.totalItems;
            return IconButton(
              onPressed: onCartTap,
              icon: Badge.count(
                count: count,
                isLabelVisible: count > 0,
                backgroundColor: AppColors.accent,
                textColor: Colors.black,
                textStyle: const TextStyle(
                    fontSize: 10, fontWeight: FontWeight.bold),
                child: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
              ),
            );
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
