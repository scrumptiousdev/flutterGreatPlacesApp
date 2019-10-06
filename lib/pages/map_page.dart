import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart';

class MapPage extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapPage({
    this.initialLocation = const PlaceLocation(
      latitude: 37.432,
      longitude: -122.084
    ),
    this.isSelecting = false
  });

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng _pickedLocation;

  void _selectLocation(LatLng pos) {
    setState(() => _pickedLocation = pos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
        actions: <Widget>[
          if (widget.isSelecting) IconButton(
            icon: Icon(Icons.check),
            onPressed: _pickedLocation == null ? null : () {
              Navigator.of(context).pop(_pickedLocation);
            }
          )
        ]
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude
          ),
          zoom: 16
        ),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: (_pickedLocation == null && widget.isSelecting) ? null : {
          Marker(
            markerId: MarkerId('m1'),
            position: _pickedLocation ?? LatLng(widget.initialLocation.latitude, widget.initialLocation.longitude)
          )
        }
      )
    );
  }
}