import 'package:flutter/material.dart';
import 'package:kakubo/core/components/list/list.dart';

class PurchaseList extends StatefulWidget {
  const PurchaseList({super.key});

  @override
  State<PurchaseList> createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SampleListView()),
    );
  }
}
