import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class Lesson {
  final String id;
  final String name;
  final int duration;
  final bool locked;
  final String category;
  final DateTime createdAt;

  Lesson({
    required this.id,
    required this.name,
    required this.category,
    required this.createdAt,
    required this.duration,
    required this.locked,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      duration: json['duration'],
      locked: json['locked'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

final lessonProvider = FutureProvider<List<Lesson>>((ref) async {
  final response = await http.get(
    Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons'),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body)['items'] as List<dynamic>;
    return jsonData.map((item) => Lesson.fromJson(item)).toList();
  } else {
    throw Exception('Failed to fetch Lessons');
  }
});
void refreshLessonProvider(WidgetRef ref) {
  ref.refresh(lessonProvider.future);
}
