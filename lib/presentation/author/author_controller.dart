import 'package:learning_about_b4a_dart/core/models/author_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/author_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AuthorController {
  Future<int> count() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Author'));
    var apiResponse = await queryBuilder.count();
    int result = -1;
    if (apiResponse.success && apiResponse.results != null) {
      result = apiResponse.count;
    }

    return result;
  }

  Future<AuthorModel?> get(String objectId) async {
    final apiResponse = await ParseObject('Author').getObject(objectId);
    AuthorModel? profileModel;

    if (apiResponse.success && apiResponse.results != null) {
      profileModel = AuthorEntity().toModel(apiResponse.results!.first);
    }
    return profileModel;
  }

  Future<List<AuthorModel>> getAll() async {
    final apiResponse = await ParseObject('Author').getAll();
    var list = <AuthorModel>[];

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<AuthorModel>> queryBuilder() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Author'));
    var apiResponse = await queryBuilder.query();

    var list = <AuthorModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<AuthorModel>> queryBuilderOrderByDescending(
      String columnName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Author'));
    queryBuilder.orderByDescending(columnName);
    var apiResponse = await queryBuilder.query();

    var list = <AuthorModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<AuthorModel>> queryBuilderOrderByAscending(
      String columnName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Author'));
    queryBuilder.orderByAscending(columnName);
    var apiResponse = await queryBuilder.query();

    var list = <AuthorModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<AuthorModel>> queryBuilderExcludeKeys(
      List<String> columnsName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Author'));
    queryBuilder.excludeKeys(columnsName);
    var apiResponse = await queryBuilder.query();

    var list = <AuthorModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<AuthorModel>> queryBuilderKeysToReturn(
      List<String> columnsName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Author'));
    queryBuilder.keysToReturn(columnsName);
    var apiResponse = await queryBuilder.query();

    var list = <AuthorModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<AuthorModel>> queryBuilderPagination(int page, int limit) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Author'));
    queryBuilder.setAmountToSkip((page - 1) * limit);
    queryBuilder.setLimit(limit);
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
