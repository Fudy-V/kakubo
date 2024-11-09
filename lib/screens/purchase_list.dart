import 'package:flutter/material.dart';
import 'package:kakubo/core/components/list/list.dart';
import 'package:kakubo/features/input/entries/input.dart';

class PurchaseList extends StatefulWidget {
  const PurchaseList({super.key});

  @override
  State<PurchaseList> createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext context) {
              return const InputItems();
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: Center(child: SampleListView()),
    );
  }
}
