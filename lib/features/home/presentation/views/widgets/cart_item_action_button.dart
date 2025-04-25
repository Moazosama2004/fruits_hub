import 'package:flutter/material.dart';

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    required this.backgroundColor,
    required this.iconColor,
    required this.onTap,
    required this.icon,
  });
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: FittedBox(child: Icon(icon, color: iconColor)),
        ),
      ),
    );
  }
}
