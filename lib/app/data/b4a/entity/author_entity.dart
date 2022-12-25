import 'package:learning_about_b4a_dart/app/core/models/author_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AuthorEntity {
  static const String className = 'Author';

  AuthorModel toModel(ParseObject parseObject) {
    // log('parseObject.toJson ${parseObject.toJson()}',
    //     name: 'AuthorModel toModel');
    AuthorModel model = AuthorModel(
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
      typePointerGenre: parseObject.get('typePointerGenre') != null
          ? GenreEntity()
              .toModel(parseObject.get<ParseObject>('typePointerGenre')!)
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
    if (model.typeDateTime != null) {
      parseObject.set(
          'typeDateTime',
          DateTime(
            model.typeDateTime!.year,
            model.typeDateTime!.month,
            model.typeDateTime!.day,
            model.typeDateTime!.hour,
            model.typeDateTime!.minute,
          ));
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
    // log('parseObject.toJson ${parseObject.toJson()}',
    //     name: 'AuthorModel toParse');
    return parseObject;
  }

  Future<void> toParseUnset(String objectId, List<String> unsetFields) async {
    final parseObject = ParseObject(AuthorEntity.className);
    parseObject.objectId = objectId;

    for (var field in unsetFields) {
      parseObject.unset(field);
    }
  }
}
