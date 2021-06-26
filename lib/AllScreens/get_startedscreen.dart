import 'package:flutter/material.dart';
import 'package:uber/AllScreens/loginscreen.dart';
import 'package:uber/util/history.dart';
import 'package:uber/widgets/rectangle_button.dart';

class GetStartedscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        body: Center(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
            left: 55,
            top: 50,
            right: 50,
            bottom: 60,
          ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: buildTitle()),
                  SizedBox(height: 40.0),
                  Center(child: buildContent(),),
                  Expanded(child: Center(child: buildMiddle())),
                  SizedBox(height: 10.0),
                  Center(child: buildBottom(context)),
                ],
              ),
            )
          ),
        ),
    );
  }
  Widget buildTitle(){
    return Text("Uber",
     style: TextStyle(
          fontSize: 50.0,
          fontFamily: "Uber Move",
          color: Colors.white,
          //fontWeight: FontWeight.w100,
          letterSpacing: 2.0,
        ),);
  }
  Widget buildContent(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Center(
              child: Image(
                fit:BoxFit.fill,
              image:AssetImage("images/hero.png"),  
              alignment: Alignment.centerRight,
              ),
            ),
      ],
    );
  }
   Widget buildMiddle(){
    return Text("Move With Safety",
     style: TextStyle(
          fontSize: 30.0,
          fontFamily: "Uber Move",
          color: Colors.white,
          //fontWeight: FontWeight.w100,
          letterSpacing: 2.0,
        ),);
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
                  fontSize: 18,
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