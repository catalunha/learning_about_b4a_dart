import 'package:learning_about_b4a_dart/core/models/genre_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GenreController {
  Future<GenreModel?> get(String objectId) async {
    final parseResponse =
        await ParseObject(GenreEntity.className).getObject(objectId);
    GenreModel? profileModel;

    if (parseResponse.success && parseResponse.results != null) {
      profileModel = GenreEntity().toModel(parseResponse.results!.first);
    }
    return profileModel;
  }

  Future<List<GenreModel>> getAll() async {
    final parseResponse = await ParseObject(GenreEntity.className).getAll();
    var list = <GenreModel>[];

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<void> unset(String objectId, String columnName) async {
    final parseObject = ParseObject(GenreEntity.className);
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

  Future<int> count() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    var parseResponse = await queryBuilder.count();
    int result = -1;
    if (parseResponse.success && parseResponse.results != null) {
      result = parseResponse.count;
    }

    return result;
  }

  Future<List<GenreModel>> queryBuilder() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderOrderByDescending(
      String columnName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.orderByDescending(columnName);
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderOrderByAscending(
      String columnName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.orderByAscending(columnName);
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderExcludeKeys(
      List<String> columnsName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.excludeKeys(columnsName);
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderKeysToReturn(
      List<String> columnsName) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.keysToReturn(columnsName);
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderPagination(int page, int limit) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.setAmountToSkip((page - 1) * limit);
    queryBuilder.setLimit(limit);
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderWhereEqualToSimpleColumn(
      String columnName, dynamic value) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereEqualTo(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderWhereNotEqualToSimpleColumn(
      String columnName, dynamic value) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereNotEqualTo(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderWhereGreaterThan(
      String columnName, dynamic value) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereGreaterThan(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderWhereGreaterThanOrEqualsTo(
      String columnName, dynamic value) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereGreaterThanOrEqualsTo(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderWhereLessThan(
      String columnName, dynamic value) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereLessThan(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderWhereLessThanOrEqualTo(
      String columnName, dynamic value) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereLessThanOrEqualTo(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderWhereValueExists(
      String columnName, bool containValue) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereValueExists(columnName, containValue);
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderWhereStartsWith(
      String columnName, String text) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereStartsWith(columnName, text);
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderWhereEndsWith(
      String columnName, String text) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereEndsWith(columnName, text);
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderWhereContains(
      String columnName, String text) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereContains(columnName, text);
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderWhereContainedIn(
      String columnName, List<dynamic> values) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereContainedIn(columnName, values);
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderWhereArrayContainsAll(
      String columnName, List<dynamic> values) async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereArrayContainsAll(columnName, values);
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<GenreModel>> queryBuilderOr() async {
    QueryBuilder<ParseObject> queryBuilder1 =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder1.whereLessThan('typeNumber', 2);
    QueryBuilder<ParseObject> queryBuilder2 =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder2.whereGreaterThan('typeNumber', 3);
    QueryBuilder<ParseObject> queryBuilder = QueryBuilder.or(
      ParseObject(GenreEntity.className),
      [queryBuilder1, queryBuilder2],
    );
    var parseResponse = await queryBuilder.query();

    var list = <GenreModel>[];
    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    return list;
  }
}
