import 'package:flutter/material.dart';

// 下の青線に詳細は書くけど、この青線は「main.dartの呼び出し元にconstつけろ」やけど無視でok
class PurchaseList extends StatefulWidget {
  @override
  State<PurchaseList> createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('ここに購入予定品リスト'),
    );
  }
}
