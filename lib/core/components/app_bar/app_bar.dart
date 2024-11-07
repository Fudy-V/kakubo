import 'package:flutter/material.dart';

class CustomPreferredSize extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomPreferredSize({
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
    return const Size(double.infinity, 100.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 23,
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 248, 249, 249),
            Color.fromARGB(255, 53, 176, 242),
          ]),
        ),
      ),
      bottom: const TabBar(tabs: <Widget>[
        Text(
          softWrap: false,
          overflow: TextOverflow.visible,
          '購入予定品',
        ),
        Text(
          softWrap: false,
          overflow: TextOverflow.visible,
          '未評価',
        ),
        Text(
          softWrap: false,
          overflow: TextOverflow.visible,
          '後悔度',
        ),
      ]),
    );
  }
}
