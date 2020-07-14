import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:CCApp/utils/http_exception.dart';
import 'package:http/http.dart';

class Profile with ChangeNotifier {
  List<dynamic> _details = [];
  String _uuid;

  String get uuid {
    return _uuid;
  }

  String _regno;

  String get regno {
    return _regno;
  }

  List<dynamic> get details {
    return _details;
  }

  Future<void> profileSetup(Map<String, String> data, token) async {
    final url = 'https://codechef-vit-app.herokuapp.com/profile/';
    try {
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: json.encode(data));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        notifyListeners();
      } else {
        throw HttpException('Profile Setup Failed');
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> profileView(token) async {
    final url = 'https://codechef-vit-app.herokuapp.com/profile/';
    final Response response = await get(url,
        headers: {'Content-Type': 'application/json', 'Authorization': token});
    List<dynamic> res = json.decode(response.body);
    _details = res;
    _uuid = res[0]['uuid'];
    _regno = res[0]['regno'];
  }

  Future<void> profileEdit(Map<String, String> changedData, token, uuid) async {
    final url = 'https://codechef-vit-app.herokuapp.com/profile/$uuid/';
    try {
      final Response response = await patch(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: json.encode(changedData));
      List<dynamic> res = [json.decode(response.body)];
      if (response.statusCode == 200) {
        _details = res;
        notifyListeners();
      } else {
        throw HttpException('Profile Edit Failed');
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
