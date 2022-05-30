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
  BitmapDescriptor? customMarker;

  getCustomMarker()async{
    customMarker = await  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/icon/marker_icon.png');
  }


  @override
  void initState() {
    getCustomMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: const CameraPosition(
            target: LatLng(30.033333, 31.233334),
          zoom: 3.0,
        ),
        markers: marker,
        onMapCreated: (GoogleMapController googleMapController){
          setState((){
            marker.add(
               Marker(
                markerId: const MarkerId('1'),
                position: const LatLng(30.033333, 31.233334),
                infoWindow: InfoWindow(
                  title: 'Title',
                  snippet: 'snippet',
                  onTap: (){
                    print('Hamada');
                  }
                ),
                 icon: customMarker as BitmapDescriptor,
              ),
            );
          });
        },
      ),
    );
  }
}
