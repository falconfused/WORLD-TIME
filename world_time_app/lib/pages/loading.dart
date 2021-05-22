import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time_app/pages/services/world_time.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // String time = 'Loading....';
  void setTime() async {
    WorldTime inst =
        WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
    await inst.getdata();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': inst.location,
      'flag': inst.flag,
      'time': inst.time,
      'isDaytime': inst.isDaytime
    });
    // setState(() {
    //   time = inst.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    setTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WORLD TIME"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }
}
