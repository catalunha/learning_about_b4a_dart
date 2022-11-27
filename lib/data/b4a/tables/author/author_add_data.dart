import 'dart:developer';

import 'package:learning_about_b4a_dart/core/models/author_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/author_entity.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AuthorAddData {
  static addSimpleData() async {
    removeAll();
    var authorModelList = <AuthorModel>[];
    authorModelList.addAll([
      AuthorModel(
        typeString: 'Author01',
        typeBoolean: true,
        typeNumber: 1,
        typeDate: DateTime.now(),
        typeArray: ['a', '1'],
        // typePointerGenre: GenreModel(objectId: 'kyCtliyFaK'),
      ),
      AuthorModel(
        typeString: 'Author02',
        typeBoolean: false,
        typeNumber: 2,
        typeDate: DateTime(2022, 11, 26, 12).add(Duration(hours: 1)),
        typeArray: ['b', '2'],
        // typePointerGenre: GenreModel(objectId: 'mrsMiyXeuP'),
      ),
      AuthorModel(
        typeString: 'Author03',
        typeBoolean: true,
        typeNumber: 3,
        typeDate: DateTime.now().add(Duration(hours: 2)),
        typeArray: ['c', '3'],
        // typePointerGenre: GenreModel(objectId: 'w7n72uFBv2'),
      ),
      AuthorModel(
        typeString: 'Author04',
        typeBoolean: false,
        typeNumber: 4,
        typeDate: DateTime.now().add(Duration(hours: 23)),
        typeArray: ['d', '4'],
        // typePointerGenre: GenreModel(objectId: 'bxirK4sWKU'),
      ),
    ]);
    for (var authorModel in authorModelList) {
      log('addSimpleData ${authorModel.typeString}');
      ParseObject authorParseObject = AuthorEntity().toParse(authorModel);
      await authorParseObject.save();
    }
  }

  static addPointer() async {
    log('addPointer 01');
    final parseObjectAuthor01 = ParseObject(AuthorEntity.className);
    parseObjectAuthor01.objectId = 'fK4I00NlBy';
    final parseObjectGenre01 = ParseObject(GenreEntity.className);
    parseObjectGenre01.objectId = 'kyCtliyFaK';
    parseObjectAuthor01.set('typePointerGenre', parseObjectGenre01);
    await parseObjectAuthor01.save();

    log('addPointer 02');
    final parseObjectAuthor02 = ParseObject(AuthorEntity.className);
    parseObjectAuthor02.objectId = 'ETwKYOAMh2';
    parseObjectAuthor02.set(
        'typePointerGenre',
        (ParseObject(GenreEntity.className)..objectId = 'mrsMiyXeuP')
            .toPointer());
    await parseObjectAuthor02.save();

    log('addPointer 03');
    final parseObjectAuthor03 = ParseObject(AuthorEntity.className);
    parseObjectAuthor03.objectId = 'qCI5fge7WT';
    final parseObjectGenre03 = ParseObject(GenreEntity.className);
    parseObjectGenre03.objectId = 'w7n72uFBv2';
    parseObjectAuthor03.set('typePointerGenre', parseObjectGenre03);
    await parseObjectAuthor03.save();

    log('addPointer 04');
    final parseObjectAuthor04 = ParseObject(AuthorEntity.className);
    parseObjectAuthor04.objectId = 'Os6PbtVoms';
    parseObjectAuthor04.set(
        'typePointerGenre',
        (ParseObject(GenreEntity.className)..objectId = 'bxirK4sWKU')
            .toPointer());
    await parseObjectAuthor04.save();
  }

  static removeAll() async {
    final apiResponse = await ParseObject(AuthorEntity.className).getAll();

    if (apiResponse.success && apiResponse.results != null) {
      for (ParseObject element in apiResponse.results!) {
        await element.delete();
      }
    }
  }
}
