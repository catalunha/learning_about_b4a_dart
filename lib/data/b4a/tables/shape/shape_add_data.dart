import 'dart:developer';
import 'dart:io';

import 'package:learning_about_b4a_dart/core/models/shape_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/shape_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ShapeAddData {
  static addSimpleData() async {
    removeAll();
    var authorModelList = <ShapeModel>[];
    authorModelList.addAll([
      ShapeModel(
        typeString: 'Shape01',
        typeBoolean: true,
        typeNumber: 1,
        typeDate: DateTime.now(),
        typeArray: ['a', '1'],
        typeObject: {"key1": "value1"},
      ),
      ShapeModel(
        typeString: 'Shape02',
        typeBoolean: false,
        typeNumber: 2,
        typeDate: DateTime(2022, 11, 26, 12).add(Duration(hours: 1)),
        typeArray: ['b', '2'],
        typeObject: {"key2": "value2"},
      ),
      ShapeModel(
        typeString: 'Shape03',
        typeBoolean: true,
        typeNumber: 3,
        typeDate: DateTime.now().add(Duration(hours: 2)),
        typeArray: ['c', '3'],
        typeObject: {"key3": "value3"},
      ),
      ShapeModel(
        typeString: 'Shape04',
        typeBoolean: false,
        typeNumber: 4,
        typeDate: DateTime.now().add(Duration(hours: 23)),
        typeArray: ['d', '4'],
        typeObject: {"key4": "value4"},
      ),
    ]);
    for (var authorModel in authorModelList) {
      ParseObject authorParseObject = ShapeEntity().toParse(authorModel);
      await authorParseObject.save();
    }
  }

  static addFile(String pathFile, String publisherId) async {
    // String dataFile = 'readmes/files/uml.jpg';
    // String objectId = '5iLu1JOO9x';
    ParseFileBase? parseFileBase = ParseFile(File(pathFile));
    final ParseResponse parseResponseFile = await parseFileBase.save();
    if (parseResponseFile.success && parseResponseFile.results != null) {
      final parseObject = ParseObject(ShapeEntity.className);
      parseObject.objectId = publisherId;
      parseObject.set('typeFile', parseFileBase);
      final ParseResponse responseParseObject = await parseObject.save();
      if (responseParseObject.success && responseParseObject.results != null) {
        log('File $pathFile save in ${ShapeEntity.className}.$publisherId');
      } else {
        log('Problem in save file');
      }
    }
  }

  static removeAll() async {
    final apiResponse = await ParseObject(ShapeEntity.className).getAll();

    if (apiResponse.success && apiResponse.results != null) {
      for (ParseObject element in apiResponse.results!) {
        await element.delete();
      }
    }
  }
}
