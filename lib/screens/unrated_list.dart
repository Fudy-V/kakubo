import 'package:flutter/material.dart';
import 'package:kakubo/core/components/list/list.dart';

class UnratedList extends StatefulWidget {
  const UnratedList({super.key});

  @override
  State<UnratedList> createState() => _UnratedListState();
}

class _UnratedListState extends State<UnratedList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('ここに未評価リスト')),
    );
  }
}

class _purchaseList extends SampleListView {
  @override
  void _tapTile() {
    //write process here
  }
}
