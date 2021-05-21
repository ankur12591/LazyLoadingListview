import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class LazyLoadingWithPackage extends StatefulWidget {
  @override
  _LazyLoadingWithPackageState createState() => _LazyLoadingWithPackageState();
}

class _LazyLoadingWithPackageState extends State<LazyLoadingWithPackage> {
  List<int> data = [];
  int currentLength = 0;

  final int increment = 10;
  bool isLoading = false;

  @override
  void initState() {
    _loadMore();
    super.initState();
  }

  Future _loadMore() async {
    setState(() {
      isLoading = true;
      const CupertinoActivityIndicator();
    });

    // Add in an artificial delay
    await Future.delayed(const Duration(seconds: 2));
    for (var i = currentLength; i <= currentLength + increment; i++) {
      data.add(i);
      //const CupertinoActivityIndicator();

    }
    setState(() {
      isLoading = false;
      currentLength = data.length;
      // if(currentLength == data.length) {
      //    const CupertinoActivityIndicator();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
      isLoading: isLoading,
      onEndOfPage: () => _loadMore(),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, position) {
          if (position == data.length) {
            return CupertinoActivityIndicator();
          }
          return DemoItem(position: position);
        },
      ),
    );
  }
}

class DemoItem extends StatelessWidget {
  final int position;

  const DemoItem({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.deepOrange,
                  height: 40.0,
                  width: 40.0,
                ),
                const SizedBox(width: 8.0),
                Text("Item $position"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text("This is Lazy Loading working test"),
            ),
          ],
        ),
      ),
    );
  }
}
