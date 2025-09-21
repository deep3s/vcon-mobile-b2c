import 'package:flutter/material.dart';

class AppBarWithThemeToggle extends StatelessWidget {
  final VoidCallback onToggle;

  const AppBarWithThemeToggle({super.key, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Salon List'),
      actions: [
        IconButton(
          icon: const Icon(Icons.brightness_6),
          onPressed: onToggle,
        ),
      ],
    );
  }
}
