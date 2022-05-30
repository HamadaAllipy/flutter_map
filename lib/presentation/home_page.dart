import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var marker = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
            target: LatLng(37.42796133580664, -122.085749655962),
        ),
        markers: marker,
        onMapCreated: (GoogleMapController googleMapController){
          setState((){
            marker.add(
              const Marker(
                markerId: MarkerId('1'),
                position: LatLng(37.42796133580664, -122.085749655962),
              ),
            );
          });
        },
      ),
    );
  }
}
