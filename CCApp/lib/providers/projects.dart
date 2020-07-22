import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Project with ChangeNotifier {
  List<dynamic> _details = [];

  List<dynamic> get details {
    return _details;
  }

  Future<void> projectView(token) async {
    final url = 'https://codechef-vit-app.herokuapp.com/project/new/';
    var response = await http.get(url,
        headers: {'Content-Type': 'application/json', 'Authorization': token});
    List<dynamic> res = json.decode(response.body);
    print(res);
    _details = res;
  }

  Future<void> deleteProject(token, uuid) async {
    try {
      final url = 'https://codechef-vit-app.herokuapp.com/project/new/$uuid/';
      var response = await http.delete(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      });
      print(response.statusCode);
    } catch (error) {
      throw error;
    }
  }

  Future<void> projectCreate(Map<String, String> data, token) async {
    final url = 'https://codechef-vit-app.herokuapp.com/project/new/';
    try {
      var res = await http.post(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: json.encode(data));
      print(res);
    } catch (error) {
      throw error;
    }
  }
}
