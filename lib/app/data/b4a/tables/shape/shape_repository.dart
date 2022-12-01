import 'dart:developer';
import 'dart:io';

import 'package:learning_about_b4a_dart/app/core/models/shape_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/shape_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ShapeRepository {
  addAll() async {
    removeAll();
    var shapeModelList = <ShapeModel>[];
    shapeModelList.addAll([
      ShapeModel(
        typeString: 'Shape01',
        typeBoolean: true,
        typeNumber: 1,
        typeDateTime: DateTime.now(),
        typeArray: ['a', '1'],
        typeObject: {"key1": "value1"},
      ),
      ShapeModel(
        typeString: 'Shape02',
        typeBoolean: false,
        typeNumber: 2,
        typeDateTime: DateTime(2022, 11, 26, 12).add(Duration(hours: 1)),
        typeArray: ['b', '2'],
        typeObject: {"key2": "value2"},
      ),
      ShapeModel(
        typeString: 'Shape03',
        typeBoolean: true,
        typeNumber: 3,
        typeDateTime: DateTime.now().add(Duration(hours: 2)),
        typeArray: ['c', '3'],
        typeObject: {"key3": "value3"},
      ),
    ]);
    for (var shapeModel in shapeModelList) {
      ParseObject shapeParseObject = ShapeEntity().toParse(shapeModel);
      await shapeParseObject.save();
    }
  }

  add() async {
    var shapeModel = ShapeModel(
      typeString: 'Shape04',
      typeBoolean: false,
      typeNumber: 4,
      typeDateTime: DateTime.now().add(Duration(hours: 23)),
      typeArray: ['d', '4'],
      typeObject: {"key4": "value4"},
    );
    ParseObject shapeParseObject = ShapeEntity().toParse(shapeModel);
    await shapeParseObject.save();
  }

  update() async {
    var genreModel = ShapeModel(
      objectId: '',
      typeString: 'Shape04',
      typeBoolean: false,
      typeNumber: 4,
      typeDateTime: DateTime.now().add(Duration(hours: 23)),
      typeArray: ['d', '4'],
      typeObject: {"key4": "value4"},
    );
    ParseObject shapeParseObject = ShapeEntity().toParse(genreModel);
    await shapeParseObject.save();
  }

  addFile(String pathFile, String publisherId) async {
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

  unset(String objectId, String columnName) async {
    final parseObject = ParseObject(ShapeEntity.className);
    parseObject.objectId = objectId;
    await parseObject.unset(columnName);
    // É sempre parseResponse.success=true
    // mesmo que coluna ja esteja undefined, ou
    // nome da coluna esteja errado.
    // print('parseResponse.count: ${parseResponse.count}');
    // print('parseResponse.error: ${parseResponse.error}');
    // print('parseResponse.results: ${parseResponse.results}');
    // print('parseResponse.statusCode: ${parseResponse.statusCode}');
    // print('parseResponse.success: ${parseResponse.success}');
  }

  delete(String objectId) async {
    final parseObject = ParseObject(ShapeEntity.className);
    parseObject.objectId = objectId;
    await parseObject.delete();
  }

  removeAll() async {
    final apiResponse = await ParseObject(ShapeEntity.className).getAll();

    if (apiResponse.success && apiResponse.results != null) {
      for (ParseObject element in apiResponse.results!) {
        await element.delete();
      }
    }
  }
}
