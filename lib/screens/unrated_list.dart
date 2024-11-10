import 'package:flutter/material.dart';
import 'package:kakubo/core/components/list/list.dart';

class UnratedList extends StatefulWidget {
  const UnratedList({super.key});

  @override
  State<UnratedList> createState() => _UnratedListState();
}

class _UnratedListState extends State<UnratedList> {
  //サンプルのデータです
  final List<Map<String, dynamic>> list = [
    {'date': '2024/11/09', 'itemName': 'iphone15', 'price': '200000'},
    {'date': '2024/11/07', 'itemName': 'umaibou', 'price': '110'},
    {'date': '2024/11/07', 'itemName': 'pro controller', 'price': '5000'},
    {'date': '2024/11/07', 'itemName': 'pomodoroTimer', 'price': '1200'},
    {'date': '2024/11/07', 'itemName': 'gamble', 'price': '120000'},
    {'date': '2024/11/07', 'itemName': 'tissue', 'price': '300'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SampleListView(list, 2)),
    );
  }
}
