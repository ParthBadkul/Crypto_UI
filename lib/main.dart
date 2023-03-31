import 'package:flutter/material.dart';
// import 'package:flutter_proj/test.dart';
import 'HomePage.dart';
import 'models/Post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Post>> fetchPost() async {
  final response =
      await http.get(Uri.parse('http://139.59.57.191:5000/user/getCryptoList'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromMap(json)).toList();
  } else {
    throw Exception('Failed ti load albumm');
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}
