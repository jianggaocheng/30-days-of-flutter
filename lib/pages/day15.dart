import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Day15Page extends StatefulWidget {
  @override
  createState() => Day15PageState();
}

class Day15PageState extends State<Day15Page> {
  DateTime _now;

  @override
  void initState() {
    _now = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Time picker'),
      ),
      body: Container(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200.0
            ),
            child: Column(
              children: [
                Text(DateFormat('yyyy-MM-dd HH:mm').format(_now), style: TextStyle(fontSize: 25.0)),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                    child: Text('change time', style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF4285F4)
                    )),
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => DateTimePickerPage(displayDateTime: _now),
                        ),
                      );

                      setState(() {
                        if (result != null) {
                          this._now = result;
                        }
                      });
                    },
                  )
                )
              ]
            )
          )
        )
      ),
    );
  }
}

class DateTimePickerPage extends StatelessWidget {
  DateTime displayDateTime;

  DateTimePickerPage({Key key, @required this.displayDateTime}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Choose a time'),
        trailing: GestureDetector(
          child: Text('Set', style: TextStyle(color: Color(0xFF4285F4))),
          onTap: () {
            Navigator.pop(context, displayDateTime);
          },
        ),
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200.0
            ),
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: displayDateTime,
              onDateTimeChanged: (value) {
                displayDateTime = DateTime.utc(value.year, value.month, value.day, displayDateTime.hour, displayDateTime.minute);
              },
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200.0
            ),
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              initialTimerDuration: Duration(hours: displayDateTime.hour, minutes: displayDateTime.minute),
              onTimerDurationChanged: (value) {
                displayDateTime = DateTime.utc(displayDateTime.year, displayDateTime.month, displayDateTime.day, value.inHours, value.inMinutes);
              }
            ),
          ),
        ]
      )
    );
  }
}