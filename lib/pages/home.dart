import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_demos_gallery/pages/day1.dart';

class HomePage extends StatelessWidget {
  Widget menuIcons (BuildContext context, IconData iconData ,Widget nextPage) {
    return new Container(
      decoration: new BoxDecoration(
        border: new BorderDirectional(
          bottom: const BorderSide(color: const Color(0xFFCCCCCC)), 
          end: const BorderSide(color: const Color(0xFFCCCCCC)), 
        )
      ),
      child: new InkWell(
        onTap: (){
          Navigator.of(context).push(new CupertinoPageRoute<bool>(
            builder: (BuildContext context) => nextPage,
          ),);
        },
        child: new Center(
          child: new Icon(iconData, size: 40.0,),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new CupertinoNavigationBar(
        middle: const Text('Flutter Demos Gallery'),
      ),
      body: new GridView.count(
        primary: false,
        crossAxisCount: 3,
        children: <Widget>[
          menuIcons(context, Icons.alarm, new Day1Page())
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}