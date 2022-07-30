import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tukitaki_flutter/app/models/user.dart';
import 'package:tukitaki_flutter/app/modules/task/models/taskMembers.dart';

class TaskModel {
  String id;
  String teamId;
  String ownerId;
  String name;
  String description;
  int type;
  String? taskType;
  List<String>? membersId;
  List<TaskMemberModel>? taskMembers;
  TaskModel({
    required this.id,
    required this.teamId,
    required this.ownerId,
    required this.name,
    required this.description,
    required this.type,
    this.taskType,
    this.membersId,
    this.taskMembers,
  });

  TaskModel copyWith({
    String? id,
    String? teamId,
    String? ownerId,
    String? name,
    String? description,
    int? type,
    String? taskType,
    List<String>? membersId,
    List<TaskMemberModel>? taskMembers,
  }) {
    return TaskModel(
      id: id ?? this.id,
      teamId: teamId ?? this.teamId,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      taskType: taskType ?? this.taskType,
      membersId: membersId ?? this.membersId,
      taskMembers: taskMembers ?? this.taskMembers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'teamId': teamId,
      'ownerId': ownerId,
      'name': name,
      'description': description,
      'type': type,
      'taskType': taskType,
      'membersId': membersId,
      'taskMembers': taskMembers?.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? '',
      teamId: map['teamId'] ?? '',
      ownerId: map['ownerId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      type: map['type']?.toInt() ?? 0,
      taskType: map['taskType'],
      membersId: List<String>.from(map['membersId']),
      taskMembers: map['taskMembers'] != null ? List<TaskMemberModel>.from(map['taskMembers']?.map((x) => TaskMemberModel.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskModel(id: $id, teamId: $teamId, ownerId: $ownerId, name: $name, description: $description, type: $type, taskType: $taskType, membersId: $membersId, taskMembers: $taskMembers)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel && other.id == id && other.teamId == teamId && other.ownerId == ownerId && other.name == name && other.description == description && other.type == type && other.taskType == taskType && listEquals(other.membersId, membersId) && listEquals(other.taskMembers, taskMembers);
  }

  @override
  int get hashCode {
    return id.hashCode ^ teamId.hashCode ^ ownerId.hashCode ^ name.hashCode ^ description.hashCode ^ type.hashCode ^ taskType.hashCode ^ membersId.hashCode ^ taskMembers.hashCode;
  }
}
