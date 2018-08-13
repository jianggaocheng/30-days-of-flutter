import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:map_view/map_view.dart';
import 'package:location/location.dart' as location;

class Day5Page extends StatelessWidget {
  final _location = location.Location();
  static bool setKey = false;

  Day5Page() {
    if (!setKey) {
      MapView.setApiKey("<Your secrect key>");
      setKey = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _mapView = MapView();

    _mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        _mapView.dismiss();
      }
    });
    
    //Add a method to call to show the map.
    void showMap() async {
      var currentLocation = await _location.getLocation;

      print(currentLocation);

      _mapView.show(MapOptions(
        mapViewType: MapViewType.normal,
        showUserLocation: true,
        showMyLocationButton: true,
        initialCameraPosition: CameraPosition(
          Location(currentLocation['latitude'], currentLocation['longitude']),
          16.0
        ),
        title: "Find my location"),
      toolbarActions: [ToolbarAction("Close", 1)]);
    }

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Find my location'),
      ),
      body: Container(
        child: Center(
          child: CupertinoButton(
            color: Colors.blueAccent,
            onPressed: showMap,
            child: Text('Find my location'),
          ),
        ),
      ),
    );
  }
}