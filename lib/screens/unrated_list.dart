import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakubo/core/components/list/list.dart';
import 'package:kakubo/core/datasources/models/items.dart';

class UnratedList extends StatefulWidget {
  const UnratedList({super.key});

  @override
  State<UnratedList> createState() => _UnratedListState();
}

class _UnratedListState extends State<UnratedList> {
  List<Items> list = [];

  @override
  void initState() {
    super.initState();
    _loadDataFromHive();
  }

// ここでHiveからリストにデータを引っ張ってる
  void _loadDataFromHive() async {
    final box = await Hive.openBox<Items>('kakubox');

    final items = box.values
        .where((item) => item.isRated == false && item.isPurchased == true);
    setState(() {
      list = items
          .map((item) => {
                'date': item.date.toString().split(' ')[0],
                'itemName': item.item,
                'price': item.price.toString(),
              })
          .cast<Items>()
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: list.isNotEmpty
            ? SampleListView(list, 2)
            : const CircularProgressIndicator(),
      ),
    );
  }
}
