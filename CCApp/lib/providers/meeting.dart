import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MeetingData with ChangeNotifier {
  List<dynamic> _details = [];

  List<dynamic> get details {
    return _details;
  }

  Future<void> meetingView(token) async {
    final url = 'https://codechef-vit-app.herokuapp.com/meeting/new/';
    final Response response = await get(url,
        headers: {'Content-Type': 'application/json', 'Authorization': token});
    List<dynamic> res = json.decode(response.body);
    _details = res;
  }

  Future<void> meetingCreate(Map<String, String> data, token) async {
    final url = 'https://codechef-vit-app.herokuapp.com/meeting/new/';
    try {
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: json.encode(data));
      print(response.statusCode);
      print(response.body);
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
}
