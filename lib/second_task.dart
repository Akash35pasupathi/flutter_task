import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

 const String _channel = 'test_activity';
 const platform = const MethodChannel(_channel);

_getNewActivity() async {
  try {
    await platform.invokeMethod('startNewActivity');
  } on PlatformException catch (e) {
    print(e.message);
  }
}