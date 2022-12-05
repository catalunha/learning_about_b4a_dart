import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/book_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/author_entity.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/book_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class BookSearch {
  BookSearch() {
    log('=== BookSearch ===');
  }

  Future<void> queryBuilderIncludeObject(List<String> columnsName) async {
    log('+++ queryBuilderIncludeObject +++');
    var list = <BookModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(BookEntity.className));
    queryBuilder.includeObject(columnsName);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(await BookEntity().toModel(element));
      }
    }
    log('... queryBuilderIncludeObject ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderIncludeObject ---');
  }

  void queryBuilderWhereEqualToRelation(
      String relationClassName, String relationId) async {
    log('+++ queryBuilderWhereEqualToRelation +++');
    var list = <BookModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(BookEntity.className));
    queryBuilder.whereEqualTo('typeRelationAuthor',
        (ParseObject(relationClassName)..objectId = relationId).toPointer());
    var apiResponse = await queryBuilder.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await BookEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereEqualToRelation ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereEqualToRelation ---');
  }

  void queryBuilderWhereMatchesQuery() async {
    log('+++ queryBuilderWhereMatchesQuery +++');
    var list = <BookModel>[];
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '1']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(BookEntity.className));

    queryBuilder.whereMatchesQuery('typeRelationAuthor', otherQueryBuilder);
    var apiResponse = await queryBuilder.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await BookEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereMatchesQuery ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereMatchesQuery ---');
  }

  void queryBuilderWhereDoesNotMatchQuery() async {
    log('+++ queryBuilderWhereDoesNotMatchQuery +++');
    var list = <BookModel>[];
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '1']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(BookEntity.className));

    queryBuilder.whereDoesNotMatchQuery(
        'typeRelationAuthor', otherQueryBuilder);
    var apiResponse = await queryBuilder.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await BookEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereDoesNotMatchQuery ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereDoesNotMatchQuery ---');
  }
}
