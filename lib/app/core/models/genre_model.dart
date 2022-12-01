import 'dart:convert';

class GenreModel {
  final String? objectId;
  final String? typeString;
  final bool? typeBoolean;
  final num? typeNumber;
  final DateTime? typeDateTime;
  final List<String>? typeArray;
  GenreModel({
    this.objectId,
    this.typeString,
    this.typeBoolean,
    this.typeNumber,
    this.typeDateTime,
    this.typeArray,
  });

  GenreModel copyWith({
    String? objectId,
    String? typeString,
    bool? typeBoolean,
    num? typeNumber,
    DateTime? typeDate,
    Map<String, dynamic>? typeObject,
    List<String>? typeArray,
  }) {
    return GenreModel(
      objectId: objectId ?? this.objectId,
      typeString: typeString ?? this.typeString,
      typeBoolean: typeBoolean ?? this.typeBoolean,
      typeNumber: typeNumber ?? this.typeNumber,
      typeDateTime: typeDate ?? this.typeDateTime,
      typeArray: typeArray ?? this.typeArray,
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

    return result;
  }

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      objectId: map['objectId'],
      typeString: map['typeString'],
      typeBoolean: map['typeBoolean'],
      typeNumber: map['typeNumber'],
      typeDateTime: map['typeDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['typeDate'])
          : null,
      typeArray: List<String>.from(map['typeArray']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreModel.fromJson(String source) =>
      GenreModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GenreModel(objectId: $objectId, typeString: $typeString, typeBoolean: $typeBoolean, typeNumber: $typeNumber, typeDate: $typeDateTime, typeArray: $typeArray)';
  }
}
