import 'package:flutter/material.dart';
import 'package:kakubo/core/components/inputButton/input_buttton.dart';
import 'package:kakubo/core/components/list/list.dart';
import 'package:kakubo/main.dart';
import 'package:kakubo/core/datasources/models/items.dart';

class PurchaseList extends StatefulWidget {
  const PurchaseList({super.key});

  @override
  State<PurchaseList> createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseList> {
  //サンプルのデータです
  List<Map<String, dynamic>> list = [
    {'date': '2024/11/09', 'itemName': 'pencil', 'price': '100'},
    {'date': '2024/11/07', 'itemName': 'eraser', 'price': '120'},
    {'date': '2024/11/07', 'itemName': 'macMiniPCM4chip', 'price': '200000'},
    {'date': '2024/11/07', 'itemName': 'pomodoroTimer', 'price': '1200'},
    {'date': '2024/11/07', 'itemName': 'ChatGPTaccount', 'price': '1200'},
    {'date': '2024/11/07', 'itemName': 'coffee', 'price': '540'}
  ];

  @override
  initState() {
    box.watch().listen((event) {
      final Items newItems = event.value;
      if (newItems.isPurchased == false) {
        list.add({
          'date': newItems.date.toString().split(' ')[0],
          'itemName': newItems.item.toString(),
          'price': newItems.price.toString()
        });
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const InputButtton(),
      body: Center(
          child: SampleListView(
        list,
        1,
      )),
    );
  }
}
