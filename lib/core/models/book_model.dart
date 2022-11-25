import 'dart:convert';

import 'package:learning_about_b4a_dart/core/models/author_model.dart';
import 'package:learning_about_b4a_dart/core/models/publisher_model.dart';

class BookModel {
  final String? objectId;
  final String? typeString;
  final bool? typeBoolean;
  final num? typeNumber;
  final DateTime? typeDate;
  final Map<String, dynamic>? typeObject;
  final List<String>? typeArray;
  final String? typeFile;
  final PublisherModel? typePointer;
  final List<AuthorModel>? typeRelation;
  BookModel({
    this.objectId,
    this.typeString,
    this.typeBoolean,
    this.typeNumber,
    this.typeDate,
    this.typeObject,
    this.typeArray,
    this.typeFile,
    this.typePointer,
    this.typeRelation,
  });

  BookModel copyWith({
    String? objectId,
    String? typeString,
    bool? typeBoolean,
    num? typeNumber,
    DateTime? typeDate,
    Map<String, dynamic>? typeObject,
    List<String>? typeArray,
    String? typeFile,
    PublisherModel? typePointer,
    List<AuthorModel>? typeRelation,
  }) {
    return BookModel(
      objectId: objectId ?? this.objectId,
      typeString: typeString ?? this.typeString,
      typeBoolean: typeBoolean ?? this.typeBoolean,
      typeNumber: typeNumber ?? this.typeNumber,
      typeDate: typeDate ?? this.typeDate,
      typeObject: typeObject ?? this.typeObject,
      typeArray: typeArray ?? this.typeArray,
      typeFile: typeFile ?? this.typeFile,
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
    if (typeFile != null) {
      result.addAll({'typeFile': typeFile});
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

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      objectId: map['objectId'],
      typeString: map['typeString'],
      typeBoolean: map['typeBoolean'],
      typeNumber: map['typeNumber'],
      typeDate: map['typeDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['typeDate'])
          : null,
      typeObject: Map<String, dynamic>.from(map['typeObject']),
      typeArray: List<String>.from(map['typeArray']),
      typeFile: map['typeFile'],
      typePointer: map['typePointer'] != null
          ? PublisherModel.fromMap(map['typePointer'])
          : null,
      typeRelation: map['typeRelation'] != null
          ? List<AuthorModel>.from(
              map['typeRelation']?.map((x) => AuthorModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookModel(objectId: $objectId, typeString: $typeString, typeBoolean: $typeBoolean, typeNumber: $typeNumber, typeDate: $typeDate, typeObject: $typeObject, typeArray: $typeArray, typeFile: $typeFile, typePointer: $typePointer, typeRelation: $typeRelation)';
  }
}
