import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demos_gallery/utils/throttle_debounce.dart';

class Day9Page extends StatefulWidget {
  @override
  createState() => Day9State();
}

class Day9State extends State<Day9Page> {
  
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 3,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('主页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('通知'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('私信'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('我'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return UserPage();
      }
    );
  }
}

class UserPage extends StatefulWidget {
  @override
  createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  ScrollController _scrollController = new ScrollController();
  double _blurOpacity = 0.0;
  double _endFade = 200.0;
  double _bannerTop = 0.0;
  double _minBanner = 62.5;
  double _lastOffset = 0.0;
  double _iconScale = 1.5;
  String _segmentIndex = '0';

  void handleScrollUpdate(List args) {
    double scrollOffset = _scrollController.offset < 0.0 ? 0.0 : _scrollController.offset.floor().toDouble();

    if (scrollOffset == _lastOffset) {
      return;
    }

    _lastOffset = scrollOffset;

    if (scrollOffset > _endFade) {
      _blurOpacity = 1.0;
    }

    if (scrollOffset < _minBanner) {
      _blurOpacity = 0.0;
    }

    if (scrollOffset > _minBanner && scrollOffset < _endFade) {
      _blurOpacity = (scrollOffset - _minBanner) / (_endFade - _minBanner);
    }

    if (scrollOffset < 150 - _minBanner) {
      _bannerTop = -scrollOffset;
      _iconScale = 1 + 0.5 * (150 - _minBanner - scrollOffset) / (150 - _minBanner);
    } else {
      _bannerTop = _minBanner - 150;
      _iconScale = 1.0;
    }

    print('Position $scrollOffset $_blurOpacity $_iconScale');
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    var throttler = new Throttler(const Duration(milliseconds: 10), handleScrollUpdate, List());

    _scrollController.addListener(() {
      throttler.throttle();
    });

    Map<dynamic, Widget> segmentedMap = {'0': Text('推文'), '1': Text('媒体'), '2': Text('喜欢')};

    Widget banner = Positioned(
      key: Key('banner'),
      top: _bannerTop,
      left: 0.0,
      height: 150.0,
      right: 0.0,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/banner.png')
          )
        ),
      ),
    );

    Widget bannerBlur = Positioned(
      key: Key('bannerBlur'),
      top:0.0,
      left: 0.0,
      height: _minBanner,
      right: 0.0,
      child: Opacity(
        opacity: _blurOpacity,
        child: Container(
          height: _minBanner,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/bannerBlur.png')
            )
          ),
          child: Center(
            child: Padding (
              padding: EdgeInsets.only(top: 20.0), 
              child: Text('Github', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),),
            )
          ),
        )
      )
    );

    Widget content = ListView(
      key: Key('content'),
      physics: new ClampingScrollPhysics(),
      controller: _scrollController,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 130.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Transform(
                alignment: FractionalOffset.bottomLeft,
                transform: Matrix4.identity()..scale(_iconScale),
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 5.0
                    )
                  ),
                  width: 68.0,
                  height: 68.0,
                  child: Image.asset('assets/icon.png')
                ),
              ),
              Container(
                width: 240.0,
                margin: EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 40.0,
                      child: Icon(Icons.settings, color: Color(0xFF8999A5), size: 20.0,)
                    ),
                    Container(
                      width: 40.0,
                      height: 30.0,
                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.0),
                        ),
                        border: Border.all(
                          color: Color(0xFF8999A5),
                          width: 1.0
                        )
                      ),
                      child: Icon(Icons.group, color: Color(0xFF8999A5), size: 20.0,)
                    ),
                    Container(
                      width: 120.0,
                      height: 30.0,
                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.0),
                        ),
                        border: Border.all(
                          color: Color(0xFF8999A5),
                          width: 1.0
                        )
                      ),
                      alignment: Alignment.center,
                      child: Text('编辑个人资料', textAlign: TextAlign.center, style: TextStyle(fontSize: 14.0, color: Color(0xFF8999A5)),)
                    )
                  ],
                )
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text('Github', style: TextStyle(color: Color(0xFF292F33), fontSize: 20.0, fontWeight: FontWeight.w500),),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text('@Github', style: TextStyle(color: Color(0xFF66757F)),),
              ),
              Container(
                child: Row(
                  children: <Widget> [
                    Container(
                      width: 110.0,
                      child: Row(
                        children: <Widget> [
                          Text('183', style: TextStyle(color: Color(0xFF292F33), fontWeight: FontWeight.w500)),
                          Text('正在关注', style: TextStyle(color: Color(0xFF95A4AE))),
                        ]
                      )
                    ),
                    Container(
                      width: 110.0,
                      child: Row(
                        children: <Widget> [
                          Text('830k', style: TextStyle(color: Color(0xFF292F33), fontWeight: FontWeight.w500),),
                          Text('关注者', style: TextStyle(color: Color(0xFF95A4AE))),
                        ]
                      )
                    )
                  ]
                ),
              ),
            ],
          )
        ),
        Container(
          child: CupertinoSegmentedControl(
            key: Key('segmented'),
            groupValue: _segmentIndex,
            onValueChanged: (index){
              setState(() {
                _segmentIndex = index;
              });
            },
            children: segmentedMap,
          ),
        ),
        Container(
          height: 700.0,
          color: Color(0xFFF5F8FA),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 20.0),
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage('assets/moreinfo.png'),
          ),
        ),
      ],
    );

    List<Widget> stackList = new List();

    if (_iconScale != 1) {
      stackList.add(banner);
      stackList.add(content);
    } else {
      stackList.add(content);
      stackList.add(banner);
    }

    stackList.add(bannerBlur);

    return Scaffold(
      body:  Stack(
        children: stackList
      )
    );
  }
}