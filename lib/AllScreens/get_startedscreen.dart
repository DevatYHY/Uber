import 'package:flutter/material.dart';
import 'package:uber/AllScreens/loginscreen.dart';
import 'package:uber/util/history.dart';
import 'package:uber/widgets/rectangle_button.dart';

class GetStartedscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
          left: 55,
          top: 50,
          right: 50,
          bottom: 60,
        ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: buildTitle()),
                SizedBox(height: 20.0),
                Expanded(child: buildContent(),),
                Center(child: buildBottom(context)),
              ],
            ),
          )
        ),
    );
  }
  Widget buildTitle(){
    return Text("Uber",
     style: TextStyle(
          fontSize: 50.0,
          fontFamily: "Uber Move",
          color: Colors.black,
          //fontWeight: FontWeight.w100,
          letterSpacing: 2.0,
        ),);
  }
  Widget buildContent(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Image(
            image:AssetImage("images/hero.png"),  
            alignment: Alignment.centerRight,
            ),
          ),
      ],
      
    );
  }

  Widget buildBottom(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RectangleButton(
          color: Colors.black,
          onPressed:(){
            History.pushPage(context, LoginScreeen());
          },
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Get Started   ➡',style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Uber Move",
                  fontSize: 15,
                )),
              ],
            ),
          ),
        ),
        // SizedBox(
        //   height: 20,
        // ),
      ],
    );
  }

}