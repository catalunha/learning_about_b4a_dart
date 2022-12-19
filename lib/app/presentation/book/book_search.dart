import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/book_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/author_entity.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/book_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class BookSearch {
  BookSearch() {
    log('=== BookSearch ===');
  }

  Future<List<String>> queryBuilderIncludeObject(
      List<String> columnsName) async {
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
    log('--- queryBuilderIncludeObject ---');
    return list.map((e) => e.toString()).toList();
  }

  Future<List<String>> queryBuilderWhereEqualToRelation(
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
    log('--- queryBuilderWhereEqualToRelation ---');
    return list.map((e) => e.toString()).toList();
  }

  Future<List<String>> queryBuilderWhereMatchesQuery() async {
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
    log('--- queryBuilderWhereMatchesQuery ---');
    return list.map((e) => e.toString()).toList();
  }

  Future<List<String>> queryBuilderWhereDoesNotMatchQuery() async {
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
    log('--- queryBuilderWhereDoesNotMatchQuery ---');
    return list.map((e) => e.toString()).toList();
  }
}
