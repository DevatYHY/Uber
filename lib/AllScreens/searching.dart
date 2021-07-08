import 'package:flutter/material.dart';
class SearchScreen extends StatefulWidget {
  

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 220.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius:6.0,
                  spreadRadius:0.5,
                  offset: Offset(0.7,0.7),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 25.0, right:25.0,top: 25.0, bottom:25.0),
              child: Column(children:[
                SizedBox(height:5.0),
                Stack(children:[
                  Icon(Icons.arrow_back),
                  Center(
                    child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        CircleAvatar(
                          backgroundImage: AssetImage("images/profile1.jpg"),
                          radius: 12,
                        ),
                        SizedBox(width:4),
                        
                        Text("For Me", 
                        style: TextStyle(fontFamily:"Uber Move",fontSize:12.0)
                      ),
                      Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
                ),
                SizedBox(height:16.0),
                Row(children:[
                  Icon(Icons.location_pin),
                  SizedBox(height:18.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:TextField(
                          decoration:InputDecoration(
                            hintText: "Enter Pickup Location",
                            fillColor: Colors.grey[100],
                            filled:true,
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.only(left: 11.0,top:8.0,bottom:8.0)
                          )
                        )
                      )
                    )
                  )  
                ],
                ),
                SizedBox(height:16.0),
                Row(children:[
                  Icon(Icons.crop_square),
                  SizedBox(height:18.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:TextField(
                          decoration:InputDecoration(
                            hintText: "Where to?",
                            fillColor: Colors.grey[100],
                            filled:true,
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.only(left: 11.0,top:8.0,bottom:8.0)
                          )
                        )
                      )
                    )
                  )  
                ],
                )
              ]) ,
            ),
          ),
          SizedBox(height: 20.0,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                
              children: [
                Padding(
                  padding: EdgeInsets.only(left:13.0),
                ),
                Icon(Icons.star,color: Colors.grey[500],),
                SizedBox(width:5.0),
                Text("Saved Places",style:TextStyle(fontFamily:"Uber Move",fontSize:24.0) ),
                
              ],
            ),
            SizedBox(height:10.0),
            Divider(),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                
              children: [
                Padding(
                  padding: EdgeInsets.only(left:13.0),
                ),
                Icon(Icons.location_pin,color: Colors.grey[500],),
                SizedBox(width:5.0),
                Text("Set Location on Map",style:TextStyle(fontFamily:"Uber Move",fontSize:24.0) ),
                
              ],
            ),
            SizedBox(height:10.0),
            Divider(),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                
              children: [
                Padding(
                  padding: EdgeInsets.only(left:13.0),
                ),
                Icon(Icons.play_arrow,color: Colors.grey[500],),
                SizedBox(width:5.0),
                Text("Enter Destination Later",style:TextStyle(fontFamily:"Uber Move",fontSize:24.0) ),
              ],
            ),
            Divider(),
            ],
          ),
          
        ],
      )
    );
  }
}
