import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_simple_video_player/flutter_simple_video_player.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Day6Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          IgnorePointer(
            child: Container(
              child: AssetVideo("assets/moments.mp4"),
            )
          ),
          Positioned(
            top: 80.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(FontAwesomeIcons.spotify, size: 60.0, color: Colors.white,),
                ),
                Container(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Text('Spotify', style: TextStyle(fontSize: 35.0, color: Colors.white, fontWeight: FontWeight.w700)),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 90.0,
            left: 0.0,
            right: 0.0,
            height: 90.0,
            child: Container(
              height: 100.0,
              alignment: Alignment.bottomCenter,
              child: Swiper(
                autoplay: true,
                autoplayDelay: 3000,
                itemBuilder: (BuildContext context,int index){
                  String title = '';
                  String content = '';
                  String content2 = '';

                  switch (index) {
                    case 0:
                      title = 'Welcome';
                      content = 'Sign up for free music on your phone,tablet';
                      content2 = 'and computer.';
                      break;
                    case 1:
                      title = 'Browse';
                      content = 'Explore top tracks, new releases and the right';
                      content2 = 'playlist for every moment.';
                      break;
                    case 2:
                      title = 'Search';
                      content = 'Looking for that special album or artist? Just';
                      content2 = 'search and hit play!';
                      break;
                    case 3:
                      title = 'Running';
                      content = 'Music that perfectly matches';
                      content2 = 'your tempo.';
                      break;
                    case 4:
                      title = 'Your Library';
                      content = 'Save any song,album or artist to your own';
                      content2 = 'music collection.';
                      break;
                    default:
                  }

                  return Column(
                    children: <Widget>[
                      Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                      Text(content, style: TextStyle(color: Colors.white)),
                      Text(content2, style: TextStyle(color: Colors.white)),
                    ],
                  );
                },
                itemCount: 5,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    size: 6.0,
                    color: Colors.white10,
                    activeColor: Colors.white,
                    activeSize: 6.0
                  )
                )
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            height: 40.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF201437),
                    ),
                    child: InkWell(
                      child: Text('LOG IN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.0)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF29B859),
                    ),
                    child: InkWell(
                      child: Text('SIGN UP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.0)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}