import 'package:world_time/services/world_time.dart';
import 'package:flutter/material.dart';
class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);


  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<World_time> locations = [
  World_time(url: 'America/Argentina/Salta', flag: 'uk.png', location: 'Salta'),
    World_time(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    World_time(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'day.png'),
    World_time(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    World_time(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    World_time(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    World_time(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    World_time(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    World_time(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    World_time(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  updateTime(index) async{

    World_time instance = locations[index] ;

    await instance.getTime();
   print(instance.location);
   print(instance.flag);

   print(instance.time);
     Navigator.pop(context,{

      'location': instance.location,
       'flag': instance.flag,
     'time': instance.time,
    'isDayTime': instance.isDayTime
   }
    );
  }

  @override

    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),

      ),
      body:  ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
          child: Card(
            child: ListTile(
              onTap: (){
                    updateTime(index);

              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          color: Colors.orangeAccent,),
        );
      },itemCount: locations.length,)
    );
  }
}
