import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/lazy_load_with_package.dart';
import 'package:lazy_loading_listview/lazy_loading_listview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:
            LazyLoadingListview(),

            //LazyLoadingWithPackage(),
      ),
    );
  }
}
