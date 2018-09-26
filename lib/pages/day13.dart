import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Day13Page extends StatefulWidget {
  @override
  createState() => Day13PageState();
}

class Day13PageState extends State<Day13Page> {
  int textCount = 140;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage('assets/icon.png')
                        )
                      ),
                      width: 30.0,
                      height: 30.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close),
                    )
                  ],
                ),
              ),
              Expanded(
                child: TextField(
                  maxLength: 140,
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Color(0xFFCED8DE)),
                    hintText: '有什么新鲜事？',
                    counterText: ''
                  ),
                  onChanged: (val) {
                    setState(() {
                      this.textCount = 140 - val.length;
                    });
                  },
                )
              ),
              FunctionView(
                numOfText: this.textCount,
              ),
            ],
          )
        ),
      )
    );
  }
}

class FunctionView extends StatelessWidget {
  final int numOfText;

  FunctionView({Key key, this.numOfText}): super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
      print("bottom ${mediaQuery.viewInsets.bottom}");
      return Container(
          margin: EdgeInsets.only(bottom: mediaQuery.viewInsets.bottom != 0.0? 290 - mediaQuery.viewInsets.bottom + 20 : 0.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 210.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.pin_drop, size: 23.0, color: Color(0xFF8899A5)),
                        Icon(Icons.camera, size: 23.0, color: Color(0xFF8899A5)),
                        Icon(Icons.image, size: 23.0, color: Color(0xFF8899A5)),
                        Icon(Icons.pie_chart, size: 23.0, color: Color(0xFF8899A5))
                      ]
                    ),
                  ),
                  Container(
                    width: 110.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          this.numOfText.toString(), style: TextStyle(color: Color(0xFFCCD6DD), fontSize: 18.0),
                        ),
                        InkWell(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('发推', style: TextStyle(color: this.numOfText == 140 ? Color(0xFFCCD6DD) : Color(0xFFFFFFFF))),
                            width: 60.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              border: this.numOfText == 140 ? Border.all(
                                color: Color(0xFFCCD6DD),
                              ) : null,
                              color: this.numOfText == 140 ? null : Color(0xFF2AA2EF),
                              borderRadius: BorderRadius.circular(6.0)
                            ),
                          )
                        )
                      ]
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(
                    color: Color(0xFFCCD6DD),
                  )
                )
              ),
            ),
            Container(
              height: 240.0,
              child: GridView.count(
                primary: false,
                padding: EdgeInsets.all(0.0),
                crossAxisCount: 3,
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: BorderDirectional(
                          end: BorderSide(
                            color: Color(0xFFDDDDDD)
                          ),
                          bottom: BorderSide(
                            color: Color(0xFFDDDDDD)
                          ),
                        )
                      ),
                      height: 113.0,
                      child: Icon(FontAwesomeIcons.camera, size: 50.0, color: Color(0xFF2AA2EF)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: BorderDirectional(
                        end: BorderSide(
                          color: Color(0xFFDDDDDD)
                        ),
                        bottom: BorderSide(
                          color: Color(0xFFDDDDDD)
                        ),
                      )
                    ),
                    height: 113.0,
                    child: Icon(FontAwesomeIcons.video, size: 50.0, color: Color(0xFF2AA2EF)),
                  ),
                ]
              )
            )
          ]
      )
      );
  }
}

