import 'package:learning_about_b4a_dart/core/models/genre_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GenreEntity {
  static const String className = 'Genre';

  GenreModel toModel(ParseObject parseObject) {
    //+++ typeObject
    Map<String, String>? typeObject;
    Map<String, dynamic>? typeObjectTemp =
        parseObject.get<Map<String, dynamic>>('typeObject');
    if (typeObjectTemp != null) {
      typeObject = <String, String>{};
      for (var item in typeObjectTemp.entries) {
        typeObject[item.key] = item.value;
      }
    }
    //--- typeObject
    GenreModel model = GenreModel(
      objectId: parseObject.objectId!,
      typeString: parseObject.get<String>('typeString'),
      typeBoolean: parseObject.get<bool>('typeBoolean'),
      typeNumber: parseObject.get<num>('typeNumber'),
      typeDate: parseObject.get<DateTime>('typeDate')?.toLocal(),
      typeObject: typeObject,
      typeArray: parseObject.get<List<dynamic>>('typeArray') != null
          ? parseObject
              .get<List<dynamic>>('typeArray')!
              .map((e) => e.toString())
              .toList()
          : null,
    );
    return model;
  }

  ParseObject toParse(GenreModel model) {
    final parseObject = ParseObject(GenreEntity.className);
    if (model.objectId != null) {
      parseObject.objectId = model.objectId;
    }

    if (model.typeString != null) {
      parseObject.set('typeString', model.typeString);
    }
    if (model.typeBoolean != null) {
      parseObject.set('typeBoolean', model.typeBoolean);
    }
    if (model.typeNumber != null) {
      parseObject.set('typeNumber', model.typeNumber);
    }
    if (model.typeDate != null) {
      parseObject.set('typeDate', model.typeDate);
    }
    if (model.typeObject != null) {
      var typeObjectData = <String, dynamic>{};
      for (var item in model.typeObject!.entries) {
        typeObjectData[item.key] = item.value;
      }
      parseObject.set('typeObject', typeObjectData);
    }
    if (model.typeArray != null) {
      parseObject.set('typeArray', model.typeArray);
    }

    return parseObject;
  }

  ParseObject toParseUnset(String objectId, List<String> unsetFields) {
    final parseObject = ParseObject(GenreEntity.className);
    parseObject.objectId = objectId;

    for (var field in unsetFields) {
      parseObject.unset(field);
    }

    return parseObject;
  }
}
