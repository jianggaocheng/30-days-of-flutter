import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Day3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          TwitterPage(),
          Entrance(),
        ],
      )
    );
  }
}

class Entrance extends StatefulWidget {
  @override
  createState() => EntranceState();
}

class EntranceState extends State<Entrance> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> opacityAnimation;
  AnimationController controller;
  AnimationController opacityController;

  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 3200), 
      vsync: this
    );

    final Animation curve = CurvedAnimation(
      parent: controller, 
      curve: Interval(0.625, 1.0, curve: Curves.ease)
    );
    
    animation = Tween(
      begin: 1.0, 
      end: 50.0)
      .animate(curve)
      ..addListener(() {
        setState(() {
        });
      });

    final Animation opactiyCurve = CurvedAnimation(
      parent: controller, 
      curve: Interval(0.6875, 0.9375, curve: Curves.fastOutSlowIn)
    );

    opacityAnimation = Tween(
      begin: 1.0, 
      end: 0.0)
      .animate(opactiyCurve)
      ..addListener(() {
        setState(() {
        });
      });
    
    controller.forward();
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: opacityAnimation.value == 0,
      child: Opacity(
        opacity: opacityAnimation.value,
        child: Container(
        color: Color(0xFF2AA2EF),
        child: Center(
          child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()..scale(animation.value,),
            child: Container(
            child: Icon(
              FontAwesomeIcons.twitter,
              size: 70.0,
              color: Color(0xFFFFFFFF),
              // size: animation.value,
            )
          ),
          )
        ),
        ),
      )
    );
  }
}

class TwitterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Container(
          child: CupertinoButton(
            minSize: 20.0,
            padding: EdgeInsets.all(0.0),
            child: Icon(
              FontAwesomeIcons.userPlus, 
              size: 18.0
            ),
            onPressed: (){},
          )
        ),
        middle: Icon(
          FontAwesomeIcons.twitter,
          color: Color(0xFF2AA2EF),
        ),
        trailing:  Container(
          width: 100.0,
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                minSize: 20.0,
                child: Icon(
                  FontAwesomeIcons.search,
                  size: 18.0,
                ),
                onPressed: (){},
              ),
              CupertinoButton(
                minSize: 20.0,
                padding: EdgeInsets.only(right: 0.0, left: 5.0),
                child: Icon(
                  FontAwesomeIcons.edit,
                  size: 18.0,
                ),
                onPressed: (){},
              )
            ],
          ),
        )
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
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
          return Container(
            padding: EdgeInsets.only(top: 10.0),
            child: RefreshIndicator(
              onRefresh: (){
                final Completer<Null> completer = new Completer<Null>();
                new Timer(const Duration(seconds: 3), () { completer.complete(null); });
                return completer.future.then((_) {
                });
              },
              child: ListView(
                children: <Widget>[
                  Image.asset('assets/day3.png')
                ],
              )
            )
          );
        }
      ),
    );
  }
}