import 'dart:async';
import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class GoogleMapsWidget extends StatelessWidget {
  const GoogleMapsWidget({
    super.key,
    required this.completer,
    required this.polylines,
    required this.markers,
    required this.circles,
  });

  final Completer<GoogleMapController> completer;
  final Set<Polyline> polylines;
  final Set<Marker> markers;
  final Set<Circle> circles;

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialCameraPosition = const CameraPosition(
        target: LatLng(
          -6.34476037308127,
          106.71526269508612,
        ),
        zoom: 16);

    void onMapCreated(GoogleMapController googleMapController) {
      if (!completer.isCompleted) {
        completer.complete(googleMapController);
      }
    }

    return Container(
      width: double.infinity,
      height: 35.h,
      margin: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(
          20,
        ),
        border: Border.all(
          color: ColorApp.grey.withOpacity(
            0.3,
          ),
        ),
        boxShadow: [
          ElevationApp.elevation4pxBottom,
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: initialCameraPosition,
          markers: markers,
          mapType: MapType.normal,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          onCameraMove: null,
          polylines: polylines,
          circles: circles,
        ),
      ),
    );
  }
}
