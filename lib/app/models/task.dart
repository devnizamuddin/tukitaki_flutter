import 'dart:convert';

class TaskModel {
  String id;
  String name;
  String description;
  int type;
  String? taskType;
  TaskModel({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    this.taskType,
  });

  TaskModel copyWith({
    String? id,
    String? name,
    String? description,
    int? type,
    String? taskType,
  }) {
    return TaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      taskType: taskType ?? this.taskType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'taskType': taskType,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      type: map['type']?.toInt() ?? 0,
      taskType: map['taskType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskModel(id: $id, name: $name, description: $description, type: $type, taskType: $taskType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel && other.id == id && other.name == name && other.description == description && other.type == type && other.taskType == taskType;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ type.hashCode ^ taskType.hashCode;
  }
}
