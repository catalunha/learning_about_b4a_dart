import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/book_model.dart';
import 'package:learning_about_b4a_dart/app/core/models/publisher_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/author_entity.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/book_entity.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/publisher_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class BookRepository {
  addAll() async {
    log('+++ addAll +++');
    await removeAll();
    var authorModelList = <BookModel>[];
    authorModelList.addAll([
      BookModel(
        typeString: 'Book01',
        typeBoolean: true,
        typeNumber: 1,
        typeDateTime: DateTime.now(),
        typeArray: ['a', '1'],
        typePointerPublisher: PublisherModel(objectId: 'SCayOAj8A1'),
      ),
      BookModel(
        typeString: 'Book02',
        typeBoolean: false,
        typeNumber: 2,
        typeDateTime: DateTime(2022, 11, 26, 12).add(Duration(hours: 1)),
        typeArray: ['b', '2'],
        typePointerPublisher: PublisherModel(objectId: 'HnRTwlj7p5'),
      ),
      BookModel(
        typeString: 'Book03',
        typeBoolean: true,
        typeNumber: 3,
        typeDateTime: DateTime.now().add(Duration(hours: 2)),
        typeArray: ['c', '3'],
        typePointerPublisher: PublisherModel(objectId: 'xRbr9Z1v5U'),
      ),
    ]);
    for (var authorModel in authorModelList) {
      ParseObject authorParseObject = BookEntity().toParse(authorModel);
      await authorParseObject.save();
    }
  }

  addPointer() async {
    // log('addPointer 01');
    // final parseObjectBook01 = ParseObject(BookEntity.className);
    // parseObjectBook01.objectId = 'aeOTTuGO7r';
    // final parseObjectPublisher01 = ParseObject(PublisherEntity.className);
    // parseObjectPublisher01.objectId = '5iLu1JOO9x';
    // parseObjectBook01.set('typePointerPublisher', parseObjectPublisher01);
    // await parseObjectBook01.save();

    log('addPointer 02');
    final parseObjectBook02 = ParseObject(BookEntity.className);
    parseObjectBook02.objectId = 'gkotvO6IKI';
    parseObjectBook02.set(
        'typePointerPublisher',
        (ParseObject(PublisherEntity.className)..objectId = 't6ziHJPZdb')
            .toPointer());
    await parseObjectBook02.save();

    log('addPointer 03');
    final parseObjectBook03 = ParseObject(BookEntity.className);
    parseObjectBook03.objectId = 'wOXryOT9nK';
    final parseObjectPublisher03 = ParseObject(PublisherEntity.className);
    parseObjectPublisher03.objectId = 'aPqY5rvjzd';
    parseObjectBook03.set('typePointerPublisher', parseObjectPublisher03);
    await parseObjectBook03.save();
  }

  addRelations() async {
    log('addRelation 01');
    //The downside of this approach is that it fetches the data.
    var parseObjectBook01 = ParseObject(BookEntity.className);
    parseObjectBook01.objectId = 'aeOTTuGO7r';
    parseObjectBook01 = await parseObjectBook01.fetch();
    var parseRelationBook = parseObjectBook01.getRelation('typeRelationAuthor');
    final parseObjectAuthor01 = ParseObject(AuthorEntity.className);
    parseObjectAuthor01.objectId = 'fK4I00NlBy';
    parseRelationBook.add(parseObjectAuthor01);
    await parseObjectBook01.save();

    log('addRelation 02');
    final parseObjectBook02 = ParseObject(BookEntity.className);
    parseObjectBook02.objectId = 'gkotvO6IKI';
    final parseObjectAuthor02 = ParseObject(AuthorEntity.className);
    parseObjectAuthor02.objectId = 'ETwKYOAMh2';
    parseObjectBook02.addRelation(
        'typeRelationAuthor', [parseObjectAuthor01, parseObjectAuthor02]);
    await parseObjectBook02.save();
  }

  removeRelations() async {
    log(' +++ removeRelations +++');
    final parseObjectBook = ParseObject(BookEntity.className);
    parseObjectBook.objectId = 'gkotvO6IKI';
    final parseObjectAuthor = ParseObject(AuthorEntity.className);
    parseObjectAuthor.objectId = 'ETwKYOAMh2';
    parseObjectBook.removeRelation('typeRelationAuthor', [parseObjectAuthor]);
    await parseObjectBook.save();
  }

  add() async {
    var bookModel = BookModel(
      typeString: 'Book04',
      typeBoolean: false,
      typeNumber: 4,
      typeDateTime: DateTime.now().add(Duration(hours: 23)),
      typeArray: ['d', '4'],
    );
    ParseObject bookParseObject = BookEntity().toParse(bookModel);
    await bookParseObject.save();
  }

  update() async {
    var bookModel = BookModel(
      objectId: '',
      typeString: 'Book04',
      typeBoolean: false,
      typeNumber: 4,
      typeDateTime: DateTime.now().add(Duration(hours: 23)),
      typeArray: ['d', '4'],
    );
    ParseObject bookParseObject = BookEntity().toParse(bookModel);
    await bookParseObject.save();
  }

  unset(String objectId, String columnName) async {
    final parseObject = ParseObject(BookEntity.className);
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
    final parseObject = ParseObject(BookEntity.className);
    parseObject.objectId = objectId;
    await parseObject.delete();
  }

  Future<void> removeAll() async {
    final apiResponse = await ParseObject(BookEntity.className).getAll();

    if (apiResponse.success && apiResponse.results != null) {
      for (ParseObject element in apiResponse.results!) {
        await element.delete();
      }
    }
  }
}
