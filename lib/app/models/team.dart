import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'user.dart';

class TeamModel {
  String id;
  String ownerId;
  String code;
  String? name;
  String? description;
  List<String>? membersId;
  List<UserModel>? members;
  TeamModel({
    required this.id,
    required this.ownerId,
    required this.code,
    this.name,
    this.description,
    this.membersId,
    this.members,
  });

  TeamModel copyWith({
    String? id,
    String? ownerId,
    String? code,
    String? name,
    String? description,
    List<String>? membersId,
    List<UserModel>? members,
  }) {
    return TeamModel(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      membersId: membersId ?? this.membersId,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ownerId': ownerId,
      'code': code,
      'name': name,
      'description': description,
      'membersId': membersId,
      'members': members?.map((x) => x.toMap()).toList(),
    };
  }

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      id: map['id'] ?? '',
      ownerId: map['ownerId'] ?? '',
      code: map['code'] ?? '',
      name: map['name'],
      description: map['description'],
      membersId: List<String>.from(map['membersId']),
      members: map['members'] != null ? List<UserModel>.from(map['members']?.map((x) => UserModel.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamModel.fromJson(String source) => TeamModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TeamModel(id: $id, ownerId: $ownerId, code: $code, name: $name, description: $description, membersId: $membersId, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TeamModel && other.id == id && other.ownerId == ownerId && other.code == code && other.name == name && other.description == description && listEquals(other.membersId, membersId) && listEquals(other.members, members);
  }

  @override
  int get hashCode {
    return id.hashCode ^ ownerId.hashCode ^ code.hashCode ^ name.hashCode ^ description.hashCode ^ membersId.hashCode ^ members.hashCode;
  }
}
