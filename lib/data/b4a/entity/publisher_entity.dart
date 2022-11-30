import 'package:learning_about_b4a_dart/core/models/publisher_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/shape_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class PublisherEntity {
  static const String className = 'Publisher';

  PublisherModel toModel(ParseObject parseObject) {
    PublisherModel model = PublisherModel(
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
      typePointerShape: parseObject.get('typePointerShape') != null
          ? ShapeEntity()
              .toModel(parseObject.get('typePointerShape') as ParseObject)
          : null,
    );
    return model;
  }

  ParseObject toParse(PublisherModel model) {
    final parseObject = ParseObject(PublisherEntity.className);
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
    if (model.typePointerShape != null) {
      parseObject.set(
          'typePointerShape',
          (ParseObject(ShapeEntity.className)
                ..objectId = model.typePointerShape!.objectId)
              .toPointer());
    }
    return parseObject;
  }

  ParseObject toParseUnset(String objectId, List<String> unsetFields) {
    final parseObject = ParseObject(PublisherEntity.className);
    parseObject.objectId = objectId;

    for (var field in unsetFields) {
      parseObject.unset(field);
    }

    return parseObject;
  }
}
