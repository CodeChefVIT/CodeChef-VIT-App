import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MemberData with ChangeNotifier {
  List<dynamic> _details = [];

  List<dynamic> get details {
    return _details;
  }

  Future<void> saveData(token, csv) async {
    final url = 'https://codechef-vit-app.herokuapp.com/member/register/';
    try {
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: jsonEncode({"path": csv}));
      print(response.statusCode);
      print(response.body);
    } catch (error) {
      print(error);
    }
  }

  Future<void> dataUpload(filePath, token) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': token
      };
      final apiUrl = 'https://codechef-vit-app.herokuapp.com/member/upload/';
      final multipartRequest =
          new http.MultipartRequest('POST', Uri.parse(apiUrl));
      multipartRequest.headers.addAll(headers);
      var multipartFile = await http.MultipartFile.fromPath('csv', filePath);
      multipartRequest.files.add(multipartFile);
      var response = await multipartRequest.send();
      final respStr = await response.stream.bytesToString();
      Map valueMap = json.decode(respStr);
      saveData(token, valueMap['csv']);
    } catch (error) {
      print(error);
    }
  }

  Future<void> memberDetails(token) async {
    try {
      final url = 'https://codechef-vit-app.herokuapp.com/member/view/';
      final Response response = await get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      });
      List<dynamic> res = json.decode(response.body);
      _details = res;
    } catch (error) {
      throw error;
    }
  }
}
