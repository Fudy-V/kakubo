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
  List<Map<String, dynamic>> list = [];

  @override
  void initState() {
    super.initState();
    _loadDataFromHive();
  }

// ここでHiveからリストにデータを引っ張ってる
  Future<void> _loadDataFromHive() async {
    final box = await Hive.openBox<Items>('itemsBox');

    final items = box.values.where((item) => item.isRated == false);
    setState(() {
      list = items
          .map((item) => {
                'date': item.date.toString().split(' ')[0],
                'itemName': item.item,
                'price': item.price.toString(),
              })
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
