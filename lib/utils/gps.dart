//import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
class CustomGPSProvider {
  static  Future<List> getUserCurrentLocation() async{
    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    String lat = position.latitude.toString();
    String long = position.longitude.toString();
    String coord = lat+','+long;
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);    
    Placemark placeMark  = placemarks[0]; 
    //String name = placeMark.name;
    //String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    //String country = placeMark.country; 
    String address =  locality + ',' + administrativeArea+','+ postalCode;
    //"${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";
    return [coord, address];
  }

  static Future<List> getUserCurrentCoord() async{
    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return [position.latitude, position.longitude];
  }

  static Future<String> getUserCurrentCoordAsString() async {
    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    String lat = position.latitude.toString();
    String long = position.longitude.toString();
    String coord = lat+','+long;
    return coord;
  }

  static Future<String> getUserCurrentAddressFromCoord(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark placeMark  = placemarks[0]; 
    //String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    //String country = placeMark.country; 
    String address =  subLocality + ',' + locality + ',' + administrativeArea+','+ postalCode;

    return address;
  }
 }