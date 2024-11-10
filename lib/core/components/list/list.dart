import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakubo/core/datasources/models/items.dart';
import 'package:kakubo/main.dart';

class SampleListView extends StatefulWidget {
  final List<Items> _samplelist;
  final int _screen;

  SampleListView(this._samplelist, this._screen); //これで外のリストを取り込めるようになったはず

  @override
  _SampleListViewState createState() => _SampleListViewState(_samplelist);
}

class _SampleListViewState extends State<SampleListView> {
  _SampleListViewState(this._samplelist);
  List<Items> _samplelist;
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _samplelist.length,
      shrinkWrap: true,
      padding: EdgeInsets.all(10.0),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.add_shopping_cart_outlined),
          title: _buildItemTile(index),
          subtitle: Text(_samplelist[index].date as String),
          selected: _index == index,
          onTap: () {
            _index = index;
            _tapTile();
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  // アイテムタイルの作成
  Widget _buildItemTile(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(_samplelist[index].item),
          Text("${_samplelist[index].price}円"),
        ],
      ),
    );
  }

  // タップ時の処理
  void _tapTile() {
    if (widget._screen == 1) {
      // 購入リストの処理
      _showPurchaseDialog();
    } else if (widget._screen == 2) {
      // 未評価リストの処理
      _showRateDialog();
    } else {
      // 後悔リストの処理
      _showRegretDialog();
    }
  }

  // 購入確認ダイアログ
  void _showPurchaseDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('購入確認'),
          content: const Text('この商品を購入しましたか？'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // setState(() {
                //   _samplelist[_index] = true; // bool型で設定
                // });
                _saveToHive(_index, 'isPurchased', true); // Hiveに保存
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 244, 57, 50),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('購入した'),
            ),
            ElevatedButton(
              onPressed: () {
                // setState(() {
                //   _samplelist[_index]['isPurchased'] = false; // bool型で設定
                // });
                _saveToHive(_index, 'isPurchased', false); // Hiveに保存
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('購入していない'),
            ),
          ],
        );
      },
    );
  }

  // 評価ダイアログ
  void _showRateDialog() {
    double rate = 0;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('後悔度入力'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('後悔度を選択してください。'),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        rate = rating;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '後悔度：$rate',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    //   // _samplelist[_index]['rate'] = 0; // 後悔していない場合
                    // });
                    _saveToHive(_index, 'rate', 0); // Hiveに保存
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('後悔していない'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    //   _samplelist[_index]['rate'] = rate; // 後悔度を決定
                    // });
                    _saveToHive(_index, 'rate', rate); // Hiveに保存
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('後悔度を決定'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // 後悔リストの処理（ここは未実装）
  void _showRegretDialog() {
    print("後悔リスト処理");
  }

  void _saveToHive(int index, String key, dynamic value) {
    var item = _samplelist[index];

    // 更新したいフィールドに応じて新しいItemsインスタンスを生成
    Items updatedItem;
    if (key == 'isPurchased') {
      updatedItem = item.setPurchasedStatus(value as bool);
    } else if (key == 'rate') {
      updatedItem = item.copyWith(rate: value as double);
    } else {
      // その他のキーに応じてcopyWithで更新
      updatedItem = item.copyWith(); // 必要に応じてフィールドを指定
    }

    // 更新したインスタンスを反映し、Hiveに保存
    item = updatedItem;
    box.put(index, updatedItem);
  }
}
