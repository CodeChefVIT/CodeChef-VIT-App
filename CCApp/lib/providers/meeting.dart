import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';
import 'package:CCApp/utils/key.dart' as k;

class MeetingData with ChangeNotifier {
  List<dynamic> _details = [];
  List<dynamic> _attendance = [];
  bool _marked = false;
  List<String> fcmTokens = [];
  Map<String, dynamic> notifData = {};

  List<dynamic> get details {
    return _details;
  }

  bool get marked {
    return _marked;
  }

  List<dynamic> get attendance {
    return _attendance;
  }

  Map<String, String> _meetingDetailsResp = {};

  Map<String, String> get meetingDetailsResp {
    return _meetingDetailsResp;
  }

  Future<void> meetingView(token) async {
    final url = 'https://codechef-vit-app.herokuapp.com/meeting/new/';
    final Response response = await get(url,
        headers: {'Content-Type': 'application/json', 'Authorization': token});
    List<dynamic> res = json.decode(response.body);
    _details = res;
    notifyListeners();
  }

  Future<void> sendNotification(Map<String, dynamic> data) async {
    final url = "https://fcm.googleapis.com/fcm/send";
    try {
      await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'key=' + k.serverkey
          },
          body: json.encode(data));
      fcmTokens.clear();
    } catch (error) {
      throw error;
    }
  }

  Future<void> meetingCreate(Map<String, String> data, token) async {
    final url = 'https://codechef-vit-app.herokuapp.com/meeting/new/';
    try {
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: json.encode(data));
      var res = json.decode(response.body);
      var members = res['members'];
      for (var i in members) {
        if (i['fcm'] != null) {
          fcmTokens.add(i['fcm']);
        }
      }
      print(fcmTokens);
      notifData['registration_ids'] = fcmTokens;
      notifData['collapse_key'] = "type_a";
      notifData['notification'] = {
        "body": "New Meeting",
        "title": "New meeting at " + data['venue'] + " for " + data['members']
      };
      await sendNotification(notifData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> meetingEdit(Map<String, String> changedData, token, uuid) async {
    final url = 'https://codechef-vit-app.herokuapp.com/meeting/new/$uuid/';
    try {
      await patch(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: json.encode(changedData));
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> meetingDelete(token, uuid) async {
    try {
      final url = 'https://codechef-vit-app.herokuapp.com/meeting/new/$uuid/';
      final Response response = await delete(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token});
      print(response.statusCode);
    } catch (error) {
      throw error;
    }
  }

  Future<bool> startAttendance(token, uuid) async {
    Map<String, String> _meetingDetailsExtra = {};
    final url = 'https://codechef-vit-app.herokuapp.com/meeting/new/$uuid/';
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    _meetingDetailsExtra['latitude'] = position.latitude.toString();
    _meetingDetailsExtra['longitude'] = position.longitude.toString();
    var time = DateTime.now();
    _meetingDetailsExtra['start_time'] = time.toString();
    try {
      var response = await patch(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: json.encode(_meetingDetailsExtra));
      var res = json.decode(response.body);
      _meetingDetailsResp['latitude'] = res['latitude'];
      _meetingDetailsResp['longitude'] = res['longitude'];
      _meetingDetailsResp['start_time'] = res['start_time'];
      print(_meetingDetailsResp);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> markAttendance(token, meetuuid) async {
    var url = 'https://codechef-vit-app.herokuapp.com/meeting/mark/?meeting=$meetuuid';
    try {
      var response = await http.get(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token});
      var res = json.decode(response.body);
      print(res);
    } catch (error) {
      print(error);
    }
  }

  Future<void> viewAttendance(token, meetuuid) async {
    var url = 'https://codechef-vit-app.herokuapp.com/meeting/view/?meeting=$meetuuid';
    try {
      var response = await http.get(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token});
      print(response.statusCode);
      var res = json.decode(response.body);
      _attendance = res['attendance'];
      print(res);
    } catch (error) {
      print(error);
    }
  }
}
