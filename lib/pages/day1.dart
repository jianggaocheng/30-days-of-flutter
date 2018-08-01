import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'dart:async';

class Day1Page extends StatefulWidget {
  @override
  createState() => new Day1PageState();
}

class Day1PageState extends State<Day1Page> {
  String _sectionTime = '00:00.00';
  String _totalTime = '00:00.00';
  int _recordTime = 0;
  Stopwatch _stopwatch = new Stopwatch();
  List<String> _recordList = new List();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new CupertinoNavigationBar(
        middle: new Text('A stopwatch'),
      ),
      body: new Column(
        children: <Widget>[
          new WatchFace(
            sectionTime: _sectionTime,
            totalTime: _totalTime,
          ),
          new WatchControl(
            watchOn: _stopwatch.isRunning,
            onLeftBtn: _handleLeftBtn,
            onRightBtn: _handleRightBtn,
          ),
          new Expanded(
            child: new WatchRecord(
              recordList: _recordList,
            )
          )
        ],
      )
    );
  }

  void _handleRightBtn() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();

      new Timer.periodic(new Duration(milliseconds: 10), (interval) {
        var milSecond, second, minute, countingTime, secmilSecond, secsecond, secminute, seccountingTime;

        countingTime = _stopwatch.elapsedMilliseconds;
        minute = (countingTime / (60 * 1000)).floor();
        second = ((countingTime - 6000 * minute) / 1000).floor();
        milSecond = ((countingTime % 1000) / 10).floor();
        seccountingTime = countingTime - _recordTime;
        secminute =(seccountingTime / (60 * 1000)).floor();
        secsecond = ((seccountingTime - 6000 * secminute) / 1000).floor();
        secmilSecond = ((seccountingTime % 1000) / 10).floor();

        setState(() {
          _totalTime = (minute % 60).toString().padLeft(2, '0') + ":" + (second % 60).toString().padLeft(2, '0') + "." + (milSecond % 60).toString().padLeft(2, '0');
          _sectionTime = (secminute % 60).toString().padLeft(2, '0') + ":" + (secsecond % 60).toString().padLeft(2, '0') + "." + (secmilSecond % 60).toString().padLeft(2, '0');
        });

        if (!_stopwatch.isRunning) {
          interval.cancel();
        }
      });
    }
  }
 
  void _handleLeftBtn() {
    if (_stopwatch.isRunning) {
      _recordList.add(_sectionTime);
      _recordTime = _stopwatch.elapsedMilliseconds;
    } else {
      setState(() {
        _sectionTime = '00:00.00';
        _totalTime = '00:00.00';
        _recordList.clear();
        _recordTime = 0;
      });

      _stopwatch.reset();
    }
  }
}

class WatchFace extends StatelessWidget{
  WatchFace({Key key, this.sectionTime: '00:00.00', this.totalTime: '00:00.00',}): super(key: key);

  final String sectionTime;
  final String totalTime;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        border: Border(bottom: BorderSide(color: Color(0xFFDDDDDD)))
      ),
      padding: EdgeInsets.only(top: 30.0),
      alignment: Alignment.center,
      height: 170.0,
      child: new Column(
        children: <Widget>[
          new Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 30.0),
            child: new Text(sectionTime, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w100, color: Color(0xFF555555), fontFamily: "RobotoMono")),
          ),
          new Container(
            margin: EdgeInsets.only(top: 10.0),
            child: new Text(totalTime, style: const TextStyle(fontSize: 70.0, fontWeight: FontWeight.w100, color: Color(0xFF222222), fontFamily: "RobotoMono")),
          )
        ],
      ),
    );
  }
}

class WatchControl extends StatefulWidget{
  WatchControl({Key key, @required this.onRightBtn, @required this.onLeftBtn, this.watchOn})
      : super(key: key);

  final Function onLeftBtn;
  final Function onRightBtn;
  final bool watchOn;
  
  @override
  createState() => new WatchControlState();
}

class WatchControlState extends State<WatchControl> {
  String startBtnText = '启动';
  Color startBtnColor = Color(0xFF60B644);
  String stopBtnText = '复位';
  Color underlayColor = Color(0xFFEEEEEE);

  _onRightBtn() {
    if (!widget.watchOn) {
      setState(() {
        startBtnText = '停止';
        startBtnColor = Color(0xFFFF0044);
        stopBtnText = '计次';
        underlayColor = Color(0xFFEEEEEE);
      });
    } else {
      setState(() {
        startBtnText = '启动';
        startBtnColor = Color(0xFF60B644);
        stopBtnText = '复位';
        underlayColor = Color(0xFFEEEEEE);
      });
    }

    widget.onRightBtn();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Ink(
      height: 100.0,
      decoration: new BoxDecoration(
        color: Color(0xFFF3F3F3)
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Ink(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(35.0)),
            ),
            child: new InkWell(
              borderRadius: BorderRadius.all(Radius.circular(35.0)),
              onTap: widget.onLeftBtn,
              child: new Center(
                child: new Text(stopBtnText),
              )
            ), 
          ),
          new Ink(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(35.0)),
            ),
            child: new InkWell(
              borderRadius: BorderRadius.all(Radius.circular(35.0)),
              onTap: _onRightBtn,
              child: new Center(
                child: new Text(startBtnText, style: new TextStyle(color: startBtnColor),),
              )
            ), 
          ),
        ],
      )
    );
  }
}

class WatchRecord extends StatelessWidget {
  WatchRecord({Key key, this.recordList}): super(key: key);

  final List<String> recordList;

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: recordList.length,
      itemBuilder: (context, index) {
        int targetIndex = recordList.length - index;
        
        return new Container(
          height: 40.0,
          padding: EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0, bottom: 5.0),
          decoration: new BoxDecoration(
            border: BorderDirectional(bottom: BorderSide(color: Color(0xFFBBBBBB)))
          ),
          child: new Row(
            children: <Widget>[
              new Container(
                child: new Text( '计次 $targetIndex', style: new TextStyle(color: Color(0xFF777777)),),
              ),
              new Expanded(
                child: new Text(recordList[targetIndex - 1], textAlign: TextAlign.right, style: new TextStyle(color: Color(0xFF222222), fontFamily: "RobotoMono"),),
              )
            ],
          )
        );
      },
    );
  }
}