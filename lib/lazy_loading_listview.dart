import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LazyLoadingListview extends StatefulWidget {
  // const LazyLoadingListview({Key key}) : super(key: key);

  @override
  _LazyLoadingListviewState createState() => _LazyLoadingListviewState();
}

class _LazyLoadingListviewState extends State<LazyLoadingListview> {
  late List myList;
  final ScrollController _scrollController = ScrollController();
  int _currentMax = 10;

  @override
  void initState() {
    super.initState();
    myList = List.generate(10, (i) => "Item : ${i + 1}");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() {
    for (int i = _currentMax; i < _currentMax + 10; i++) {
      myList.add("Item : ${i + 1}");
    }

    _currentMax = _currentMax + 10;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemExtent: 80,
      itemBuilder: (context, i) {
        if (i == myList.length) {
          return const CupertinoActivityIndicator();
        }
        return ListTile(
          title: Text(myList[i]),
        );
      },
      itemCount: myList.length + 1,
    );
  }
}
