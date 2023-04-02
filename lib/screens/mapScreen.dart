import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {

  static const routeName = '/map';

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => MapSampleState();
}

class MapSampleState extends State<MapScreen> {

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> markers = {}; 
  static const LatLng showLocation = LatLng(19.024090, 72.856340);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: const CameraPosition( 
          target: showLocation, 
          zoom: 15.0, 
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: getmarkers(),
      ),
    );
  }

  Set<Marker> getmarkers() { 
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, 
        infoWindow: const InfoWindow( 
          title: 'Pothole',
          snippet: 'Large Pothole',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(19.025090, 72.857340),
        infoWindow: const InfoWindow(
          title: 'Pothole',
          // snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(19.022480, 72.855026),
        infoWindow: const InfoWindow(
          title: 'Pothole',
          // snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(19.024190, 72.856940),
        infoWindow: const InfoWindow(
          title: 'Crack',
          //snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      markers.add(Marker(
        markerId: MarkerId(showLocation.toString()),
        position: const LatLng(19.024490, 72.857940),
        infoWindow: const InfoWindow(
          title: 'Crack',
          //snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      
    });

    return markers;
  }

}