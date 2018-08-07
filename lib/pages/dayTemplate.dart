import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Day1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('A stopwatch'),
      ),
      body: Container(
        child: Center(
          child: Text('test'),
        )
      ),
    );
  }
}