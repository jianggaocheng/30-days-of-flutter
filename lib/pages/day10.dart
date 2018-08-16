import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Day10Page extends StatefulWidget {
  @override
  createState() => Day10PageState();
}

class Day10PageState extends State<Day10Page> with SingleTickerProviderStateMixin {
  Animation<double> shiftAnimation;
  Animation<double> opacityAnimation;
  AnimationController controller;

  @override
  initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 600), 
      vsync: this
    );

    final Animation curve = CurvedAnimation(
      parent: controller, 
      curve: Interval(0.333, 1.0, curve: Curves.ease)
    );

    shiftAnimation = Tween(
      begin: -120.0, 
      end: 50.0)
      .animate(curve)
      ..addListener(() {
        setState(() {
        });
      });

    final Animation opacityCurve = CurvedAnimation(
      parent: controller, 
      curve: Curves.ease
    );

    opacityAnimation = Tween(
      begin: 0.0, 
      end: 1.0)
      .animate(opacityCurve)
      ..addListener(() {
        setState(() {
        });
      });
  }

  Widget menuItem (String assets, String text) {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Column(
        children: <Widget>[
          Image.asset(assets, width: 120.0, height: 100.0, fit: BoxFit.contain,),
          Text(text, style: TextStyle(color: Colors.white),)
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          InkWell(
            onTap: (){
              controller.forward();
            },
            child: Ink(
              padding: EdgeInsets.only(top: 25.0),
              decoration: BoxDecoration(
                color: Color(0xFF37465C),
              ),
              child: Image(
                image: AssetImage('assets/tumblr.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          IgnorePointer(
            ignoring: opacityAnimation.value == 0,
            child: Opacity(
              opacity: opacityAnimation.value,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/tumblrblur.png'),
                    fit: BoxFit.fill,
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 150.0
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0.0,
                            left: shiftAnimation.value,
                            child: menuItem('assets/tumblr-text.png', 'Text'),
                          ),
                          Positioned(
                            top: 0.0,
                            right: shiftAnimation.value,
                            child: menuItem('assets/tumblr-photo.png', 'Photo'),
                          ),
                        ]
                      )
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 150.0
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0.0,
                            left: shiftAnimation.value,
                            child: menuItem('assets/tumblr-quote.png', 'Quote'),
                          ),
                          Positioned(
                            top: 0.0,
                            right: shiftAnimation.value,
                            child: menuItem('assets/tumblr-link.png', 'Link'),
                          ),
                        ]
                      )
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 150.0
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0.0,
                            left: shiftAnimation.value,
                            child: menuItem('assets/tumblr-chat.png', 'Chat'),
                          ),
                          Positioned(
                            top: 0.0,
                            right: shiftAnimation.value,
                            child: menuItem('assets/tumblr-audio.png', 'Audio'),
                          ),
                        ]
                      )
                    ),
                    InkWell(
                      onTap: (){
                        controller.reverse();
                      },
                      child: Ink(
                        width: 200.0,
                        height: 50.0,
                        child: Text('NeverMind', textAlign: TextAlign.center,style: TextStyle(color: Colors.white24, fontWeight: FontWeight.w700)),
                      )
                    ),
                  ],
                )
              )
            ),
          ),
        ],
      ),
    );
  }
}