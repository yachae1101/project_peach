import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GlobalKeyOf with ChangeNotifier{
  final _authentication = FirebaseAuth.instance;
  FirebaseAuth get authentication => _authentication;
}
