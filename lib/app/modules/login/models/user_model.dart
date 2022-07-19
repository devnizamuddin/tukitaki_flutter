import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  String id;
  String? name;
  String email;
  String? image;
  String? phone;
  String? fcmId;
  String type;
  bool status;
  ProviderInfo? providerInfo;
  UserInformation? userInfo;
  UserModel({
    required this.id,
    this.name,
    required this.email,
    this.image,
    this.phone,
    this.fcmId,
    required this.type,
    required this.status,
    this.providerInfo,
    this.userInfo,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? image,
    String? phone,
    String? fcmId,
    String? type,
    bool? status,
    ProviderInfo? providerInfo,
    UserInformation? userInfo,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      fcmId: fcmId ?? this.fcmId,
      type: type ?? this.type,
      status: status ?? this.status,
      providerInfo: providerInfo ?? this.providerInfo,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'phone': phone,
      'fcm_id': fcmId,
      'type': type,
      'status': status,
      'provider_info': providerInfo?.toMap(),
      'user_info': userInfo?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'],
      email: map['email'] ?? '',
      image: map['image'],
      phone: map['phone'],
      fcmId: map['fcm_id'],
      type: map['type'] ?? '',
      status: map['status'] ?? false,
      providerInfo: map['provider_info'] != null ? ProviderInfo.fromMap(map['provider_info']) : null,
      userInfo: map['user_info'] != null ? UserInformation.fromMap(map['user_info']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, image: $image, phone: $phone, fcmId: $fcmId, type: $type, status: $status, providerInfo: $providerInfo, userInfo: $userInfo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.id == id && other.name == name && other.email == email && other.image == image && other.phone == phone && other.fcmId == fcmId && other.type == type && other.status == status && other.providerInfo == providerInfo && other.userInfo == userInfo;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ image.hashCode ^ phone.hashCode ^ fcmId.hashCode ^ type.hashCode ^ status.hashCode ^ providerInfo.hashCode ^ userInfo.hashCode;
  }
}

class ProviderInfo {
  bool isVarified;
  bool onlineStatus;
  double? radius;
  CurrentLocation? latLng;
  List<JobSummery>? jobsDone;
  List<String>? skills;
  double? wallet;
  PaymentInformation? paymentInformation;
  ProviderInfo({
    required this.isVarified,
    required this.onlineStatus,
    this.radius,
    this.latLng,
    this.jobsDone,
    this.skills,
    this.wallet,
  });

  ProviderInfo copyWith({
    bool? isVarified,
    bool? onlineStatus,
    double? radius,
    CurrentLocation? latLng,
    List<JobSummery>? jobsDone,
    List<String>? skills,
    double? wallet,
  }) {
    return ProviderInfo(
      isVarified: isVarified ?? this.isVarified,
      onlineStatus: onlineStatus ?? this.onlineStatus,
      radius: radius ?? this.radius,
      latLng: latLng ?? this.latLng,
      jobsDone: jobsDone ?? this.jobsDone,
      skills: skills ?? this.skills,
      wallet: wallet ?? this.wallet,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'is_varified': isVarified,
      'online_status': onlineStatus,
      'radius': radius,
      'lat_lng': latLng?.toMap(),
      'jobs_done': jobsDone?.map((x) => x.toMap()).toList(),
      'skills': skills,
      'wallet': wallet,
    };
  }

  factory ProviderInfo.fromMap(Map<String, dynamic> map) {
    return ProviderInfo(
      isVarified: map['is_varified'] ?? false,
      onlineStatus: map['online_status'] ?? false,
      radius: map['radius']?.toDouble(),
      latLng: map['lat_lng'] != null ? CurrentLocation.fromMap(map['lat_lng']) : null,
      jobsDone: map['jobs_done'] != null ? List<JobSummery>.from(map['jobs_done']?.map((x) => JobSummery.fromMap(x))) : null,
      skills: List<String>.from(map['skills']),
      wallet: map['wallet']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProviderInfo.fromJson(String source) => ProviderInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProviderInfo(isVarified: $isVarified, onlineStatus: $onlineStatus, radius: $radius, latLng: $latLng, jobsDone: $jobsDone, skills: $skills, wallet: $wallet)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ProviderInfo && other.isVarified == isVarified && other.onlineStatus == onlineStatus && other.radius == radius && other.latLng == latLng && listEquals(other.jobsDone, jobsDone) && listEquals(other.skills, skills) && other.wallet == wallet;
  }

  @override
  int get hashCode {
    return isVarified.hashCode ^ onlineStatus.hashCode ^ radius.hashCode ^ latLng.hashCode ^ jobsDone.hashCode ^ skills.hashCode ^ wallet.hashCode;
  }
}

class PaymentInformation {
  String? bankName;
  String? branchName;
  String? accountNumber;
  String? paymentType;
  PaymentInformation({
    this.bankName,
    this.branchName,
    this.accountNumber,
    this.paymentType,
  });

  PaymentInformation copyWith({
    String? bankName,
    String? branchName,
    String? accountNumber,
    String? paymentType,
  }) {
    return PaymentInformation(
      bankName: bankName ?? this.bankName,
      branchName: branchName ?? this.branchName,
      accountNumber: accountNumber ?? this.accountNumber,
      paymentType: paymentType ?? this.paymentType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bank_name': bankName,
      'branch_name': branchName,
      'account_number': accountNumber,
      'payment_type': paymentType,
    };
  }

  factory PaymentInformation.fromMap(Map<String, dynamic> map) {
    return PaymentInformation(
      bankName: map['bank_name'],
      branchName: map['branch_name'],
      accountNumber: map['account_number'],
      paymentType: map['payment_type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentInformation.fromJson(String source) => PaymentInformation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaymentInformation(bankName: $bankName, branchName: $branchName, accountNumber: $accountNumber, paymentType: $paymentType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentInformation && other.bankName == bankName && other.branchName == branchName && other.accountNumber == accountNumber && other.paymentType == paymentType;
  }

  @override
  int get hashCode {
    return bankName.hashCode ^ branchName.hashCode ^ accountNumber.hashCode ^ paymentType.hashCode;
  }
}

class UserInformation {
  CurrentLocation? latLng;
  List<JobSummery>? jobsDone;
  UserInformation({
    this.latLng,
    this.jobsDone,
  });

  UserInformation copyWith({
    CurrentLocation? latLng,
    List<JobSummery>? jobsDone,
  }) {
    return UserInformation(
      latLng: latLng ?? this.latLng,
      jobsDone: jobsDone ?? this.jobsDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat_lng': latLng?.toMap(),
      'jobs_done': jobsDone?.map((x) => x.toMap()).toList(),
    };
  }

  factory UserInformation.fromMap(Map<String, dynamic> map) {
    return UserInformation(
      latLng: map['lat_lng'] != null ? CurrentLocation.fromMap(map['lat_lng']) : null,
      jobsDone: map['jobs_done'] != null ? List<JobSummery>.from(map['jobs_done']?.map((x) => JobSummery.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInformation.fromJson(String source) => UserInformation.fromMap(json.decode(source));

  @override
  String toString() => 'UserInformation(latLng: $latLng, jobsDone: $jobsDone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInformation && other.latLng == latLng && listEquals(other.jobsDone, jobsDone);
  }

  @override
  int get hashCode => latLng.hashCode ^ jobsDone.hashCode;
}

class CurrentLocation {
  double lat;
  double long;
  CurrentLocation({
    required this.lat,
    required this.long,
  });

  CurrentLocation copyWith({
    double? lat,
    double? long,
  }) {
    return CurrentLocation(
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'long': long,
    };
  }

  factory CurrentLocation.fromMap(Map<String, dynamic> map) {
    return CurrentLocation(
      lat: map['lat']?.toDouble() ?? 0.0,
      long: map['long']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentLocation.fromJson(String source) => CurrentLocation.fromMap(json.decode(source));

  @override
  String toString() => 'CurrentLocation(lat: $lat, long: $long)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrentLocation && other.lat == lat && other.long == long;
  }

  @override
  int get hashCode => lat.hashCode ^ long.hashCode;
}

class JobSummery {
  String jobId;
  String serviceId;
  String userId;
  double? userRating;
  double? providerRating;
  String? userComment;
  String? providerComment;
  String? paymentMethod;
  DateTime? completedTime;
  double? paymentAmount;
  JobSummery({
    required this.jobId,
    required this.serviceId,
    required this.userId,
    this.userRating,
    this.providerRating,
    this.userComment,
    this.providerComment,
    this.paymentMethod,
    this.completedTime,
    this.paymentAmount,
  });

  JobSummery copyWith({
    String? jobId,
    String? serviceId,
    String? userId,
    double? userRating,
    double? providerRating,
    String? userComment,
    String? providerComment,
    String? paymentMethod,
    DateTime? completedTime,
    double? paymentAmount,
  }) {
    return JobSummery(
      jobId: jobId ?? this.jobId,
      serviceId: serviceId ?? this.serviceId,
      userId: userId ?? this.userId,
      userRating: userRating ?? this.userRating,
      providerRating: providerRating ?? this.providerRating,
      userComment: userComment ?? this.userComment,
      providerComment: providerComment ?? this.providerComment,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      completedTime: completedTime ?? this.completedTime,
      paymentAmount: paymentAmount ?? this.paymentAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'job_id': jobId,
      'service_id': serviceId,
      'user_id': userId,
      'user_rating': userRating,
      'provider_rating': providerRating,
      'user_comment': userComment,
      'provider_comment': providerComment,
      'payment_method': paymentMethod,
      'completed_time': completedTime?.millisecondsSinceEpoch,
      'payment_amount': paymentAmount,
    };
  }

  factory JobSummery.fromMap(Map<String, dynamic> map) {
    return JobSummery(
      jobId: map['job_id'] ?? '',
      serviceId: map['service_id'] ?? '',
      userId: map['user_id'] ?? '',
      userRating: map['user_rating']?.toDouble(),
      providerRating: map['provider_rating']?.toDouble(),
      userComment: map['user_comment'],
      providerComment: map['provider_comment'],
      paymentMethod: map['payment_method'],
      completedTime: map['completed_time'] != null ? DateTime.fromMillisecondsSinceEpoch(map['completed_time']) : null,
      paymentAmount: map['payment_amount']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory JobSummery.fromJson(String source) => JobSummery.fromMap(json.decode(source));

  @override
  String toString() {
    return 'JobSummery(jobId: $jobId, serviceId: $serviceId, userId: $userId, userRating: $userRating, providerRating: $providerRating, userComment: $userComment, providerComment: $providerComment, paymentMethod: $paymentMethod, completedTime: $completedTime, paymentAmount: $paymentAmount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JobSummery && other.jobId == jobId && other.serviceId == serviceId && other.userId == userId && other.userRating == userRating && other.providerRating == providerRating && other.userComment == userComment && other.providerComment == providerComment && other.paymentMethod == paymentMethod && other.completedTime == completedTime && other.paymentAmount == paymentAmount;
  }

  @override
  int get hashCode {
    return jobId.hashCode ^ serviceId.hashCode ^ userId.hashCode ^ userRating.hashCode ^ providerRating.hashCode ^ userComment.hashCode ^ providerComment.hashCode ^ paymentMethod.hashCode ^ completedTime.hashCode ^ paymentAmount.hashCode;
  }
}
