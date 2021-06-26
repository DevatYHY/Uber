import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uber/AllScreens/mainscreen.dart';
import 'package:uber/AllScreens/registrationscreen.dart';
import 'package:uber/main.dart';
import 'package:uber/util/history.dart';
import 'package:uber/widgets/authentication_bar.dart';
import 'package:uber/widgets/rectangle_button.dart';

class LoginScreeen extends StatelessWidget {
  //const LoginScreeen({ Key? key }) : super(key: key);

  TextEditingController emailTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();

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
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                  hintText: "Email",
                  icon: Icon(Icons.email),
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
                controller: passwordTextEditingController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                  hintText: "Password",
                  icon: Icon(Icons.lock),
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
                  if(!emailTextEditingController.text.contains("@")){
                    displayToastMessage("incorrect email",context);
                  }
                  else if(passwordTextEditingController.text.length <9){
                    displayToastMessage("Password Incorrect",context);
                  }
                  else{
                    loginAndAuthenticateUser(context);
                  }
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
      
          TextButton(
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

  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async {

    showDialog(
      context:context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AuthBar(message: "Authenticating, please wait");
      }
    );

    final User firebaseUser=(await _firebaseAuth
   .signInWithEmailAndPassword(
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text,
      ).catchError((errMsg){
        Navigator.pop(context);
        displayToastMessage("Error: "+errMsg.toString(),context);
      })).user;

       if(firebaseUser!=null) //user created
        {
          usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap){
            if(snap.value!=null){
                History.pushPageReplacement(context, MainScreen());
                displayToastMessage("Successfully LoggedIn", context);
            }
            else{
              Navigator.pop(context);
              _firebaseAuth.signOut();
              displayToastMessage("Create new account", context);
            }
          });
      }
        else{
         Navigator.pop(context);
          displayToastMessage("Error! Cannot Sign in",context);
      }

  }
}