import 'package:flutter/material.dart';
import 'package:kakubo/core/components/app_bar/app_bar.dart';

// 下の青線に詳細は書くけど、この青線は「呼び出し元にconstつけろ」やけど無視でok
class UnratedList extends StatefulWidget {
  @override
  State<UnratedList> createState() => _UnratedListState();
}

class _UnratedListState extends State<UnratedList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('ここに未評価リスト'),
    );
  }
}
