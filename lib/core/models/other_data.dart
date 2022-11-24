import 'dart:convert';

class OtherDataModel {
  final String? objectId;
  final String? typeString;
  OtherDataModel({
    this.objectId,
    this.typeString,
  });

  OtherDataModel copyWith({
    String? objectId,
    String? typeString,
  }) {
    return OtherDataModel(
      objectId: objectId ?? this.objectId,
      typeString: typeString ?? this.typeString,
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

    return result;
  }

  factory OtherDataModel.fromMap(Map<String, dynamic> map) {
    return OtherDataModel(
      objectId: map['objectId'],
      typeString: map['typeString'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherDataModel.fromJson(String source) =>
      OtherDataModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'OtherDataModel(objectId: $objectId, typeString: $typeString)';
}
