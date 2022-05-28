import 'package:flutter/material.dart';
import 'package:world_time/main.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading...';

  getData() async {
    World_time instance = World_time(
        url: 'America/Argentina/Salta', flag: 'Argentina.png', location: 'Salta');
    await instance.getTime();

    print(instance.time);
    setState(() {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime
      });
    });
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const SpinKitRipple(
          color: Colors.lightBlue,
          size: 80.0,
        ),
      ),
      backgroundColor: Colors.orangeAccent,
    );
  }
}
