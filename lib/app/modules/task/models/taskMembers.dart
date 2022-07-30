import 'dart:convert';

class TaskMemberModel {
  String id;
  String name;
  String email;
  int taskSerial;
  bool isTaskdone;
  TaskMemberModel({
    required this.id,
    required this.name,
    required this.email,
    required this.taskSerial,
    required this.isTaskdone,
  });

  TaskMemberModel copyWith({
    String? id,
    String? name,
    String? email,
    int? taskSerial,
    bool? isTaskdone,
  }) {
    return TaskMemberModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      taskSerial: taskSerial ?? this.taskSerial,
      isTaskdone: isTaskdone ?? this.isTaskdone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'taskSerial': taskSerial,
      'isTaskdone': isTaskdone,
    };
  }

  factory TaskMemberModel.fromMap(Map<String, dynamic> map) {
    return TaskMemberModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      taskSerial: map['taskSerial']?.toInt() ?? 0,
      isTaskdone: map['isTaskdone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskMemberModel.fromJson(String source) => TaskMemberModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskMemberModel(id: $id, name: $name, email: $email, taskSerial: $taskSerial, isTaskdone: $isTaskdone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskMemberModel && other.id == id && other.name == name && other.email == email && other.taskSerial == taskSerial && other.isTaskdone == isTaskdone;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ taskSerial.hashCode ^ isTaskdone.hashCode;
  }
}
