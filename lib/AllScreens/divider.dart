import 'package:flutter/material.dart';
class DividerWidget extends StatelessWidget {
  //const Divider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 3.0,
      color: Colors.grey,
      thickness: 1.0,

    );
  }
}