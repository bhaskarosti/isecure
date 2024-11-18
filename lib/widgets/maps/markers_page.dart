import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
// import 'package:example/utils/tile_servers.dart';
// import 'package:example/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:isecure/utils/tile_servers.dart';
import 'package:isecure/utils/utils.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkersPage extends StatefulWidget {
  const MarkersPage({Key? key}) : super(key: key);

  @override
  MarkersPageState createState() => MarkersPageState();
}

class MarkersPageState extends State<MarkersPage> {
  // LatLng start = LatLng(Angle.degree(0.0), Angle.degree(0.0));
  Angle lat = Angle.degree(0.0);
  Angle lon = Angle.degree(0.0);

  final controller = MapController(
    // location: const LatLng(Angle.degree(27.7592458), Angle.degree(85.3086473)),
    location: LatLng(Angle.degree(0.0), Angle.degree(0.0)),
    zoom: 16,
  );
  // getCurrentPosition();
  final markers = [
    LatLng(Angle.degree(27.7592458), Angle.degree(85.3086473)),
  ];
  static Future<void> sendMessage(String location) async {
    // String googleUrl = "sms:+39 348 060 888?body=hello%20there";
    String googleUrl =
        'sms:+9779861607872?body=${Uri.encodeComponent(location)}';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }

  void getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Permission not given");
      Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      // print("Current Longitude: " + currentPosition.longitude.toString());
      // print("Current Latitude: " + currentPosition.latitude.toString());
      lat = Angle.degree(currentPosition.latitude);
      lon = Angle.degree(currentPosition.longitude);
      controller.center = LatLng(lat, lon);
      markers[0] = LatLng(lat, lon);
      // String location = currentPosition.latitude.toString() +
      //     "," +
      //     currentPosition.longitude.toString();
      // String Message =
      //     "An Accident has occured in the following location\n https://www.google.com/maps/search/$location";
      // openMap(Message);
      // _sendSMS(Message, recipents);
    }
  }

  void _gotoDefault() {
    getCurrentPosition();

    // Angle newCenter = controller.center.latitude;
    // controller.center =
    //     // const LatLng(Angle.degree(27.7592458), Angle.degree(85.3086473));
    //     LatLng(newCenter, Angle.degree(85.3086473));
    // setState(() {});
  }

  void _reportLocation() {
    // getCurrentPosition();
    LatLng new_position = controller.center;
    // controller.center =
    //     // const LatLng(Angle.degree(27.7592458), Angle.degree(85.3086473));
    //     LatLng(newCenter, Angle.degree(85.3086473));
    // setState(() {});
    String test = new_position.latitude.toString();
    // test.split(' ');
    var list = test.split("°");
    String newtest = new_position.longitude.toString();
    // test.split(' ');
    var newlist = newtest.split("°");
    // String location = new_position.latitude.toString() +
    //     "," +
    //     new_position.longitude.toString();
    String location = list[0] + "," + newlist[0];
    String Message =
        "An Accident has occured in the following location\n https://www.google.com/maps/search/$location";
    print(location);
    print(test);
    print(list[0]);
    sendMessage(Message);
    // _sendSMS(Message, recipents);
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 0.5;
    final zoom = clamp(controller.zoom + delta, 2, 18);

    transformer.setZoomInPlace(zoom, position);
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      transformer.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(Offset pos, Color color,
      [IconData icon = Icons.location_on]) {
    return Positioned(
      left: pos.dx - 24,
      top: pos.dy - 24,
      width: 48,
      height: 48,
      child: GestureDetector(
        child: Icon(
          icon,
          color: color,
          size: 48,
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              content: Text('You have clicked a marker!'),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
      ),
      body: MapLayout(
        controller: controller,
        builder: (context, transformer) {
          final markerPositions = markers.map(transformer.toOffset).toList();

          final markerWidgets = markerPositions.map(
            (pos) => _buildMarkerWidget(pos, Colors.red),
          );

          final homeLocation = transformer
              .toOffset(const LatLng(Angle.degree(35.68), Angle.degree(51.42)));

          final homeMarkerWidget =
              _buildMarkerWidget(homeLocation, Colors.black, Icons.home);

          final centerLocation = Offset(
              transformer.constraints.biggest.width / 2,
              transformer.constraints.biggest.height / 2);

          final centerMarkerWidget =
              _buildMarkerWidget(centerLocation, Colors.purple);

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onDoubleTapDown: (details) => _onDoubleTap(
              transformer,
              details.localPosition,
            ),
            onScaleStart: _onScaleStart,
            onScaleUpdate: (details) => _onScaleUpdate(details, transformer),
            child: Listener(
              behavior: HitTestBehavior.opaque,
              onPointerSignal: (event) {
                if (event is PointerScrollEvent) {
                  final delta = event.scrollDelta.dy / -1000.0;
                  final zoom = clamp(controller.zoom + delta, 2, 18);

                  transformer.setZoomInPlace(zoom, event.localPosition);
                  setState(() {});
                }
              },
              child: Stack(
                children: [
                  TileLayer(
                    builder: (context, x, y, z) {
                      final tilesInZoom = pow(2.0, z).floor();

                      while (x < 0) {
                        x += tilesInZoom;
                      }
                      while (y < 0) {
                        y += tilesInZoom;
                      }

                      x %= tilesInZoom;
                      y %= tilesInZoom;

                      return CachedNetworkImage(
                        imageUrl: google(z, x, y),
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  homeMarkerWidget,
                  ...markerWidgets,
                  centerMarkerWidget,
                ],
              ),
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _gotoDefault,
      //   tooltip: 'My Location',
      //   child: const Icon(Icons.my_location),
      // ),
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                onPressed: _reportLocation,
                tooltip: 'My Location',
                label: const Text("Report Location"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: _gotoDefault,
                  tooltip: 'My Location',
                  child: const Icon(Icons.my_location),

                  // tooltip: 'Another Action',
                  // child: const Text("Report Location"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
