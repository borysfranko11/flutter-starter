import 'package:flutter/material.dart';

import '../utils/util.dart';

class Home extends StatefulWidget {
  final String location;
  final String address;
  Home({Key key, @required this.location, @required this.address}) : super(key: key);
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {


  String lat = '';
  String long = '';

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
       leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () { Navigator.pop(context); },
              tooltip: 'Go Previous Page',
            );
          },
        ),
        title: const Text('Home page'),
      ), 
      body: Center(
        child: Container (
          child: Column(
            children:<Widget>[
              Text(
                widget.location, 
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.TextBody,
                    fontFamily: 'opensans'),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.address, 
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.TextBody,
                    fontFamily: 'opensans'),
                textAlign: TextAlign.center,
              ),
            ]
          )                 
        )
      )
    );
  }
}