import 'package:flutter/material.dart';

class SnackbarHelper {
  const SnackbarHelper._(); //calls the private constructor

  static final _key = GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<ScaffoldMessengerState> get key => _key;

  static void showSnackBar(String? message, {bool isError = false}) =>
      _key.currentState
        ?..removeCurrentSnackBar() //check that the object is not null before calling it
        ..showSnackBar(
          SnackBar(
            content: Text(message ?? ''),
          ),
        );
}
