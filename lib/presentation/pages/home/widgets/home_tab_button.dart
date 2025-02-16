import 'package:flutter/material.dart';

class HomeTabButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final VoidCallback onPressed;

  const HomeTabButton({
    super.key,
    required this.text,
    required this.icon,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isActive
        ? FilledButton.icon(
            onPressed: onPressed,
            label: Text(text),
            icon: Icon(icon),
          )
        : OutlinedButton(
            onPressed: onPressed,
            child: Text(text),
          );
  }
}
