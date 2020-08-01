import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Expense with ChangeNotifier {
  List<dynamic> _details = [];

  List<dynamic> get details {
    return _details;
  }
  Future<void> expenseView(token) async {
    final url = 'https://codechef-vit-app.herokuapp.com/bill/view/';
    var response = await http.get(url,
        headers: {'Content-Type': 'application/json', 'Authorization': token});
    List<dynamic> res = json.decode(response.body);
    print(res);
    _details = res;
  }
  Future<void> deleteExpense(token, uuid) async {
    try {
      final url = 'https://codechef-vit-app.herokuapp.com/bill/view/$uuid/';
      final response = await http.delete(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': token
      });
      print(response.statusCode);
    } catch (error) {
      throw error;
    }
  }
  Future<void> expenseEdit(Map<String, String> changedData, token, uuid) async {
    final url = 'https://codechef-vit-app.herokuapp.com/bill/view/$uuid/';
    try {
      var response = await http.patch(url,
          headers: {'Content-Type': 'application/json', 'Authorization': token},
          body: json.encode(changedData));
      print(response.body);
    } catch (error) {
      print(error);
      throw error;
    }
  }
  Future<void> expenseAdd(Map<String, String> data, token) async {
    final url = 'https://codechef-vit-app.herokuapp.com/bill/new/';
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