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
    {'date': '2024/11/09', 'itemName': 'pencil', 'price': '100'},
    {'date': '2024/11/07', 'itemName': 'eraser', 'price': '120'},
    {'date': '2024/11/07', 'itemName': 'macMiniPCM4chip', 'price': '200000'},
    {'date': '2024/11/07', 'itemName': 'pomodoroTimer', 'price': '1200'},
    {'date': '2024/11/07', 'itemName': 'ChatGPTaccount', 'price': '1200'},
    {'date': '2024/11/07', 'itemName': 'coffee', 'price': '540'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SampleListView(list, 2)),
    );
  }
}
