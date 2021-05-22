import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgi = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    var txtcol = data['isDaytime'] ? Colors.black : Colors.white;
    var bgcol = data['isDaytime'] ? Colors.blueGrey[100] : Colors.blueGrey[800];
    // print(data);
    return Scaffold(
      backgroundColor: bgcol,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgi'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'location': result['location'],
                      'time': result['time'],
                      'flag': result['flag'],
                      'isDaytime': result['isDaytime'],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  size: 20,
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(fontSize: 20, color: txtcol),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 27, color: txtcol),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(fontSize: 66, color: txtcol),
              )
            ],
          ),
        ),
      )),
    );
  }
}
