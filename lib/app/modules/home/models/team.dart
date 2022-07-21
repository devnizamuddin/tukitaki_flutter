import 'dart:convert';

import 'package:flutter/foundation.dart';

class TeamModel {
  final String id;
  String? name;
  String? description;
  List<String>? membersId;
  TeamModel({
    required this.id,
    this.name,
    this.description,
    this.membersId,
  });

  TeamModel copyWith({
    String? id,
    String? name,
    String? description,
    List<String>? membersId,
  }) {
    return TeamModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      membersId: membersId ?? this.membersId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'membersId': membersId,
    };
  }

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      id: map['id'] ?? '',
      name: map['name'],
      description: map['description'],
      membersId: List<String>.from(map['membersId']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamModel.fromJson(String source) => TeamModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TeamModel(id: $id, name: $name, description: $description, membersId: $membersId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TeamModel && other.id == id && other.name == name && other.description == description && listEquals(other.membersId, membersId);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ membersId.hashCode;
  }
}
