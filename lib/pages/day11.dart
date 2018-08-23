import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dart2_constant/math.dart';

class Day11Page extends StatefulWidget {
    createState() => Day11PageStatus();
}

class Day11PageStatus extends State<Day11Page> {
  double angle = 0.0;
  double angleSlideValue = 0.0;

  void onPieValueChange (value) {
    setState(() {
      angleSlideValue = value;
      angle = 2 * pi * value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Canvas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              child: Center(
                child: Text('Progress Pie')
              ),
            ),
            Slider(
              value: angleSlideValue,
              onChanged: onPieValueChange,
            ),
            Container(
              height: 220.0,
              padding: EdgeInsets.all(10.0),
              color: Colors.grey,
              child: CustomPaint(
                painter: new Pie(MediaQuery.of(context).size.width / 2, 100.0, 100.0, angle),
                child: Container()
              )
            ),
          ],
        ),
      ),
    );
  }
}

class Pie extends CustomPainter {
  Rect rect; 
  double angle;

  @override
  Pie(double x, double y, double radius, double angle) {
    this.rect = Rect.fromCircle(center: Offset(x, y), radius: radius);
    this.angle = angle;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawArc(rect, 0.0, angle, true, paint);
  }

  @override
  bool shouldRepaint(Pie oldDelegate) => false;
}