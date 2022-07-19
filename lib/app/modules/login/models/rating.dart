import 'dart:convert';

class Rating {
  String userId;
  String providerId;
  double rate;
  String? comments;
  DateTime createdDate;
  DateTime updatedDate;
  Rating({
    required this.userId,
    required this.providerId,
    required this.rate,
    this.comments,
    required this.createdDate,
    required this.updatedDate,
  });

  Rating copyWith({
    String? userId,
    String? providerId,
    double? rate,
    String? comments,
    DateTime? createdDate,
    DateTime? updatedDate,
  }) {
    return Rating(
      userId: userId ?? this.userId,
      providerId: providerId ?? this.providerId,
      rate: rate ?? this.rate,
      comments: comments ?? this.comments,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'provider_id': providerId,
      'rate': rate,
      'comments': comments,
      'created_date': createdDate.millisecondsSinceEpoch,
      'updated_date': updatedDate.millisecondsSinceEpoch,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      userId: map['user_id'] ?? '',
      providerId: map['provider_id'] ?? '',
      rate: map['rate']?.toDouble() ?? 0.0,
      comments: map['comments'],
      createdDate: DateTime.fromMillisecondsSinceEpoch(map['created_date']),
      updatedDate: DateTime.fromMillisecondsSinceEpoch(map['updated_date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Rating(userId: $userId, providerId: $providerId, rate: $rate, comments: $comments, createdDate: $createdDate, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rating && other.userId == userId && other.providerId == providerId && other.rate == rate && other.comments == comments && other.createdDate == createdDate && other.updatedDate == updatedDate;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ providerId.hashCode ^ rate.hashCode ^ comments.hashCode ^ createdDate.hashCode ^ updatedDate.hashCode;
  }
}
