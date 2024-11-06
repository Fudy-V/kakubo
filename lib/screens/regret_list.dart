import 'package:flutter/material.dart';

// 下の青線に詳細は書くけど、この青線は「呼び出し元にconstつけろ」やけど無視でok
class RegretList extends StatefulWidget {
  @override
  State<RegretList> createState() => _RegretListState();
}

class _RegretListState extends State<RegretList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('ここに後悔リスト'),
    );
  }
}
