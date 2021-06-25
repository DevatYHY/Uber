import 'package:flutter/material.dart';
import 'package:uber/AllScreens/registrationscreen.dart';
import 'package:uber/util/history.dart';
import 'package:uber/widgets/rectangle_button.dart';

class LoginScreeen extends StatelessWidget {
  //const LoginScreeen({ Key? key }) : super(key: key);
  static const String idScreen="LoginScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
            SizedBox(
            height: 8.0, 
            ),
              Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                image: AssetImage("images/logo_main.png"), 
                width: 200.0, 
                height: 200.0, 
                alignment: Alignment.centerRight,
                ),
              ),
              ),
              SizedBox(height: 20.0,),
              Text('Login as Rider', 
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: "Uber Move",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              ),
      
              // Email
      
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(children: [
                  SizedBox(height: 20.0,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                )
              ),
      
              // Passwords
      
              SizedBox(height: 20.0,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(
                  fontSize: 12.0,
                )
              ),
              SizedBox(height: 150.0),
              RectangleButton(
                color: Colors.black,
                onPressed:(){
                 print("loggedin");
                },
                child: Text(
                "Login",
                
                style: TextStyle(
                  fontFamily: "Uber Move",
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),  
              )
            ],
          )
          ),
      
          FlatButton(
          onPressed:(){
            History.pushPage(context, RegisterScreen());
          },
          child: Text(
            "Do not have an account? Register Here."
          ),
          ),
          ],
          ),
        ),
      )
    );
  }
}