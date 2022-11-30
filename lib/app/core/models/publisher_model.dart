import 'dart:convert';

import 'package:learning_about_b4a_dart/app/core/models/shape_model.dart';

class PublisherModel {
  final String? objectId;
  final String? typeString;
  final bool? typeBoolean;
  final num? typeNumber;
  final DateTime? typeDate;
  final List<String>? typeArray;
  final ShapeModel? typePointerShape;
  PublisherModel({
    this.objectId,
    this.typeString,
    this.typeBoolean,
    this.typeNumber,
    this.typeDate,
    this.typeArray,
    this.typePointerShape,
  });

  PublisherModel copyWith({
    String? objectId,
    String? typeString,
    bool? typeBoolean,
    num? typeNumber,
    DateTime? typeDate,
    List<String>? typeArray,
    ShapeModel? typePointerShape,
  }) {
    return PublisherModel(
      objectId: objectId ?? this.objectId,
      typeString: typeString ?? this.typeString,
      typeBoolean: typeBoolean ?? this.typeBoolean,
      typeNumber: typeNumber ?? this.typeNumber,
      typeDate: typeDate ?? this.typeDate,
      typeArray: typeArray ?? this.typeArray,
      typePointerShape: typePointerShape ?? this.typePointerShape,
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
    if (typeArray != null) {
      result.addAll({'typeArray': typeArray});
    }
    if (typePointerShape != null) {
      result.addAll({'typePointerShape': typePointerShape!.toMap()});
    }

    return result;
  }

  factory PublisherModel.fromMap(Map<String, dynamic> map) {
    return PublisherModel(
      objectId: map['objectId'],
      typeString: map['typeString'],
      typeBoolean: map['typeBoolean'],
      typeNumber: map['typeNumber'],
      typeDate: map['typeDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['typeDate'])
          : null,
      typeArray: List<String>.from(map['typeArray']),
      typePointerShape: map['typePointerShape'] != null
          ? ShapeModel.fromMap(map['typePointerShape'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublisherModel.fromJson(String source) =>
      PublisherModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PublisherModel(objectId: $objectId, typeString: $typeString, typeBoolean: $typeBoolean, typeNumber: $typeNumber, typeDate: $typeDate, typeArray: $typeArray, typePointerShape: $typePointerShape)';
  }
}
