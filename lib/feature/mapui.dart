import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapUi extends StatefulWidget {
  MapUi({super.key});

  @override
  State<MapUi> createState() => _MapUiState();
}

class _MapUiState extends State<MapUi> {
  var lat;
  var long;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Column(
        //   children: [
        //     ElevatedButton(
        //         onPressed: () {
        //           _determinePosition().then((value) => {
        //                 lat = {value.latitude} as double,
        //                 long = {value.longitude} as double,
        //                 setState(() {

        //                 print("lat-------:$lat"+"long-------:$long");
        //                 }),
        //               });
        //         },

        //         child: Text("press on ")),
        //     FlutterMap(
        //         options: MapOptions(
        //           onPointerDown: (event, point) {
        //             //print(point);
        //             // print("point.latitiude:+${point.latitude}");
        //             // print("point.longitude:${point.longitude}");
        //           },
        //        //   initialCenter: LatLng(33.510414, 36.278336),
        //           initialZoom: 10,
        //         ),
        //         children: [
        //           TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',),]), ],),); }}
        body: Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(33.510414, 36.278336),
          ),
          onMapCreated: (GoogleMapController controller) {
           
          },
        
        ),
        
      ],
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
     
  _determinePosition().then((value) => {
                        lat = {value.latitude} ,
                        long = {value.longitude} ,
                        setState(() {

                        print("lat-------:$lat"+"long-------:$long");
                        }),
                      });


    }),);
  }
 _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
// Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return AlertDialog(content:Text(" please turn on location services")); }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    } }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');}
  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();}
}

