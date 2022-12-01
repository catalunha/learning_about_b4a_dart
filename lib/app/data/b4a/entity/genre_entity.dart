import 'package:learning_about_b4a_dart/app/core/models/genre_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GenreEntity {
  static const String className = 'Genre';

  GenreModel toModel(ParseObject parseObject) {
    GenreModel model = GenreModel(
      objectId: parseObject.objectId!,
      typeString: parseObject.get<String>('typeString'),
      typeBoolean: parseObject.get<bool>('typeBoolean'),
      typeNumber: parseObject.get<num>('typeNumber'),
      typeDateTime: parseObject.get<DateTime>('typeDateTime')?.toLocal(),
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
    if (model.typeDateTime != null) {
      parseObject.set('typeDateTime', model.typeDateTime);
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
