import 'dart:convert';

import 'package:learning_about_b4a_dart/core/models/genre_model.dart';

class PublisherModel {
  final String? objectId;
  final String? typeString;
  final bool? typeBoolean;
  final num? typeNumber;
  final DateTime? typeDate;
  final List<String>? typeArray;
  final String? typeFile;
  final GenreModel? typePointerGenre;
  PublisherModel({
    this.objectId,
    this.typeString,
    this.typeBoolean,
    this.typeNumber,
    this.typeDate,
    this.typeArray,
    this.typeFile,
    this.typePointerGenre,
  });

  PublisherModel copyWith({
    String? objectId,
    String? typeString,
    bool? typeBoolean,
    num? typeNumber,
    DateTime? typeDate,
    List<String>? typeArray,
    String? typeFile,
    GenreModel? typePointer,
  }) {
    return PublisherModel(
      objectId: objectId ?? this.objectId,
      typeString: typeString ?? this.typeString,
      typeBoolean: typeBoolean ?? this.typeBoolean,
      typeNumber: typeNumber ?? this.typeNumber,
      typeDate: typeDate ?? this.typeDate,
      typeArray: typeArray ?? this.typeArray,
      typeFile: typeFile ?? this.typeFile,
      typePointerGenre: typePointer ?? typePointerGenre,
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
    if (typeFile != null) {
      result.addAll({'typeFile': typeFile});
    }
    if (typePointerGenre != null) {
      result.addAll({'typePointer': typePointerGenre!.toMap()});
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
      typeFile: map['typeFile'],
      typePointerGenre: map['typePointer'] != null
          ? GenreModel.fromMap(map['typePointer'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublisherModel.fromJson(String source) =>
      PublisherModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PublisherModel(objectId: $objectId, typeString: $typeString, typeBoolean: $typeBoolean, typeNumber: $typeNumber, typeDate: $typeDate, typeArray: $typeArray, typeFile: $typeFile, typePointer: $typePointerGenre)';
  }
}
