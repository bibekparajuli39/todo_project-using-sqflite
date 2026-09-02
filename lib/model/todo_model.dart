// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  final int? id;
  final int title;
  final String description;

  TodoModel(this.id, {required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title, 'description': description};
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      map['id'] as int?,
      title: map['title'] as int,
      description: map['description'] as String,
    );
  }
}
