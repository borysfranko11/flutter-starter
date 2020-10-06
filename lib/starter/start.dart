import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/util.dart';
import '../utils/gps.dart';

import 'package:starter/pages/home.dart';




class Starter extends StatefulWidget {

  Starter({Key key}) : super(key: key);
    
  _StarterState createState() => _StarterState();
}


class _StarterState extends State<Starter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  enableLocationServices() {  
    CustomGPSProvider.getUserCurrentLocation().then( (value){
      _showMyDialog(value.first);
/*       Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Home(location: value.first, address: value.last ))
      );      */
    });
   
  }

   Future<void> _showMyDialog(val) async {
    return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(val),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  } 

  _launchURL() async {
    const url = 'https://garagesnearme.co.uk/privacy';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Hero(
                  tag: 'Clipboard',
                  child: Image.asset('assets/images/main_logo.png'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Garages Near Me',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.TextHeader),
                    ),
                    SizedBox(height: 15),                    
                    Text(
                      'By continuing, you agree to our Privacy Policy.',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.TextBody,
                          fontFamily: 'opensans'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                  onPressed: enableLocationServices,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: 70,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          CustomColors.OrangeMainColor,
                          CustomColors.OrangeMainColor,
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreenShadow,
                          blurRadius: 0,
                          spreadRadius: 0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Center(
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[                      
                      FlatButton(
                        onPressed: _launchURL,
                        child:Text(
                          'Privacy Policy',
                           style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: CustomColors.TextBody,
                                fontFamily: 'opensans'),
                                textAlign: TextAlign.center,
                                
                          ),
                      ),
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}