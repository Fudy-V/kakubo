import 'package:flutter/material.dart';
import 'package:kakubo/core/components/list/list.dart';
// import 'package:kakubo/core/datasources/models/items.dart';
// import 'package:kakubo/main.dart';

class UnratedList extends StatefulWidget {
  const UnratedList({super.key});

  @override
  State<UnratedList> createState() => _UnratedListState();
}

class _UnratedListState extends State<UnratedList> {
  //サンプルのデータです
  final List<Map<String, dynamic>> list = [
    {'date': '2024/11/09', 'itemName': 'うまい棒', 'price': '100'},
    {'date': '2024/11/07', 'itemName': 'iPhone15', 'price': '120000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SampleListView(
        list,
        2,
      )),
    );
  }
}
