import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uber/AllScreens/divider.dart';
import 'package:uber/AllScreens/gotoScreen.dart';
import 'package:uber/AllScreens/loginscreen.dart';
import 'package:uber/AllScreens/searching.dart';
import 'package:uber/util/history.dart';
import 'package:uber/widgets/rectangle_button.dart';
import 'package:geolocator/geolocator.dart';
class MainScreen extends StatefulWidget {
  // const MainScreen({ Key? key }) : super(key: key);
static const String idScreen="MainScreen";
  @override
  var state= _MainScreenState();
  //_MainScreenState createState() => new _MainScreenState();
  _MainScreenState createState(){
return this.state=new _MainScreenState();
}
}
class _MainScreenState extends State<MainScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;
  double BottomPaddingMap=0; 
  Positioned _currentPosition; //Method
  var geoLocator= Geolocator();

  void locatePosition() async{
    Position position = await Geolocator.getCurrentPosition(forceAndroidLocationManager: true,desiredAccuracy: LocationAccuracy.best);
    LatLng latLatPosition =LatLng(position.latitude, position.longitude);
    CameraPosition camPosition =new CameraPosition(target: latLatPosition, zoom:15);
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(camPosition));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(22.572645, 88.363892),
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
        backgroundColor: Colors.black,
        title: Text(
          'Uber, Ride safe',
          style: TextStyle(
            fontFamily:"Uber Move",
          ),
          ),
      ),
      drawer: Drawer(
    child: Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/profile1.jpg'),
                        radius: 30.0,
                      ),
                    
                  ),
                  
                  SizedBox(height: 12.0,),
                  ListTile(
                        leading: Icon(Icons.person,
                        color: Colors.black,
                        ),
                        title: Text(
                          "Archishman Sengupta",
                        style: TextStyle(
                          fontFamily: "Uber Move", fontSize:16.0,),),
                          // onTap:(){
                          //   History.pushPageReplacement(context, GotoScreen())
                          // },
                          hoverColor: Colors.pink,
                          onTap:(){
                            History.pushPageReplacement(context, GotoScreen(),);
                          },
                          
                      ),
                      
                  ListTile(
                        leading: Icon(Icons.car_rental,color: Colors.black,),
                        title: Text("Your Trips",
                        style: TextStyle(
                          fontFamily: "Uber Move", fontSize:16.0,)),
                      ),
                      
                      ListTile(
                        leading: Icon(Icons.help,color: Colors.black,),
                        title: Text("Help",
                        style: TextStyle(
                          fontFamily: "Uber Move", fontSize:16.0,)),
                      ),
                      ListTile(
                        leading: Icon(Icons.money,color: Colors.black,),
                        title: Text("Wallet",
                        style: TextStyle(
                          fontFamily: "Uber Move", fontSize:16.0,)),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings,color: Colors.black,),
                        title: Text("Settings",
                        style: TextStyle(
                          fontFamily: "Uber Move", fontSize:16.0,)),
                      ),
                ],
              ),
            
          ),
        ],
      ),
    ),
  ),
      
        //     //Drawer Body Controllers
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: BottomPaddingMap),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller){
              _controllerGoogleMap.complete(controller);
              newGoogleMapController=controller;

              setState(() {
                BottomPaddingMap=265.0;
              });

              locatePosition();
            }
          ),
          
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(height:320.0,
            decoration:
            BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                ),
                boxShadow:[
              BoxShadow(
                color: Colors. black,
                blurRadius: 16.0,
                spreadRadius: 5.0,
                offset: Offset(0.7,0.7),
              ),
                ],
              
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6.0),
                  Text("Hello, ",style: 
                  TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Uber Move'),),
                  Text("Where to?",
                  style:
                    TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Uber Move',
                    ),
                    ),
                    SizedBox(height: 20.0,),
                    GestureDetector(
                      onTap:(){
                        History.pushPageReplacement(context, SearchScreen());
                      },
                      child: Container(
                        decoration:
                        BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                          boxShadow:[
                        BoxShadow(
                          color: Colors. black54,
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          offset: Offset(0.2,0.2),
                        ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            
                            children:[
                              SizedBox(width:7.0),
                            Icon(Icons.search
                            ,color: Colors.black26,),
                            SizedBox(width: 10.0,),
                            Text("Search Destination", 
                            style: TextStyle(
                              fontFamily: "Uber Move",
                              fontSize: 20.0,
                            ),),
                            
                          ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      children:[
                        Icon(Icons.work, color: Colors.grey,),
                        SizedBox(width: 12.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text("Add Work",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Uber Move",
                            ),
                            ),
                            SizedBox(height: 5.0,),
                        Text("Add your Work address", 
                        style: TextStyle(
                          fontFamily: "Uber Move",
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),),
                          ],
                        )
                      ],),
                      SizedBox(height: 10.0,),
                      DividerWidget(),
                      SizedBox(height: 16.0,),
                      Row(
                      children:[
                        Icon(Icons.home, color: Colors.grey,),
                        SizedBox(width: 12.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text("Add Home",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Uber Move",
                            ),
                            ),
                            SizedBox(height: 5.0,),
                        Text("Add your Home address", 
                        style: TextStyle(
                          fontFamily: "Uber Move",
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),),
                          ],
                        )
                      ],),
                ],
              ),
            ),
            ),
          ),
        ],
      ),

    );
  }
}