import 'package:http/http.dart' ;
import 'dart:convert';
import 'package:intl/intl.dart';
class World_time {
  String ? time;
  late String location ;
  late String flag ;
  late String url ;
  bool isDayTime = false;
  World_time({ required this.url,required this.flag,required this.location}) ;


  getTime() async {
    try{
      Response response = await get(Uri.parse(
          'https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      print(data);
      String datetime = data['utc_datetime'];
      String offset_sign = data['utc_offset'].substring(0,1) ;
      String offset_hour = data['utc_offset'].substring(0,3) ;
      String offset_mi = data['utc_offset'].substring(4,6) ;
      String offset_min ='$offset_sign$offset_mi';
      print(offset_min);
      DateTime now = DateTime.parse(datetime);
      print(now);
      now = now.add(Duration(hours: int.parse(offset_hour) ));
      now = now.add(Duration(minutes: int.parse(offset_min) ));
      isDayTime = now.hour <= 20 && now.hour >= 6 ? true : false ;
      time= DateFormat.jm().format(now) ;
    }
    catch (e){
    print('Error $e') ;
    time="Api is not working" ;
    }
  }

}