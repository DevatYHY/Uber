import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uber/AllScreens/loginscreen.dart';
import 'package:uber/util/history.dart';
import 'package:uber/widgets/rectangle_button.dart';

class MainScreen extends StatefulWidget {
  // const MainScreen({ Key? key }) : super(key: key);
static const String idScreen="MainScreen";
  @override
  _MainScreenState createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  SharedPreferences logindata;
  bool newuser;
  String email;

  @override
  void initState(){
    super.initState();
    initial();
  }
  void initial() async{
    logindata= await SharedPreferences.getInstance();
    setState(() {
      email=logindata.getString('email');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Uber, Ride safe',
          ),
      ),


      // body: RectangleButton(
      //   onPressed:(){
      //     logindata.setBool('login', true);
      //     History.pushPageReplacement(context, LoginScreeen());
      //   },
      //   child: Text('Log out'),
      // ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller){
              _controllerGoogleMap.complete(controller);
              newGoogleMapController=controller;
            }
          ),
        ],
      ),

    );
  }
}