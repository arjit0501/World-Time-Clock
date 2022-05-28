import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    print(data);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [const SizedBox(height: 50,),
              FlatButton.icon(
                onPressed: () async {
                   dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data ={
                      'time':result['time'], 'location':result['location'] ,'flag' :result['flag'] ,
                      'isDayTime':result['isDayTime']
                    } ;
                  });

                },
                icon: const Icon(
                  Icons.location_on_sharp,
                  color: Colors.grey,
                ),
                label: const Text(
                  'Edit location',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                        fontSize: 30, letterSpacing: 2, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: const TextStyle(fontSize: 60,
                color:Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
