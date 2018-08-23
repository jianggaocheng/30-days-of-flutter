import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demos_gallery/utils/throttle_debounce.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Day7Page extends StatefulWidget {
  @override
  createState() => Day7PageState();
}

class Day7PageState extends State<Day7Page> {
  double ballLeft = 0.0;
  double ballTop = 0.0;

  void handlePointerMove(List args) {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double ballSize = 120.0;

    var throttler = new Throttler(const Duration(milliseconds: 1), handlePointerMove, List());

    return Scaffold(
      body: Listener(
          onPointerMove: (event) {
            ballLeft = event.position.dx - ballSize / 2;

            if (event.position.dx < ballSize / 2 ) {
              ballLeft = 0.0;
            }

            if (event.position.dx > screenWidth - ballSize / 2) {
              ballLeft = screenWidth - ballSize;
            }

            ballTop = event.position.dy - ballSize / 2;

            if (event.position.dy < ballSize / 2 ) {
              ballTop = 0.0;
            }

            if (event.position.dy > screenHeight - ballSize / 2) {
              ballTop = screenHeight - ballSize;
            }

            throttler.throttle();
          },
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/agrass.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Positioned(
                child: Icon(FontAwesomeIcons.baseballBall, size: ballSize, color: Colors.white70,),
                left: ballLeft,
                top: ballTop,
              )
            ],
          )
        )
    );
  }
}