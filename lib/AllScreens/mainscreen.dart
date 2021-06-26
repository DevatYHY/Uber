import 'package:flutter/material.dart';
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
          'Uber',
          ),
      ),
      body: RectangleButton(
        onPressed:(){
          logindata.setBool('login', true);
          History.pushPageReplacement(context, LoginScreeen());
        },
        child: Text('Log out'),
      ),
    );
  }
}