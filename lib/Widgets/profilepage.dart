import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({ Key? key }) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
          child :  Text("hello frands")
          ),
        ],
      ),
    );
  }
}