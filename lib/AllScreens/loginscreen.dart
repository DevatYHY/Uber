import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uber/AllScreens/mainscreen.dart';
import 'package:uber/AllScreens/registrationscreen.dart';
import 'package:uber/main.dart';
import 'package:uber/util/history.dart';
import 'package:uber/widgets/authentication_bar.dart';
import 'package:uber/widgets/rectangle_button.dart';

class LoginScreeen extends StatefulWidget {
  //const LoginScreeen({ Key? key }) : super(key: key);
  static const String idScreen="LoginScreen";
  @override
  State<LoginScreeen> createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
  TextEditingController emailTextEditingController=TextEditingController();
  TextEditingController passwordTextEditingController=TextEditingController();

  SharedPreferences logindata;
  bool newuser;

  @override
  void initState(){
    super.initState();
    check_if_already_login();
  }
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
                width: 100.0, 
                height: 100.0, 
                alignment: Alignment.centerRight,
                ),
              ),
              ),
              SizedBox(height: 20.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[ 
                  Text('  Let\'s Log you in', 
                  style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: "Uber Move",
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
                ),
                Text(' .', 
              style: TextStyle(
                fontSize: 40.0,
                fontFamily: "Uber Move",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              ),
                ],
              ),
                SizedBox(height: 80.0,),
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
                    fontFamily: "Uber Move",
                  ),
                  hintText: "Email",
                  icon: Icon(Icons.email),
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Uber Move",
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Uber Move",
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
                    fontFamily: "Uber Move",
                  ),
                  hintText: "Password",
                  icon: Icon(Icons.lock),
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Uber Move",
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Uber Move",
                )
              ),
              SizedBox(height: 100.0),
              RectangleButton(
                color: Colors.black,
                onPressed:() async{
                String email= emailTextEditingController.text;
                String password= passwordTextEditingController.text;

                if(email !='' && password !=''){
                  print('Success');
                  logindata.setBool('login', false);
                  logindata.setString('email',email);
                  History.pushPageReplacement(context, MainScreen());
                }
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
                  fontSize: 18.0,
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

  void check_if_already_login() async{
    logindata=await SharedPreferences.getInstance();
    newuser=(logindata.getBool('login')??true);
    print(newuser);
    if(newuser==false){
      History.pushPageReplacement(context,MainScreen());
    }
  }

  @override
  void dispose(){
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
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