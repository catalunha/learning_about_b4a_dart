import 'package:learning_about_b4a_dart/core/models/genre_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GenreController {
  Future<int> count() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Genre'));
    var apiResponse = await queryBuilder.count();
    int result = -1;
    if (apiResponse.success && apiResponse.results != null) {
      result = apiResponse.count;
    }

    return result;
  }

  Future<GenreModel?> get(String objectId) async {
    final apiResponse = await ParseObject('Genre').getObject(objectId);
    GenreModel? profileModel;

    if (apiResponse.success && apiResponse.results != null) {
      profileModel = GenreEntity().toModel(apiResponse.results!.first);
    }
    return profileModel;
  }

  Future<List<GenreModel>> getAll() async {
    final apiResponse = await ParseObject('Genre').getAll();
    var list = <GenreModel>[];

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilder() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Genre'));
    var apiResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderOrderByDescending(
      String columnName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Genre'));
    queryBuilder.orderByDescending(columnName);
    var apiResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderOrderByAscending(
      String columnName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Genre'));
    queryBuilder.orderByAscending(columnName);
    var apiResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderExcludeKeys(
      List<String> columnsName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Genre'));
    queryBuilder.excludeKeys(columnsName);
    var apiResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderKeysToReturn(
      List<String> columnsName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Genre'));
    queryBuilder.keysToReturn(columnsName);
    var apiResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderPagination(int page, int limit) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Genre'));
    queryBuilder.setAmountToSkip((page - 1) * limit);
    queryBuilder.setLimit(limit);
    var apiResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }
}
