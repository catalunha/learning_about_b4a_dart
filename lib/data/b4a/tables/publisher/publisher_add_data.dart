import 'dart:developer';

import 'package:learning_about_b4a_dart/core/models/publisher_model.dart';
import 'package:learning_about_b4a_dart/core/models/shape_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/genre_entity.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/publisher_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class PublisherAddData {
  static addSimpleData() async {
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
        // typePointerGenre: GenreModel(objectId: 'mrsMiyXeuP'),
      ),
      PublisherModel(
        typeString: 'Publisher03',
        typeBoolean: true,
        typeNumber: 3,
        typeDate: DateTime.now().add(Duration(hours: 2)),
        typeArray: ['c', '3'],
        // typePointerGenre: GenreModel(objectId: 'w7n72uFBv2'),
      ),
      PublisherModel(
        typeString: 'Publisher04',
        typeBoolean: false,
        typeNumber: 4,
        typeDate: DateTime.now().add(Duration(hours: 23)),
        typeArray: ['d', '4'],
        // typePointerGenre: GenreModel(objectId: 'bxirK4sWKU'),
      ),
    ]);
    for (var authorModel in authorModelList) {
      ParseObject authorParseObject = PublisherEntity().toParse(authorModel);
      await authorParseObject.save();
    }
  }

  static addPointer() async {
    // log('addPointer 01');
    // final parseObjectPublisher01 = ParseObject(PublisherEntity.className);
    // parseObjectPublisher01.objectId = '5iLu1JOO9x';
    // final parseObjectGenre01 = ParseObject(GenreEntity.className);
    // parseObjectGenre01.objectId = 'kyCtliyFaK';
    // parseObjectPublisher01.set('typePointerGenre', parseObjectGenre01);
    // await parseObjectPublisher01.save();

    log('addPointer 02');
    final parseObjectPublisher02 = ParseObject(PublisherEntity.className);
    parseObjectPublisher02.objectId = 't6ziHJPZdb';
    parseObjectPublisher02.set(
        'typePointerGenre',
        (ParseObject(GenreEntity.className)..objectId = 'mrsMiyXeuP')
            .toPointer());
    await parseObjectPublisher02.save();

    log('addPointer 03');
    final parseObjectPublisher03 = ParseObject(PublisherEntity.className);
    parseObjectPublisher03.objectId = 'aPqY5rvjzd';
    final parseObjectGenre03 = ParseObject(GenreEntity.className);
    parseObjectGenre03.objectId = 'w7n72uFBv2';
    parseObjectPublisher03.set('typePointerGenre', parseObjectGenre03);
    await parseObjectPublisher03.save();

    log('addPointer 04');
    final parseObjectPublisher04 = ParseObject(PublisherEntity.className);
    parseObjectPublisher04.objectId = 'kZWvjCE3xz';
    parseObjectPublisher04.set(
        'typePointerGenre',
        (ParseObject(GenreEntity.className)..objectId = 'bxirK4sWKU')
            .toPointer());
    await parseObjectPublisher04.save();
  }

  static removeAll() async {
    final apiResponse = await ParseObject(PublisherEntity.className).getAll();

    if (apiResponse.success && apiResponse.results != null) {
      for (ParseObject element in apiResponse.results!) {
        await element.delete();
      }
    }
  }
}
