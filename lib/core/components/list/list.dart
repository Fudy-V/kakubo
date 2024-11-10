import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SampleListView extends StatefulWidget {
  @override
  SampleListView(
    this._samplelist,
    this._screen,
  ); //これで外のリストを取り込めるようになったはず
  final List<Map<String, dynamic>> _samplelist;
  final int _screen;

  _SampleListViewState createState() => _SampleListViewState(_samplelist);
}

class _SampleListViewState extends State<SampleListView> {
  _SampleListViewState(this._samplelist);
  List<Map<String, dynamic>> _samplelist;
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int numberOfColumn = _samplelist.length;
    return ListView.separated(
      itemCount: numberOfColumn,
      shrinkWrap: true,
      padding: EdgeInsets.all(10.0),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.add),
          title: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                //border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5),
                /*boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0,5)
                    )
                  ]*/
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_samplelist[index]["itemName"]),
                    Text(_samplelist[index]["price"] + "円")
                  ])),
          subtitle: Text(_samplelist[index]["date"]),
          selected: _index == index,
          onTap: () {
            //ここにタップされたときのデータの受け渡しを記述したい。
            _index = index;
            _tapTile();
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  void _tapTile() {
    if (widget._screen == 1) {
      // purchase_list process
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('購入確認'),
            content: const Text('この商品を購入しましたか？'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _samplelist.removeAt(_index); // モックデータからアイテムを削除
                    _samplelist[_index]['isPurchased'] = true;
                  });
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
                  setState(() {
                    _samplelist[_index]['isPurchased'] = false;
                  });
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
    } else if (widget._screen == 2) {
      // unrated_list process
      showDialog(
        context: context,
        builder: (BuildContext context) {
          double rate = 0;
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
                      setState(() {
                        rate = 0;
                        _samplelist[_index]['rate'] = rate;
                      });
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
                      setState(() {
                        _samplelist[_index]['rate'] = rate;
                      });
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
    } else {
      // regret_list process
    }
    print(_index);
  }
}
