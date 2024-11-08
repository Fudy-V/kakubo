import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakubo/core/datasources/models/items.dart';

class ItemListView extends StatelessWidget {
  final Box<Items> itemBox;
  final bool showRatingIcon;
  final bool showDelateButton;

  const ItemListView({
    Key? key,
    required this.itemBox,
    this.showRatingIcon = false,
    this.showDelateButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        listenable: itemBox.listenable(),
        builder: (context, Box<Items> box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('買いたいものはあるかな？？'));
          }
        });

    throw UnimplementedError();
  }
}
