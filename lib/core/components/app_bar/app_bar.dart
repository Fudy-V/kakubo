import 'package:flutter/material.dart';

class PreferredSize extends StatelessWidget implements PreferredSizeWidget {
  const PreferredSize({
    super.key,
    required this.child,
    required this.preferredSize,
  });

  final Widget child;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) => child;
}

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({required this.title, super.key});
  final String title;

  @override
  Size get preferredSize {
    return const Size(double.infinity, 50.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 63, 62, 62),
          fontSize: 23,
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 181, 179, 179),
            Color.fromARGB(255, 110, 109, 109),
          ]),
        ),
      ),
    );
  }
}
