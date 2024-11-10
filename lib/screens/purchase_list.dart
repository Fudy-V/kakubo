import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakubo/core/components/inputButton/input_buttton.dart';
import 'package:kakubo/core/components/list/list.dart';
import 'package:kakubo/core/datasources/models/items.dart';

class PurchaseList extends StatelessWidget {
  const PurchaseList({super.key});

  @override
  Widget build(BuildContext context) {
    // final box = Hive.box<Items>('itemsBox'); // Boxの取得

    return Scaffold(
      floatingActionButton: const InputButtton(),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Items>('kakubox').listenable(), // Boxのリスナーを追加
        builder: (context, Box<Items> box, _) {
          // 購入前アイテムだけをフィルタリング
          final purchasedItems =
              box.values.where((item) => item.isPurchased == false).toList();

          return purchasedItems.isEmpty
              ? const Center(child: Text('購入予定アイテムはありません'))
              : SampleListView(
                  purchasedItems
                      .map((item) => {
                            'itemName': item.item,
                            'price': item.price.toString(),
                            'date':
                                item.date.toLocal().toString().split(' ')[0],
                          })
                      .cast<Items>()
                      .toList(),
                  1, // 購入リストの表示
                );
        },
      ),
    );
  }
}
