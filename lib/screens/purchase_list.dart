import 'package:flutter/material.dart';
import 'package:kakubo/core/components/app_bar/app_bar.dart';

// 下の青線に詳細は書くけど、この青線は「main.dartの呼び出し元にconstつけろ」やけど無視でok
class PurchaseList extends StatefulWidget {
  @override
  State<PurchaseList> createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseList> {
  @override
  Widget build(BuildContext context) {
    // 下の青線は「constつけろ」やけど、つけるとタイトル変えられなくなってコンポーネント化の意味無くなるから無視でok
    return Scaffold(appBar: AppBarComponent(title: '購入品リスト'));
  }
}
