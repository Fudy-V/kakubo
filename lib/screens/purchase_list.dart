import 'package:flutter/material.dart';

class PurchaseList extends StatefulWidget {
  const PurchaseList({super.key});

  @override
  State<PurchaseList> createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('ここに購入予定品リスト')),
    );
  }
}
