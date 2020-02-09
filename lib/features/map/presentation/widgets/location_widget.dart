import 'package:flutter/material.dart';

import 'package:location/location.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({
    @required this.locationData
  });

  final LocationData locationData;

  @override
  Widget build(BuildContext context) {
    var locationInfo = 'Location data unavailable';

    if (locationData != null) {
      locationInfo = '${locationData.latitude}, ${locationData.longitude}';
    }

    return Container(
      margin: EdgeInsets.only(
        top: 16.0,
      ),
      alignment: AlignmentDirectional.topCenter,
      child: Card(
        elevation: 8.0,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Text(
            locationInfo,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}