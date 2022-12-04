import 'package:learning_about_b4a_dart/app/core/models/genre_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GenreEntity {
  static const String className = 'Genre';
  static const String _typeString = 'typeString';
  static const String _typeBoolean = 'typeBoolean';
  static const String _typeNumber = 'typeNumber';
  static const String _typeDateTime = 'typeDateTime';
  static const String _typeArray = 'typeArray';

  GenreModel toModel(ParseObject parseObject) {
    GenreModel model = GenreModel(
      objectId: parseObject.objectId!,
      typeString: parseObject.get<String>(_typeString),
      typeBoolean: parseObject.get<bool>(_typeBoolean),
      typeNumber: parseObject.get<num>(_typeNumber),
      typeDateTime: parseObject.get<DateTime>(_typeDateTime)?.toLocal(),
      typeArray: parseObject.get<List<dynamic>>(_typeArray) != null
          ? parseObject
              .get<List<dynamic>>(_typeArray)!
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
      parseObject.set(_typeString, model.typeString);
    }
    if (model.typeBoolean != null) {
      parseObject.set(_typeBoolean, model.typeBoolean);
    }
    if (model.typeNumber != null) {
      parseObject.set(_typeNumber, model.typeNumber);
    }
    if (model.typeDateTime != null) {
      parseObject.set(
          _typeDateTime,
          DateTime(
            model.typeDateTime!.year,
            model.typeDateTime!.month,
            model.typeDateTime!.day,
            model.typeDateTime!.hour,
            model.typeDateTime!.minute,
          ));
    }

    if (model.typeArray != null) {
      parseObject.set(_typeArray, model.typeArray);
    }

    return parseObject;
  }

  Future<void> toParseUnset(String objectId, List<String> unsetFields) async {
    final parseObject = ParseObject(GenreEntity.className);
    parseObject.objectId = objectId;

    for (var field in unsetFields) {
      await parseObject.unset(field);
    }

    // return parseObject;
  }
}
