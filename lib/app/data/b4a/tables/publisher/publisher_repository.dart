import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/publisher_model.dart';
import 'package:learning_about_b4a_dart/app/core/models/shape_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/publisher_entity.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/shape_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class PublisherRepository {
  addAll() async {
    removeAll();
    var authorModelList = <PublisherModel>[];
    authorModelList.addAll([
      PublisherModel(
        typeString: 'Publisher01',
        typeBoolean: true,
        typeNumber: 1,
        typeDate: DateTime.now(),
        typeArray: ['a', '1'],
        typePointerShape: ShapeModel(objectId: 'kyCtliyFaK'),
      ),
      PublisherModel(
        typeString: 'Publisher02',
        typeBoolean: false,
        typeNumber: 2,
        typeDate: DateTime(2022, 11, 26, 12).add(Duration(hours: 1)),
        typeArray: ['b', '2'],
        // typePointerShape: ShapeModel(objectId: 'mrsMiyXeuP'),
      ),
      PublisherModel(
        typeString: 'Publisher03',
        typeBoolean: true,
        typeNumber: 3,
        typeDate: DateTime.now().add(Duration(hours: 2)),
        typeArray: ['c', '3'],
        // typePointerShape: ShapeModel(objectId: 'w7n72uFBv2'),
      ),
    ]);
    for (var authorModel in authorModelList) {
      ParseObject authorParseObject = PublisherEntity().toParse(authorModel);
      await authorParseObject.save();
    }
  }

  addPointer() async {
    // log('addPointer 01');
    // final parseObjectPublisher01 = ParseObject(PublisherEntity.className);
    // parseObjectPublisher01.objectId = '5iLu1JOO9x';
    // final parseObjectShape01 = ParseObject(ShapeEntity.className);
    // parseObjectShape01.objectId = 'kyCtliyFaK';
    // parseObjectPublisher01.set('typePointerShape', parseObjectShape01);
    // await parseObjectPublisher01.save();

    log('addPointer 02');
    final parseObjectPublisher02 = ParseObject(PublisherEntity.className);
    parseObjectPublisher02.objectId = 't6ziHJPZdb';
    parseObjectPublisher02.set(
        'typePointerShape',
        (ParseObject(ShapeEntity.className)..objectId = 'mrsMiyXeuP')
            .toPointer());
    await parseObjectPublisher02.save();

    log('addPointer 03');
    final parseObjectPublisher03 = ParseObject(PublisherEntity.className);
    parseObjectPublisher03.objectId = 'aPqY5rvjzd';
    final parseObjectShape03 = ParseObject(ShapeEntity.className);
    parseObjectShape03.objectId = 'w7n72uFBv2';
    parseObjectPublisher03.set('typePointerShape', parseObjectShape03);
    await parseObjectPublisher03.save();

    log('addPointer 04');
    final parseObjectPublisher04 = ParseObject(PublisherEntity.className);
    parseObjectPublisher04.objectId = 'kZWvjCE3xz';
    parseObjectPublisher04.set(
        'typePointerShape',
        (ParseObject(ShapeEntity.className)..objectId = 'bxirK4sWKU')
            .toPointer());
    await parseObjectPublisher04.save();
  }

  add() async {
    var publisherModel = PublisherModel(
      typeString: 'Publisher04',
      typeBoolean: false,
      typeNumber: 4,
      typeDate: DateTime.now().add(Duration(hours: 23)),
      typeArray: ['d', '4'],
      // typePointerShape: ShapeModel(objectId: 'bxirK4sWKU'),
    );
    ParseObject publisherParseObject =
        PublisherEntity().toParse(publisherModel);
    await publisherParseObject.save();
  }

  update() async {
    var publisherModel = PublisherModel(
      objectId: '',
      typeString: 'Publisher04',
      typeBoolean: false,
      typeNumber: 4,
      typeDate: DateTime.now().add(Duration(hours: 23)),
      typeArray: ['d', '4'],
      // typePointerShape: ShapeModel(objectId: 'bxirK4sWKU'),
    );
    ParseObject publisherParseObject =
        PublisherEntity().toParse(publisherModel);
    await publisherParseObject.save();
  }

  unset(String objectId, String columnName) async {
    final parseObject = ParseObject(PublisherEntity.className);
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
    final parseObject = ParseObject(PublisherEntity.className);
    parseObject.objectId = objectId;
    await parseObject.delete();
  }

  removeAll() async {
    final apiResponse = await ParseObject(PublisherEntity.className).getAll();

    if (apiResponse.success && apiResponse.results != null) {
      for (ParseObject element in apiResponse.results!) {
        await element.delete();
      }
    }
  }
}
