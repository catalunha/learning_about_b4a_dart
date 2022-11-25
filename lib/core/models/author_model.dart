import 'dart:convert';

import 'package:learning_about_b4a_dart/core/models/genre_model.dart';

class AuthorModel {
  final String? objectId;
  final String? typeString;
  final bool? typeBoolean;
  final num? typeNumber;
  final DateTime? typeDate;
  final List<String>? typeArray;
  final GenreModel? typePointerGenre;
  AuthorModel({
    this.objectId,
    this.typeString,
    this.typeBoolean,
    this.typeNumber,
    this.typeDate,
    this.typeArray,
    this.typePointerGenre,
  });

  AuthorModel copyWith({
    String? objectId,
    String? typeString,
    bool? typeBoolean,
    num? typeNumber,
    DateTime? typeDate,
    Map<String, dynamic>? typeObject,
    List<String>? typeArray,
    GenreModel? typePointer,
  }) {
    return AuthorModel(
      objectId: objectId ?? this.objectId,
      typeString: typeString ?? this.typeString,
      typeBoolean: typeBoolean ?? this.typeBoolean,
      typeNumber: typeNumber ?? this.typeNumber,
      typeDate: typeDate ?? this.typeDate,
      typeArray: typeArray ?? this.typeArray,
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

    if (typePointerGenre != null) {
      result.addAll({'typePointer': typePointerGenre!.toMap()});
    }

    return result;
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      objectId: map['objectId'],
      typeString: map['typeString'],
      typeBoolean: map['typeBoolean'],
      typeNumber: map['typeNumber'],
      typeDate: map['typeDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['typeDate'])
          : null,
      typeArray: List<String>.from(map['typeArray']),
      typePointerGenre: map['typePointer'] != null
          ? GenreModel.fromMap(map['typePointer'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorModel.fromJson(String source) =>
      AuthorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthorModel(objectId: $objectId, typeString: $typeString, typeBoolean: $typeBoolean, typeNumber: $typeNumber, typeDate: $typeDate, typeArray: $typeArray, typePointer: $typePointerGenre)';
  }
}
