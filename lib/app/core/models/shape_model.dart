import 'dart:convert';

class ShapeModel {
  final String? objectId;
  final String? typeString;
  final bool? typeBoolean;
  final num? typeNumber;
  final DateTime? typeDateTime;
  final List<String>? typeArray;
  final String? typeFile;
  final Map<String, dynamic>? typeObject;
  ShapeModel({
    this.objectId,
    this.typeString,
    this.typeBoolean,
    this.typeNumber,
    this.typeDateTime,
    this.typeArray,
    this.typeFile,
    this.typeObject,
  });

  ShapeModel copyWith({
    String? objectId,
    String? typeString,
    bool? typeBoolean,
    num? typeNumber,
    DateTime? typeDate,
    List<String>? typeArray,
    String? typeFile,
    Map<String, dynamic>? typeObject,
  }) {
    return ShapeModel(
      objectId: objectId ?? this.objectId,
      typeString: typeString ?? this.typeString,
      typeBoolean: typeBoolean ?? this.typeBoolean,
      typeNumber: typeNumber ?? this.typeNumber,
      typeDateTime: typeDate ?? this.typeDateTime,
      typeArray: typeArray ?? this.typeArray,
      typeFile: typeFile ?? this.typeFile,
      typeObject: typeObject ?? this.typeObject,
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
    if (typeDateTime != null) {
      result.addAll({'typeDate': typeDateTime!.millisecondsSinceEpoch});
    }
    if (typeArray != null) {
      result.addAll({'typeArray': typeArray});
    }
    if (typeFile != null) {
      result.addAll({'typeFile': typeFile});
    }
    if (typeObject != null) {
      result.addAll({'typeObject': typeObject});
    }

    return result;
  }

  factory ShapeModel.fromMap(Map<String, dynamic> map) {
    return ShapeModel(
      objectId: map['objectId'],
      typeString: map['typeString'],
      typeBoolean: map['typeBoolean'],
      typeNumber: map['typeNumber'],
      typeDateTime: map['typeDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['typeDate'])
          : null,
      typeArray: List<String>.from(map['typeArray']),
      typeFile: map['typeFile'],
      typeObject: Map<String, dynamic>.from(map['typeObject']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShapeModel.fromJson(String source) =>
      ShapeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShapeModel(objectId: $objectId, typeString: $typeString, typeBoolean: $typeBoolean, typeNumber: $typeNumber, typeDate: $typeDateTime, typeArray: $typeArray, typeFile: $typeFile, typeObject: $typeObject)';
  }
}
