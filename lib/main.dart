import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_demos_gallery/pages/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage()
    );
  }
}
