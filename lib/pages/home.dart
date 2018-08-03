import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_demos_gallery/utils/flutter_icon_icons.dart';
import 'package:flutter_demos_gallery/pages/day1.dart';
import 'package:flutter_demos_gallery/pages/day2.dart';
import 'package:flutter_demos_gallery/pages/day3.dart';

class HomePage extends StatelessWidget {
  Widget menuIcons (BuildContext context, Icon icon,String title, Widget nextPage) {
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
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child:  Text(
                  title
                )
              )
            ],
          )
          
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
          menuIcons(context, Icon(FontAwesomeIcons.stopwatch, size: 48.0, color: Color(0xFFFF856C)), 'Day1' ,Day1Page()),
          menuIcons(context, Icon(FlutterIcon.cloud_sun_inv, size: 48.0, color: Color(0xFF90BDC1)), 'Day2' ,Day2Page()),
          menuIcons(context, Icon(FontAwesomeIcons.twitter, size: 48.0, color: Color(0xFF2AA2EF)), 'Day3' ,Day3Page()),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}