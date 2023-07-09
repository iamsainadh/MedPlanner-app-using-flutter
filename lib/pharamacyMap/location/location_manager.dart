import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:medication_remainder/pharamacyMap/providers/map_provider.dart';
import 'package:medication_remainder/pharamacyMap/utils/reusable_methods.dart';
import 'package:provider/provider.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();

  factory LocationService() {
    return _instance;
  }

  LocationService._internal();
  Location location = Location();

  Future<void> fetchCurrentLocation(BuildContext context, Function mapData,
      {Function? updatePosition}) async {
    LocationData? getLocation;
    await location.changeSettings(accuracy: LocationAccuracy.high);
    try {
      var hasLocationPermission = await location.hasPermission();
      if (hasLocationPermission == PermissionStatus.granted) {
        grantedPermissionMethod(context, getLocation, mapData,
            updatePosition: updatePosition);
      } else if (hasLocationPermission == PermissionStatus.denied) {
        var permissionGranted = await location.requestPermission();
        if (permissionGranted == PermissionStatus.granted) {
          grantedPermissionMethod(context, getLocation, mapData,
              updatePosition: updatePosition);
        } else if (permissionGranted == PermissionStatus.denied) {
          serviceDisabledMethod(context, mapData);
        }
      }
    } on PlatformException catch (e) {
      debugPrint(e.code);
    }
  }

  void grantedPermissionMethod(
      BuildContext context, LocationData? locData, Function? mapData,
      {Function? updatePosition}) async {
    var hasLocationServiceEnabled = await location.serviceEnabled();
    if (hasLocationServiceEnabled) {
      serviceEnabledMethod(locData, context, mapData!,
          updatePosition: updatePosition);
    } else {
      var serviceEnabled = await location.requestService();
      if (serviceEnabled) {
        serviceEnabledMethod(locData, context, mapData!,
            updatePosition: updatePosition);
      } else {
        serviceDisabledMethod(context, mapData!);
      }
    }
  }

  void serviceEnabledMethod(
      LocationData? getLoc, BuildContext context, Function getMapData,
      {Function? updatePosition}) async {
    getLoc = await location.getLocation();
    Provider.of<MapProvider>(context, listen: false).updateCurrentLocation(
        LatLng(getLoc.latitude!.toDouble(), getLoc.longitude!.toDouble()));
    updatePosition!(CameraPosition(
        zoom: 0,
        target:
            LatLng(getLoc.latitude!.toDouble(), getLoc.longitude!.toDouble())));
    if (Provider.of<MapProvider>(context, listen: false).currentLatLng !=
        null) {
      await getMapData();
      _getLocationUpdates(context, getLoc, getMapData);
    }
  }

  void serviceDisabledMethod(BuildContext context, Function getMapData) {
    debugPrint("Disable Permission");
  }

  Future<void> _getLocationUpdates(BuildContext context,
      LocationData locationData, Function callUpdateData) async {
    location.onLocationChanged.listen((value) {
      final distance = calculateDistance(value.latitude, value.longitude,
          locationData.latitude, locationData.longitude);
      Provider.of<MapProvider>(context, listen: false).updateCurrentLocation(
          LatLng(value.latitude!.toDouble(), value.longitude!.toDouble()));
      locationData = value;
      if (distance > 0.5) {
        callUpdateData();
      }
    });
  }
}
