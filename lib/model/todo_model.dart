import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TodoModel {
  final int? id;
  final String title;
  final String description;
  TodoModel({this.id, required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }
}
