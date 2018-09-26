import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_demos_gallery/utils/flutter_icon_icons.dart';
import 'package:flutter_demos_gallery/pages/day0.dart';
import 'package:flutter_demos_gallery/pages/day1.dart';
import 'package:flutter_demos_gallery/pages/day2.dart';
import 'package:flutter_demos_gallery/pages/day3.dart';
import 'package:flutter_demos_gallery/pages/day5.dart';
import 'package:flutter_demos_gallery/pages/day6.dart';
import 'package:flutter_demos_gallery/pages/day7.dart';
import 'package:flutter_demos_gallery/pages/day8.dart';
import 'package:flutter_demos_gallery/pages/day9.dart';
import 'package:flutter_demos_gallery/pages/day10.dart';
import 'package:flutter_demos_gallery/pages/day11.dart';
import 'package:flutter_demos_gallery/pages/day12.dart';
import 'package:flutter_demos_gallery/pages/day13.dart';


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
          menuIcons(context, Icon(FontAwesomeIcons.contao, size: 48.0, color: Color(0xFFFF9A05)), 'Day4' ,Day0Page()),
          menuIcons(context, Icon(Icons.pin_drop, size: 48.0, color: Color(0xFF00D204)), 'Day5' ,Day5Page()),
          menuIcons(context, Icon(FontAwesomeIcons.spotify, size: 48.0, color: Color(0xFF777777)), 'Day6' ,Day6Page()),
          menuIcons(context, Icon(FontAwesomeIcons.baseballBall, size: 48.0, color: Color(0xFF5E2A06)), 'Day7' ,Day7Page()),
          menuIcons(context, Icon(FontAwesomeIcons.google, size: 48.0, color: Color(0xFF4285F4)), 'Day8' ,Day8Page()),
          menuIcons(context, Icon(FontAwesomeIcons.twitterSquare, size: 48.0, color: Color(0xFF2AA2EF)), 'Day9' ,Day9Page()),
          menuIcons(context, Icon(FontAwesomeIcons.tumblr, size: 48.0, color: Color(0xFF37465C)), 'Day10' ,Day10Page()),
          menuIcons(context, Icon(Icons.filter_b_and_w, size: 48.0, color: Color(0xFF2F3600)), 'Day11' ,Day11Page()),
          menuIcons(context, Icon(FontAwesomeIcons.chartBar, size: 48.0, color: Color(0xFFFD8F9D)), 'Day12' ,Day12Page()),
          menuIcons(context, Icon(Icons.chat, size: 48.0, color: Color(0xFF83709D)), 'Day13' ,Day13Page()),

        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}