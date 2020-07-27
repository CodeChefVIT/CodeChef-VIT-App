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
      final url = 'https://codechef-vit-app.herokuapp.com/member/list/';
      final Response response = await get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      });
      Map<String, dynamic> res = json.decode(response.body);
      _details = res['members'];
    } catch (error) {
      throw error;
    }
  }

  Future<void> deleteMember(token, uuid) async {
    try {
      final url = 'https://codechef-vit-app.herokuapp.com/member/view/$uuid/';
      final Response response = await delete(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      });
      print(response.statusCode);
    } catch (error) {
      throw error;
    }
  }

  Future<void> memberEdit(Map changedData, token, uuid) async {
    final url = 'https://codechef-vit-app.herokuapp.com/member/view/$uuid/';
    try {
      await patch(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: json.encode(changedData));
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> createMember(token, Map data) async {
    final url = 'https://codechef-vit-app.herokuapp.com/member/view/';
    try {
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: jsonEncode(data));
      notifyListeners();
      print(response.statusCode);
      print(response.body);
    } catch (error) {
      print(error);
    }
  }
}
