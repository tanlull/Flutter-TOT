import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Map Page")),
      body: GoogleMap(
        markers: <Marker>[
          Marker(
            markerId : MarkerId('001'),
            position:LatLng(13.80564244, 100.5746134),
            infoWindow: InfoWindow(
              title: "อบรม Flutter",
              snippet : 'ทัน',
            onTap: (){
              //กดแล้วทำไร
            }
            )
          )
        ].toSet(),
          initialCameraPosition: CameraPosition(
              target: LatLng(13.80564244, 100.5746134), zoom: 16),
          onMapCreated: (GoogleMapController controler) {
            _controller.complete(controler);
          }),
    );
  }
}
