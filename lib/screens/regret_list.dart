import 'package:flutter/material.dart';
import 'package:kakubo/core/components/list/list.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RegretList extends StatefulWidget {
  const RegretList({super.key});

  @override
  State<RegretList> createState() => _RegretListState();
}

class _RegretListState extends State<RegretList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('ここに後悔リスト')),
    );
  }
}
