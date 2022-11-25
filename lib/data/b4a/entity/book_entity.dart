import 'package:learning_about_b4a_dart/core/models/author_model.dart';
import 'package:learning_about_b4a_dart/core/models/book_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/author_entity.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/publisher_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ProfileEntity {
  static const String className = 'Profile';

  Future<BookModel> toModel(ParseObject parseObject,
      {List<String>? includeColumns}) async {
    List<AuthorModel> typeRelationList = [];
    if (includeColumns == null) {
      includeColumns = [];
      includeColumns.add('typeRelation');
    }

    //+++ get typeRelation
    if (includeColumns.contains('typeRelation')) {
      QueryBuilder<ParseObject> queryAuthor =
          QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));
      queryAuthor.whereRelatedTo(
          'typeRelation', 'Author', parseObject.objectId!);
      final ParseResponse responseAuthor = await queryAuthor.query();
      if (responseAuthor.success && responseAuthor.results != null) {
        for (var e in responseAuthor.results!) {
          typeRelationList.add(AuthorEntity().toModel(e as ParseObject));
        }
      }
    }
    //--- get typeRelation
    //+++ typeObject
    Map<String, String>? typeObject = <String, String>{};
    Map<String, dynamic>? typeObjectTemp =
        parseObject.get<Map<String, dynamic>>('typeObject');
    if (typeObjectTemp != null) {
      for (var item in typeObjectTemp.entries) {
        typeObject[item.key] = item.value;
      }
    }
    //--- typeObject
    BookModel model = BookModel(
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
      typePointer: parseObject.get('typePointer') != null
          ? PublisherEntity()
              .toModel(parseObject.get('typePointer') as ParseObject)
          : null,
      typeRelation: typeRelationList,
    );
    return model;
  }

  Future<ParseObject> toParse(BookModel model) async {
    final parseObject = ParseObject(ProfileEntity.className);
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
    if (model.typePointer != null) {
      parseObject.set(
          'typePointer',
          (ParseObject(PublisherEntity.className)
                ..objectId = model.typePointer!.objectId)
              .toPointer());
    }
    return parseObject;
  }

  ParseObject toParseUnset(String objectId, List<String> unsetFields) {
    final parseObject = ParseObject(ProfileEntity.className);
    parseObject.objectId = objectId;

    for (var field in unsetFields) {
      parseObject.unset(field);
    }

    return parseObject;
  }

  ParseObject? toParseUpdateRelationInTypeRelation({
    required String objectId,
    required List<String> modelIdList,
    required bool add,
  }) {
    final parseObject = ParseObject(ProfileEntity.className);
    parseObject.objectId = objectId;
    if (modelIdList.isEmpty) {
      parseObject.unset('typeRelation');
      return parseObject;
    }
    if (add) {
      parseObject.addRelation(
        'typeRelation',
        modelIdList
            .map(
              (element) =>
                  ParseObject(AuthorEntity.className)..objectId = element,
            )
            .toList(),
      );
    } else {
      parseObject.removeRelation(
          'typeRelation',
          modelIdList
              .map((element) =>
                  ParseObject(AuthorEntity.className)..objectId = element)
              .toList());
    }
    return parseObject;
  }
}
