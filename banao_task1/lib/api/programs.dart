import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
class Program {
  final String id;
  final String name;
  final String category;
  final int lesson;
  final DateTime createdAt;

  Program({
    required this.id,
    required this.name,
    required this.category,
    required this.lesson,
    required this.createdAt,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      lesson: json['lesson'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
} 

final programProvider = FutureProvider<List<Program>>((ref) async {
  final response = await http.get(
    Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/programs'),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body)['items'] as List<dynamic>;
    return jsonData.map((item) => Program.fromJson(item)).toList();
  } else {
    throw Exception('Failed to fetch programs');
  }
});
