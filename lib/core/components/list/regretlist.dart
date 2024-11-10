import 'package:flutter/material.dart';
import 'package:kakubo/core/components/list/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class regretListView extends StatefulWidget {
  @override
  regretListView(this._samplelist, this._screen); //これで外のリストを取り込めるようになったはず
  final List<Map<String, dynamic>> _samplelist;
  final int _screen;
  _regretListViewState createState() => _regretListViewState(_samplelist);
}

class _regretListViewState extends State<regretListView> {
  _regretListViewState(this._samplelist);
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
                    Text(_samplelist[index]["price"] + "円"),
                    RatingBar.builder(
                      itemBuilder: (context, index) => const Icon(Icons.star),
                      onRatingUpdate: (rating) {
                        //評価が更新されたときの処理を書く
                      },
                      allowHalfRating: true,
                      initialRating: _samplelist[index]["rate"],
                    ),
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
    print(_index);
  }
}
