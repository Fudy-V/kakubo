import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kakubo/core/datasources/models/items.dart';

class InputItems extends StatefulWidget {
  const InputItems({super.key});

  @override
  State<InputItems> createState() => _InputItemsState();
}

class _InputItemsState extends State<InputItems> {
  final TextEditingController itemController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final FocusNode itemFocusNode = FocusNode();
  final FocusNode priceFocusNode = FocusNode();

  // フォームのキー　validatorでtextfieldが空とかnullの時の処理が記述可能
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void addList() {
    final String itemName = itemController.text;
    final int? itemPrice = int.tryParse(priceController.text);
    if (itemPrice == null) {
      // 金額が無効な場合のエラーハンドリング
      print('無効な金額が入力されました');
      return;
    }
    final DateTime currentDate = DateTime.now();
    final newItem = Items(
      item: itemName,
      price: itemPrice,
      date: currentDate, // 日付を追加
    );
    final box = Hive.box('aaa');
    box.add(newItem);
    print('商品名: $itemName');
    print('金額: $itemPrice');
    print('日付: $currentDate');
  }

  void submition() {
    if (_formKey.currentState?.validate() ?? false) {
      addList();
      Navigator.pop(context); // 入力フォームを閉じる
    }
  }

  @override
  void dispose() {
    itemController.dispose();
    priceController.dispose();
    itemFocusNode.dispose();
    priceFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets, // キーボードの表示に合わせて調整
      duration: const Duration(milliseconds: 100),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: 400.0,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('商品名', style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: itemController,
                  focusNode: itemFocusNode,
                  decoration: const InputDecoration(hintText: '商品名を入力'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '商品名を入力してください';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text, // 日本語入力用
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(priceFocusNode);
                  },
                ),
                const SizedBox(height: 16),
                const Text('金額', style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: priceController,
                  focusNode: priceFocusNode,
                  decoration: const InputDecoration(hintText: '金額を入力'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '金額を入力してください';
                    }
                    if (int.tryParse(value) == null) {
                      return '有効な金額を入力してください';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => submition(),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, bottom: 20.0),
                    child: ElevatedButton(
                      onPressed: submition,
                      child: const Text('完了'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
