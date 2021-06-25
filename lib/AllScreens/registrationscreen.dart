import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uber/AllScreens/mainscreen.dart';
import 'package:uber/main.dart';
import 'package:uber/util/history.dart';
import 'package:uber/widgets/rectangle_button.dart';

import 'loginscreen.dart';

class RegisterScreen extends StatelessWidget {
  //const LoginScreeen({ Key? key }) : super(key: key);
  static const String idScreen="RegiserScreen";

  TextEditingController nameTextEditingController=TextEditingController();
  TextEditingController emailTextEditingController=TextEditingController();
  TextEditingController phoneTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();

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
              Text('Register as Rider', 
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
                    controller: nameTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                  hintText: "Name",
                  hintStyle: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                )
              ),
              TextField(
                controller: emailTextEditingController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(
                  fontSize: 12.0,
                )
              ),
              
              TextField(
                controller: phoneTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                  labelText: "Phone",
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                  hintText: "Phone",
                  hintStyle: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                )
              ),
              TextField(
                controller: passwordTextEditingController,
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
              SizedBox(height: 15.0),
              RectangleButton(
                
                color: Colors.black,
                onPressed:(){
                  if(nameTextEditingController.text.length<3){
                    displayToastMessage(
                      "name must be at least 2 characters",context);
                  }
                  else if(!emailTextEditingController.text.contains("@")){
                    displayToastMessage("incorrect email",context);

                  }
                  else if(phoneTextEditingController.text.isEmpty){
                    displayToastMessage("Enter Phone Number",context);
                  }
                   else if(passwordTextEditingController.text.length <9){
                    displayToastMessage("Password must be at least 8 characters",context);
                  }
                  else{
                     registerNewUser(context);
                  }
                 
                },
                child: Text(
                "Create Account",
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
            History.pushPageReplacement(context, LoginScreeen());
          },
          child: Text(
            "Already have an account? Login Here."
          ),
          ),
          ],
          ),
        ),
      )
    );
  }

  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async {
    final User firebaseUser=(await _firebaseAuth.
    createUserWithEmailAndPassword(
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text,
      ).catchError((errMsg){
        displayToastMessage("Error: "+errMsg.toString(),context);
      })).user;

       if(firebaseUser!=null) //user created
        {
         //save info
         
         Map userDataMap={
           "name" : nameTextEditingController.text.trim(),
           "email" : emailTextEditingController.text.trim(),
           "phone": phoneTextEditingController.text.trim(),
         };
         usersRef.child(firebaseUser.uid).set(userDataMap);
         displayToastMessage("Congratulations 🎉", context);
         History.pushPageReplacement(context, MainScreen());
      }
       else{
         // error
         displayToastMessage("New User account has not craeted ",context);
      }
  }
}
displayToastMessage(String message,BuildContext context){
    Fluttertoast.showToast(msg: message);
  }