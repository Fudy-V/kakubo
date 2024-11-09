import 'package:flutter/material.dart';

class SampleListView extends StatefulWidget {
  @override
  _SampleListViewState createState() => _SampleListViewState();
}

class _SampleListViewState extends State<SampleListView> {
  //_sampleListの中にサンプルデータ。これをこのクラス外部と受け渡す方法を実装したい
  List<Map<String, dynamic>> _samplelist = [
    {'date': '2024/11/09', 'itemName': 'pencil', 'price': '100'},
    {'date': '2024/11/07', 'itemName': 'eraser', 'price': '120'},
    {'date': '2024/11/07', 'itemName': 'macMiniPCM4chip', 'price': '200000'},
    {'date': '2024/11/07', 'itemName': 'pomodoroTimer', 'price': '1200'},
    {'date': '2024/11/07', 'itemName': 'ChatGPTaccount', 'price': '1200'},
    {'date': '2024/11/07', 'itemName': 'coffee', 'price': '540'}
  ];
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
    //タップされたときの挙動。データを受け渡して評価シーンに遷移したい。
    print(_index);
  }
}
