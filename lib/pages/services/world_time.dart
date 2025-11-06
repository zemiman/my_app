import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String location; //location name for the UI
  String time = ''; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // make the request
      // var url = Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
      var uri = Uri.http('worldtimeapi.org', '/api/timezone/${this.url}');
      var response = await http.get(uri);
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //set the time property:
      time = now.toString();
    } catch (e) {
      print('Error message:$e');
      time = 'Could not get the time';
    }
  }
}
