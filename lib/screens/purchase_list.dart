import 'package:flutter/material.dart';
import 'package:kakubo/core/components/inputButton/input_buttton.dart';
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
      floatingActionButton: const InputButtton(),
      body: Center(child: SampleListView()),
    );
  }
}

class _purchaseList extends SampleListView {
  @override
  void _tapTile() {
    //write process here
  }
}
