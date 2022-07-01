import 'dart:convert' as convert;

import 'package:dio/dio.dart';

class UserService {
  var http = Dio();
  var base_url = 'http://localhost:3004';

  Future<dynamic> getUser() async {
    return await http.get('${base_url}/users');
  }

  Future postUser(Map<String, dynamic> data) async {
    return await http.post('${base_url}/users', data: data);
  }
}
