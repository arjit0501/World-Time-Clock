

import 'package:flutter/material.dart';
import 'package:world_time/Pages/loading.dart';
import 'package:world_time/Pages/location.dart';
import 'Pages/home.dart';
void main() {
  runApp(MaterialApp(
 initialRoute:'/',
    routes: {
   '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/location': (context)=>Location()


    },
    debugShowCheckedModeBanner: false,
  ));
}

