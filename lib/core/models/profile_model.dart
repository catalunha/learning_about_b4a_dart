import 'dart:convert';

import 'package:learning_about_b4a_dart/core/models/other_data.dart';

class ProfileModel {
  final String? objectId;
  final String? typeString;
  final bool? typeBoolean;
  final num? typeNumber;
  final DateTime? typeDate;
  final Map<String, dynamic>? typeObject;
  final List<String>? typeArray;
  final OtherDataModel? typePointer;
  final List<OtherDataModel>? typeRelation;
  ProfileModel({
    this.objectId,
    this.typeString,
    this.typeBoolean,
    this.typeNumber,
    this.typeDate,
    this.typeObject,
    this.typeArray,
    this.typePointer,
    this.typeRelation,
  });

  ProfileModel copyWith({
    String? objectId,
    String? typeString,
    bool? typeBoolean,
    num? typeNumber,
    DateTime? typeDate,
    Map<String, dynamic>? typeObject,
    List<String>? typeArray,
    OtherDataModel? typePointer,
    List<OtherDataModel>? typeRelation,
  }) {
    return ProfileModel(
      objectId: objectId ?? this.objectId,
      typeString: typeString ?? this.typeString,
      typeBoolean: typeBoolean ?? this.typeBoolean,
      typeNumber: typeNumber ?? this.typeNumber,
      typeDate: typeDate ?? this.typeDate,
      typeObject: typeObject ?? this.typeObject,
      typeArray: typeArray ?? this.typeArray,
      typePointer: typePointer ?? this.typePointer,
      typeRelation: typeRelation ?? this.typeRelation,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (objectId != null) {
      result.addAll({'objectId': objectId});
    }
    if (typeString != null) {
      result.addAll({'typeString': typeString});
    }
    if (typeBoolean != null) {
      result.addAll({'typeBoolean': typeBoolean});
    }
    if (typeNumber != null) {
      result.addAll({'typeNumber': typeNumber});
    }
    if (typeDate != null) {
      result.addAll({'typeDate': typeDate!.millisecondsSinceEpoch});
    }
    if (typeObject != null) {
      result.addAll({'typeObject': typeObject});
    }
    if (typeArray != null) {
      result.addAll({'typeArray': typeArray});
    }
    if (typePointer != null) {
      result.addAll({'typePointer': typePointer!.toMap()});
    }
    if (typeRelation != null) {
      result.addAll(
          {'typeRelation': typeRelation!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      objectId: map['objectId'],
      typeString: map['typeString'],
      typeBoolean: map['typeBoolean'],
      typeNumber: map['typeNumber'],
      typeDate: map['typeDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['typeDate'])
          : null,
      typeObject: Map<String, dynamic>.from(map['typeObject']),
      typeArray: List<String>.from(map['typeArray']),
      typePointer: map['typePointer'] != null
          ? OtherDataModel.fromMap(map['typePointer'])
          : null,
      typeRelation: map['typeRelation'] != null
          ? List<OtherDataModel>.from(
              map['typeRelation']?.map((x) => OtherDataModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileModel(objectId: $objectId, typeString: $typeString, typeBoolean: $typeBoolean, typeNumber: $typeNumber, typeDate: $typeDate, typeObject: $typeObject, typeArray: $typeArray, typePointer: $typePointer, typeRelation: $typeRelation)';
  }
}
