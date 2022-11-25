import 'package:learning_about_b4a_dart/core/models/author_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/author_entity.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AuthorController {
  Future<List<AuthorModel>> queryBuilderIncludeObject(
      List<String> columnsName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Author'));
    queryBuilder.includeObject(columnsName);
    var parseResponse = await queryBuilder.query();

    var list = <AuthorModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<AuthorModel>> queryBuilderWhereEqualToPointer(
      String columnName, String pointerClassName, String pointerId) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));
    queryBuilder.whereEqualTo('typePointer',
        (ParseObject(pointerClassName)..objectId = pointerId).toPointer());
    var apiResponse = await queryBuilder.query();

    var list = <AuthorModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<AuthorModel>> queryBuilderWhereMatchesQuery() async {
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '4']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));

    queryBuilder.whereMatchesQuery('typePointer', otherQueryBuilder);
    queryBuilder.includeObject(['typePointer']);
    var apiResponse = await queryBuilder.query();

    var list = <AuthorModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<AuthorModel>> queryBuilderWhereDoesNotMatchQuery() async {
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '4']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));

    queryBuilder.whereDoesNotMatchQuery('typePointer', otherQueryBuilder);
    queryBuilder.includeObject(['typePointer']);
    var apiResponse = await queryBuilder.query();

    var list = <AuthorModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<AuthorModel>> queryBuilderWhereMatchesKeyInQuery() async {
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '4']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));

    queryBuilder.whereMatchesKeyInQuery(
        'typeNumber', 'typeNumber', otherQueryBuilder);
    var apiResponse = await queryBuilder.query();

    var list = <AuthorModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<AuthorModel>> queryBuilderWhereDoesNotMatchKeyInQuery() async {
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '4']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));

    queryBuilder.whereDoesNotMatchKeyInQuery(
        'typeNumber', 'typeNumber', otherQueryBuilder);
    var apiResponse = await queryBuilder.query();

    var list = <AuthorModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    return list;
  }
}
