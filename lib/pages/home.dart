import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_demos_gallery/pages/day1.dart';
import 'package:flutter_demos_gallery/pages/day2.dart';

class HomePage extends StatelessWidget {
  Widget menuIcons (BuildContext context, IconData iconData ,Widget nextPage) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: const BorderSide(color: const Color(0xFFCCCCCC)), 
          end: const BorderSide(color: const Color(0xFFCCCCCC)), 
        )
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(CupertinoPageRoute<bool>(
            builder: (BuildContext context) => nextPage,
          ),);
        },
        child: Center(
          child: Icon(iconData, size: 40.0,),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('Flutter Demos Gallery'),
      ),
      body: GridView.count(
        primary: false,
        crossAxisCount: 3,
        children: <Widget>[
          menuIcons(context, const IconData(0xf2FD, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), Day1Page()),
          menuIcons(context, const IconData(0xf475, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage), Day2Page())
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}