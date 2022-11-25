import 'package:learning_about_b4a_dart/core/models/author_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AuthorEntity {
  static const String className = 'Author';

  AuthorModel toModel(ParseObject parseObject) {
    AuthorModel model = AuthorModel(
      objectId: parseObject.objectId!,
      typeString: parseObject.get<String>('typeString'),
      typeBoolean: parseObject.get<bool>('typeBoolean'),
      typeNumber: parseObject.get<num>('typeNumber'),
      typeDate: parseObject.get<DateTime>('typeDate')?.toLocal(),
      typeArray: parseObject.get<List<dynamic>>('typeArray') != null
          ? parseObject
              .get<List<dynamic>>('typeArray')!
              .map((e) => e.toString())
              .toList()
          : null,
      typePointerGenre: parseObject.get('typePointerGenre') != null
          ? GenreEntity()
              .toModel(parseObject.get('typePointerGenre') as ParseObject)
          : null,
    );
    return model;
  }

  ParseObject toParse(AuthorModel model) {
    final parseObject = ParseObject(AuthorEntity.className);
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

    if (model.typeArray != null) {
      parseObject.set('typeArray', model.typeArray);
    }
    if (model.typePointerGenre != null) {
      parseObject.set(
          'typePointerGenre',
          (ParseObject(GenreEntity.className)
                ..objectId = model.typePointerGenre!.objectId)
              .toPointer());
    }
    return parseObject;
  }

  ParseObject toParseUnset(String objectId, List<String> unsetFields) {
    final parseObject = ParseObject(AuthorEntity.className);
    parseObject.objectId = objectId;

    for (var field in unsetFields) {
      parseObject.unset(field);
    }

    return parseObject;
  }
}
