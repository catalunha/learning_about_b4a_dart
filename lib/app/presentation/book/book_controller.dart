import 'package:learning_about_b4a_dart/app/core/models/book_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/author_entity.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/book_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class BookController {
  Future<List<BookModel>> queryBuilderIncludeObject(
      List<String> columnsName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(BookEntity.className));
    queryBuilder.includeObject(columnsName);
    var parseResponse = await queryBuilder.query();

    var list = <BookModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(await BookEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<BookModel>> queryBuilderWhereEqualToRelation(
      String relationClassName, String relationId) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(BookEntity.className));
    queryBuilder.whereEqualTo('typeRelation',
        (ParseObject(relationClassName)..objectId = relationId).toPointer());
    var apiResponse = await queryBuilder.query();

    var list = <BookModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await BookEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<BookModel>> queryBuilderWhereMatchesQuery() async {
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['b', '2']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(BookEntity.className));

    queryBuilder.whereMatchesQuery('typeRelation', otherQueryBuilder);
    var apiResponse = await queryBuilder.query();

    var list = <BookModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await BookEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<BookModel>> queryBuilderWhereDoesNotMatchQuery() async {
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '4']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(BookEntity.className));

    queryBuilder.whereDoesNotMatchQuery('typeRelation', otherQueryBuilder);
    var apiResponse = await queryBuilder.query();

    var list = <BookModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await BookEntity().toModel(element));
      }
    }
    return list;
  }
}
