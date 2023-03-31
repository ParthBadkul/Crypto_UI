import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

class Post {
  String name;
  String code;
  String price;
  String icon;

  Post({
    required this.code,
    required this.icon,
    required this.price,
    required this.name,
  });

  factory Post.fromMap(Map<String, dynamic> json) => Post(
      code: json["code"],
      icon: json["icon"],
      price: json["price"],
      name: json["name"]);
}
