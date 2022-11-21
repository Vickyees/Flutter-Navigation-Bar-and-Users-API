import 'dart:convert';

import 'package:http/http.dart' as http;

class MyData {
  Future<List<dynamic>> fetchUsers() async {
    var result =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    return json.decode(result.body);
  }

  Future<Map> fetchUser() async {
    var result = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1"));
    return json.decode(result.body);
  }
}
