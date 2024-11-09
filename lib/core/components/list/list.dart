import 'package:flutter/material.dart';

class SampleListView extends StatefulWidget {
  @override
  SampleListView(this._samplelist, this._screen); //これで外のリストを取り込めるようになったはず
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
      //perchace_list process
    } else if (widget._screen == 2) {
      //unrated_list process
    } else {
      //regret_list process
    }
    //タップされたときの挙動。データを受け渡して評価シーンに遷移したい。
    print(_index);
  }
}
