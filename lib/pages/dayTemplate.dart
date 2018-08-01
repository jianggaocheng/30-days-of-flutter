import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Day1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new CupertinoNavigationBar(
        middle: new Text('A stopwatch'),
      ),
      body: new Container(
        child: new Center(
          child: new Text('test'),
        )
      ),
    );
  }
}