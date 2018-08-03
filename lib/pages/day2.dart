import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demos_gallery/utils/carousel.dart';
import 'dart:convert';

class Day2Page extends StatelessWidget {
  final _weatherData = jsonDecode('''
[{
	"key": 0,
	"city": "苏州市",
	"night": true,
	"bg": "w2.png",
	"abs": "大部晴朗",
	"degree": 15,
	"today": {
		"week": "星期六",
		"day": "今天",
		"high": 16,
		"low": 14
	},
	"hours": [{
		"key": 101,
		"time": "现在",
		"icon": "0xe804",
		"degree": "15°",
		"color": "0xFFFFFFFF"
	}, {
		"key": 102,
		"time": "3时",
		"icon": "0xe80c",
		"degree": "15°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 103,
		"time": "4时",
		"icon": "0xe80c",
		"degree": "16°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 104,
		"time": "5时",
		"icon": "0xe80c",
		"degree": "16°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 105,
		"time": "6时",
		"icon": "0xe80c",
		"degree": "16°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 106,
		"time": "06:21",
		"icon": "0xe829",
		"degree": "日出",
		"color": "0xFFfedf32"
	}, {
		"key": 107,
		"time": "7时",
		"icon": "0xe80b",
		"degree": "16°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 108,
		"time": "8时",
		"icon": "0xe80b",
		"degree": "18°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 109,
		"time": "9时",
		"icon": "0xe803",
		"degree": "19°",
		"color": "0xFFfedf32"
	}, {
		"key": 110,
		"time": "10时",
		"icon": "0xe803",
		"degree": "122°",
		"color": "0xFFfedf32"
	}, {
		"key": 111,
		"time": "11时",
		"icon": "0xe803",
		"degree": "23°",
		"color": "0xFFfedf32"
	}, {
		"key": 112,
		"time": "13时",
		"icon": "0xe803",
		"degree": "22°",
		"color": "0xFFfedf32"
	}, {
		"key": 113,
		"time": "13时",
		"icon": "0xe803",
		"degree": "22°",
		"color": "0xFFfedf32"
	}, {
		"key": 114,
		"time": "14时",
		"icon": "0xe80b",
		"degree": "16°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 115,
		"time": "15时",
		"icon": "0xe80b",
		"degree": "22°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 116,
		"time": "16时",
		"icon": "0xe80b",
		"degree": "21°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 117,
		"time": "17时",
		"icon": "0xe80b",
		"degree": "19°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 118,
		"time": "18时",
		"icon": "0xe80b",
		"degree": "18°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 119,
		"time": "18:06",
		"icon": "0xe80b",
		"degree": "日落",
		"color": "0xE6FFFFFF"
	}, {
		"key": 120,
		"time": "19时",
		"icon": "0xe80c",
		"degree": "18°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 121,
		"time": "20时",
		"icon": "0xe80c",
		"degree": "18°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 122,
		"time": "21时",
		"icon": "0xe80c",
		"degree": "18°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 123,
		"time": "22时",
		"icon": "0xe80c",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 124,
		"time": "23时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 125,
		"time": "0时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 126,
		"time": "1时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 127,
		"time": "2时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}],
	"days": [{
		"key": 21,
		"day": "星期一",
		"icon": "0xe80b",
		"high": 21,
		"low": 16
	}, {
		"key": 22,
		"day": "星期二",
		"icon": "0xe81a",
		"high": 22,
		"low": 14
	}, {
		"key": 23,
		"day": "星期三",
		"icon": "0xe81a",
		"high": 21,
		"low": 11
	}, {
		"key": 24,
		"day": "星期四",
		"icon": "0xe81a",
		"high": 12,
		"low": 8
	}, {
		"key": 25,
		"day": "星期五",
		"icon": "0xe81a",
		"high": 9,
		"low": 7
	}, {
		"key": 26,
		"day": "星期六",
		"icon": "0xe80b",
		"high": 13,
		"low": 9
	}, {
		"key": 27,
		"day": "星期日",
		"icon": "0xe81a",
		"high": 17,
		"low": 13
	}, {
		"key": 28,
		"day": "星期一",
		"icon": "0xe80b",
		"high": 18,
		"low": 14
	}, {
		"key": 29,
		"day": "星期二",
		"icon": "0xe80b",
		"high": 22,
		"low": 17
	}],
	"info": "今天：有暴雨，能见度低。最高气温29°。今晚局部多云，最低气温27°。",
	"rise": "06:21",
	"down": "18:06",
	"prop": "10%",
	"humi": "94%",
	"dir": "东北偏北",
	"speed": "3千米／小时",
	"feel": "15°",
	"rain": "0.0 厘米",
	"pres": "1,016 百帕",
	"sight": "5.0 公里",
	"uv": "0"
}, {
	"key": 1,
	"city": "卡尔加里",
	"night": false,
	"bg": "w3.png",
	"abs": "大部晴朗",
	"degree": 15,
	"today": {
		"week": "星期六",
		"day": "今天",
		"high": 16,
		"low": 14
	},
	"hours": [{
		"key": 101,
		"time": "现在",
		"icon": "0xe804",
		"degree": "15°",
		"color": "0xFFFFFFFF"
	}, {
		"key": 102,
		"time": "3时",
		"icon": "0xe80c",
		"degree": "15°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 103,
		"time": "4时",
		"icon": "0xe80c",
		"degree": "16°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 104,
		"time": "5时",
		"icon": "0xe80c",
		"degree": "16°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 105,
		"time": "6时",
		"icon": "0xe80c",
		"degree": "16°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 106,
		"time": "06:21",
		"icon": "0xe829",
		"degree": "日出",
		"color": "0xFFfedf32"
	}, {
		"key": 107,
		"time": "7时",
		"icon": "0xe80b",
		"degree": "16°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 108,
		"time": "8时",
		"icon": "0xe80b",
		"degree": "18°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 109,
		"time": "9时",
		"icon": "0xe803",
		"degree": "19°",
		"color": "0xFFfedf32"
	}, {
		"key": 110,
		"time": "10时",
		"icon": "0xe803",
		"degree": "122°",
		"color": "0xFFfedf32"
	}, {
		"key": 111,
		"time": "11时",
		"icon": "0xe803",
		"degree": "23°",
		"color": "0xFFfedf32"
	}, {
		"key": 112,
		"time": "13时",
		"icon": "0xe803",
		"degree": "22°",
		"color": "0xFFfedf32"
	}, {
		"key": 113,
		"time": "13时",
		"icon": "0xe803",
		"degree": "22°",
		"color": "0xFFfedf32"
	}, {
		"key": 114,
		"time": "14时",
		"icon": "0xe80b",
		"degree": "16°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 115,
		"time": "15时",
		"icon": "0xe80b",
		"degree": "22°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 116,
		"time": "16时",
		"icon": "0xe80b",
		"degree": "21°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 117,
		"time": "17时",
		"icon": "0xe80b",
		"degree": "19°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 118,
		"time": "18时",
		"icon": "0xe80b",
		"degree": "18°",
		"color": "0xE6FFFFFF"
	}, {
		"key": 119,
		"time": "18:06",
		"icon": "0xe80b",
		"degree": "日落",
		"color": "0xE6FFFFFF"
	}, {
		"key": 120,
		"time": "19时",
		"icon": "0xe80c",
		"degree": "18°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 121,
		"time": "20时",
		"icon": "0xe80c",
		"degree": "18°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 122,
		"time": "21时",
		"icon": "0xe80c",
		"degree": "18°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 123,
		"time": "22时",
		"icon": "0xe80c",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 124,
		"time": "23时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 125,
		"time": "0时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 126,
		"time": "1时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}, {
		"key": 127,
		"time": "2时",
		"icon": "0xe814",
		"degree": "17°",
		"color": "0xCCFFFFFF"
	}],
	"days": [{
		"key": 21,
		"day": "星期一",
		"icon": "0xe80b",
		"high": 21,
		"low": 16
	}, {
		"key": 22,
		"day": "星期二",
		"icon": "0xe81a",
		"high": 22,
		"low": 14
	}, {
		"key": 23,
		"day": "星期三",
		"icon": "0xe81a",
		"high": 21,
		"low": 11
	}, {
		"key": 24,
		"day": "星期四",
		"icon": "0xe81a",
		"high": 12,
		"low": 8
	}, {
		"key": 25,
		"day": "星期五",
		"icon": "0xe81a",
		"high": 9,
		"low": 7
	}, {
		"key": 26,
		"day": "星期六",
		"icon": "0xe80b",
		"high": 13,
		"low": 9
	}, {
		"key": 27,
		"day": "星期日",
		"icon": "0xe81a",
		"high": 17,
		"low": 13
	}, {
		"key": 28,
		"day": "星期一",
		"icon": "0xe80b",
		"high": 18,
		"low": 14
	}, {
		"key": 29,
		"day": "星期二",
		"icon": "0xe80b",
		"high": 22,
		"low": 17
	}],
	"info": "今天：今天大部多云。现在气温 15°；最高气温23°。",
	"rise": "06:21",
	"down": "18:06",
	"prop": "10%",
	"humi": "94%",
	"dir": "东北偏北",
	"speed": "3千米／小时",
	"feel": "15°",
	"rain": "0.0 厘米",
	"pres": "1,016 百帕",
	"sight": "5.0 公里",
	"uv": "0"
}]''');

  @override
  Widget build(BuildContext context) {
    print('_weatherData $_weatherData');

    return Scaffold(
      body: Container(
        child: Carousel(
          children: _weatherData.map((city) =>
             WeatherPage(
               cityData: city
             )
          ).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Back', // used by assistive technologies
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}

class WeatherPage extends StatelessWidget {
  WeatherPage({Key key, this.cityData}): super(key: key);

  final cityData;

  @override
  Widget build(BuildContext context) {
    List<Widget> hourViewList = cityData['hours'].map<Widget>((hourElem) => Container(
      width: 55.0,
      alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                hourElem['time'],
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15.0)
              )
            ),
            Expanded(
              child: Icon(
                IconData(
                  int.parse(hourElem['icon']), fontFamily: 'FlutterIcon'),
                  color: Color(int.parse(hourElem['color'])
                )
              )
            ),
            Container(
              child: Text(
                hourElem['degree'],
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0)
              )
            ),
          ],
        ),
      )
    ).toList();

    List<Widget> dayViewList = cityData['days'].map<Widget>((dayElem) => Container(
      height: 28.0,
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          children: <Widget>[
            Container(
              child: Text(
                dayElem['day'],
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15.0)
              )
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Icon(
                  IconData(int.parse(dayElem['icon']), fontFamily: 'FlutterIcon'),
                  color: Color(0xFFFFFFFF)
                )
              )
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 35.0,
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${dayElem['high']}',
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0)
                    )
                  ),
                  Container(
                    width: 35.0,
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${dayElem['low']}',
                      style: cityData['night'] ?
                        TextStyle(color: Color(0xFFAAAAAA), fontSize: 16.0):
                        TextStyle(color: Color(0xFFEEEEEE), fontSize: 16.0)
                    )
                  ),
                ]
              )
            )
          ],
        ),
      )
    ).toList();

    Widget weatherOther(String title, String value) {
      return Expanded(
        flex: 1,
        child: Container(
          height: 55.0,
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: Text(title,  style: TextStyle(color: Color(0xBBFFFFFF), fontSize: 12.0,fontWeight: FontWeight.w400)),
              ),
              new Container(
                child: Text(value, style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 24.0)),
              ),
            ],
          )
        )
      );
    }

    // TODO: implement build
    return new LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: new IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/${cityData['bg']}'),
                    fit: BoxFit.cover
                  )
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      // headInfo
                      Container(
                        padding: EdgeInsets.only(top: 70.0, bottom: 60.0),
                        child: Column(
                          children: <Widget>[
                            Text(cityData['city'], style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 32.0),),
                            Text(cityData['abs'], style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15.0)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${cityData['degree']}',
                                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 85.0, letterSpacing: -5.0, fontFamily: 'OpenSans', fontWeight: FontWeight.w100)
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 25.0),
                                  child: Text('°', style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 35.0, fontWeight: FontWeight.w300),),
                                )
                            ],)
                          ],
                        ),
                      ),
                      // withinDay
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Container(width: 60.0, child: Text(cityData['today']['week'], style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0, fontWeight: FontWeight.w400))),
                                      Container(width: 50.0, child: Text(cityData['today']['day'], style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15.0))),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Container(width: 30.0, child: Text('${cityData['today']['high']}', style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0, fontWeight: FontWeight.w200)),),
                                      Container(width: 30.0, child: Text('${cityData['today']['low']}', style: TextStyle(color: cityData['night'] ? Color(0xFFAAAAAA) : Color(0xFFEEEEEE), fontSize: 18.0, fontWeight: FontWeight.w200)),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 100.0,
                              margin: EdgeInsets.only(top: 5.0),
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border(top: BorderSide(color: Color(0xB3FFFFFF), width: 0.5), bottom: BorderSide(color: Color(0xB3FFFFFF), width: 0.5)),
                              ),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: hourViewList,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // dayInWeek
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: dayViewList,
                        ),
                      ),
                      // weatherInfo
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          border: BorderDirectional(
                            top: BorderSide(color: Color(0xB3FFFFFF), width: 0.5),
                            bottom: BorderSide(color: Color(0xB3FFFFFF), width: 0.5),
                          )
                        ),
                        child: Text(
                          cityData['info'],
                          style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15.0),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  weatherOther('日出', cityData['rise']),
                                  weatherOther('日落', cityData['down']),
                              ]),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Color(0xB3FFFFFF), width: 0.5), 
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  weatherOther('降雨概率', cityData['prop']),
                                  weatherOther('湿度', cityData['humi']),
                              ]),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Color(0xB3FFFFFF), width: 0.5), 
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  weatherOther('风速', cityData['speed']),
                                  weatherOther('体感温度', cityData['feel']),
                              ]),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Color(0xB3FFFFFF), width: 0.5), 
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  weatherOther('降水量', cityData['rain']),
                                  weatherOther('气压', cityData['pres']),
                              ]),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Color(0xB3FFFFFF), width:  0.5), 
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  weatherOther('能见度', cityData['sight']),
                                  weatherOther('紫外线指数', cityData['uv']),
                              ]),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
          ),
        );
      },
    );
  }
}

