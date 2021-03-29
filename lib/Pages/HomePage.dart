import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telegramchatapp/Pages/AccountSettingsPage.dart';
import 'package:telegramchatapp/main.dart';
import 'package:google_sign_in/google_sign_in.dart';


class HomeScreen extends StatefulWidget {
  final String currentUserId;
  HomeScreen({Key key, @required this.currentUserId}) : super(key: key);

  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  TextEditingController searchTextEditingController = TextEditingController();

  homePageHeader(){
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
       IconButton(
           icon: Icon(Icons.settings, size: 30.0, color: Colors.white,),
           onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
           })
      ],
      backgroundColor: Colors.lightBlue,
      title: Container(
        margin: EdgeInsets.only(bottom: 4.0),
        child: TextFormField(
          style: TextStyle(fontSize: 18.0, color: Colors.white),
          controller: searchTextEditingController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageHeader(),
      body:  RaisedButton.icon(onPressed: logOutUser, icon: Icon(Icons.exit_to_app,),
    label: Text("Sign Out"),),
    );

  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<Null> logOutUser() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)
    => MyApp()), (route) => false);

  }
}



class UserResult extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

  }
}
