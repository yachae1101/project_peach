import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_peach/screens/start/start_screen.dart';

class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
 _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        if(!user.emailVerified){
          Navigator.pop(context);
        }
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e){
      print(e);
    }
  }

  Future<bool> _onWillPop() async {
    _authentication.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => StartPage()),
          (route) => false,
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('chat screen'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.exit_to_app_sharp,
                color: Colors.black,
              ),
              onPressed: () async {
                await _authentication.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => StartPage()),
                      (route) => false,
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Text('chat screen'),
        ),
      ),
    );
  }
}