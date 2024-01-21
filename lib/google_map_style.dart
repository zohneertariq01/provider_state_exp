import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapStyle extends StatefulWidget {
  const GoogleMapStyle({super.key});

  @override
  State<GoogleMapStyle> createState() => _GoogleMapStyleState();
}

class _GoogleMapStyleState extends State<GoogleMapStyle> {
  Completer<GoogleMapController> completer = Completer();
  CameraPosition cameraPosition =
      CameraPosition(target: LatLng(31.347849, 73.098555), zoom: 14);
  List<Marker> markers = [];
  List<LatLng> latLng = [
    LatLng(31.541166, 73.103018),
    LatLng(31.496094, 73.158636),
    LatLng(31.428153, 73.165503),
    LatLng(31.425224, 73.013068),
    LatLng(31.347849, 73.098555),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onChange();
  }

  void onChange() {
    for (int i = 0; i < latLng.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: latLng[i],
          icon: BitmapDescriptor.defaultMarker,
          infoWindow:
              InfoWindow(title: 'This is my current position:' + i.toString()),
        ),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Maps Theme'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  completer.future.then((value) {
                    DefaultAssetBundle.of(context)
                        .loadString('assets/maptheme/silver_theme.json')
                        .then((string) {
                      value.setMapStyle(string);
                    });
                  });
                },
                child: Text('Silver'),
              ),
              PopupMenuItem(
                onTap: () {
                  completer.future.then((value) {
                    DefaultAssetBundle.of(context)
                        .loadString('assets/maptheme/retro_theme.json')
                        .then((string) {
                      value.setMapStyle(string);
                    });
                  });
                },
                child: Text('Retro'),
              ),
              PopupMenuItem(
                onTap: () {
                  completer.future.then((value) {
                    DefaultAssetBundle.of(context)
                        .loadString('assets/maptheme/night_theme.json')
                        .then((string) {
                      value.setMapStyle(string);
                    });
                  });
                },
                child: Text('Night'),
              ),
              PopupMenuItem(
                onTap: () {
                  completer.future.then((value) {
                    DefaultAssetBundle.of(context)
                        .loadString('assets/maptheme/dark_theme.json')
                        .then((string) {
                      value.setMapStyle(string);
                    });
                  });
                },
                child: Text('Dark'),
              ),
            ],
          )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: cameraPosition,
        markers: Set<Marker>.of(markers),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          completer.complete(controller);
        },
      ),
    );
  }
}
