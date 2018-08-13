import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Day8Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer (
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      image: DecorationImage (
                        fit: BoxFit.fill,
                        image: AssetImage('assets/avatar.jpeg')
                      )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text('gaocheng jiang', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text('jianggaocheng@hotmail.com', style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF242437),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.mapMarker),
              title: Text('你的地点'),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.penSquare),
              title: Text('你的贡献'),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.productHunt),
              title: Text('离线区域'),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(FontAwesomeIcons.road),
              title: Text('实时路况'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.bus),
              title: Text('公交线路'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.bicycle),
              title: Text('骑车线路'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('卫星图像'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.tree),
              title: Text('地形'),
              onTap: () {
              },
            ),
            Divider(),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child:Container(
          child:  FlutterMap(
            options: new MapOptions(
              center: new LatLng(31.298886, 120.585316),
              zoom: 13.0,
            ),
            layers: [
              new TileLayerOptions(
                urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            ],
          ),
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