import 'package:learning_about_b4a_dart/core/models/other_data.dart';
import 'package:learning_about_b4a_dart/core/models/profile_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/other_data_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ProfileEntity {
  static const String className = 'Profile';

  Future<ProfileModel> toModel(ParseObject parseObject,
      {List<String>? includeColumns}) async {
    List<OtherDataModel> typeRelationList = [];
    if (includeColumns == null) {
      includeColumns = [];
      includeColumns.add('typeRelation');
    }

    //+++ get typeRelation
    if (includeColumns.contains('typeRelation')) {
      QueryBuilder<ParseObject> queryOtherData =
          QueryBuilder<ParseObject>(ParseObject(OtherDataEntity.className));
      queryOtherData.whereRelatedTo(
          'typeRelation', 'Profile', parseObject.objectId!);
      final ParseResponse responseOtherData = await queryOtherData.query();
      if (responseOtherData.success && responseOtherData.results != null) {
        for (var e in responseOtherData.results!) {
          typeRelationList.add(OtherDataEntity().fromParse(e as ParseObject));
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
    ProfileModel model = ProfileModel(
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
          ? OtherDataEntity()
              .fromParse(parseObject.get('typePointer') as ParseObject)
          : null,
      typeRelation: typeRelationList,
    );
    // log('$model', name: 'ProfileEntity.fromParse');
    return model;
  }

  Future<ParseObject> toParse(ProfileModel model) async {
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
          (ParseObject(OtherDataEntity.className)
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
                  ParseObject(OtherDataEntity.className)..objectId = element,
            )
            .toList(),
      );
    } else {
      parseObject.removeRelation(
          'typeRelation',
          modelIdList
              .map((element) =>
                  ParseObject(OtherDataEntity.className)..objectId = element)
              .toList());
    }
    return parseObject;
  }
}
