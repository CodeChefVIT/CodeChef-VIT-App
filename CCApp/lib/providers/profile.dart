import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:CCApp/utils/http_exception.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile with ChangeNotifier{

  String _uuid;

  List<dynamic> _details = [];

  List<dynamic> get details {
    return _details;
  }

  Future<void> profileSetup(Map<String,String> data,token) async {
    final url = 'https://codechef-vit-app.herokuapp.com/profile/';
    try{
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':token
        },
        body: json.encode(data)
      );
      print(response.statusCode);
      print(response.body);
      if(response.statusCode == 201){
        final resBody = json.decode(response.body);
        _uuid = resBody["uuid"];
        notifyListeners();
      } else {
        throw HttpException('Profile Setup Failed');
      }
    } catch(error){
      throw error;
    }
  }

  Future<void> profileView(token) async {
    final url='https://codechef-vit-app.herokuapp.com/profile/';
    final Response response = await get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':token
      }
    );
    List<dynamic> res=json.decode(response.body);
    _details=res;
  }
} 