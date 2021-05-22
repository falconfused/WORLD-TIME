import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String url;
  String flag;
  bool isDaytime;
  WorldTime({this.location, this.flag, this.url});

  Future<void> getdata() async {
    // make the request
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map vli = jsonDecode(response.body);

      // get properties from data
      String datetime = vli['datetime'];
      String offset = vli['utc_offset'].substring(0, 3);
      String offsetm = vli['utc_offset'].substring(4, 6);
      // print(datetime);
      // print(offset);

      // create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      now = now.add(Duration(minutes: int.parse(offsetm)));
      print(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      // set the time property
      time = DateFormat.jm().format(now);
    } on Exception catch (e) {
      print(e);
      time = 'could not get time';
    }
  }
}
