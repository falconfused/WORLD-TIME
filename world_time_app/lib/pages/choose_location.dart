import 'package:flutter/material.dart';
import 'package:world_time_app/pages/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'europe/london', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'europe/berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'africa/cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'africa/nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'america/chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'america/new_york', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'asia/seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'asia/jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'asia/kolkata', location: 'Kolkata', flag: 'India.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getdata();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
