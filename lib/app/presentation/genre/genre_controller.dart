import 'package:learning_about_b4a_dart/app/core/models/genre_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GenreController {
  /// Retorna um objeto da class baseado no seu [objectId]
  Future<GenreModel?> getObject(String objectId) async {
    final parseResponse =
        await ParseObject(GenreEntity.className).getObject(objectId);
    GenreModel? genreModel;

    if (parseResponse.success && parseResponse.results != null) {
      genreModel = GenreEntity().toModel(parseResponse.results!.first);
    }
    return genreModel;
  }

  /// Retorna todos os objetos da class
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

  /// Retorna a quantidade de objetos da query
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

  /// Constroi a consulta com todos os objetos da class
  /// Pois neste caso a queryBuilder não tem restrições
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

  /// Constroi a consulta em ordem decrescente para este atributo
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

  /// Constroi a consulta em ordem crescente para este atributo
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

  /// Constroi a consulta excluindo esta lista de atributos nos objetos retornados
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

  /// Constroi a consulta com apenas esta lista de atributos nos objetos retornados
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

  /// Constroi a consulta com uma quantidade de objetos após saltar certa
  /// quantidade de objetos.
  /// A junção destas faz a paginação dos objetos retornados.
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

  /// Constroi a consulta onde um [atributo] é igual a um [valor]
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

  /// Constroi a consulta onde um [atributo] não é igual a um [valor]
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

  /// Constroi a consulta onde um [atributo] é maior que um determinado [valor]
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

  /// Constroi a consulta onde um [atributo] é maior ou igual a um determinado [valor]
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

  /// Constroi a consulta onde um [atributo] é menor que um determinado [valor]
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

  /// Constroi a consulta onde um [atributo] é menor ou igual a um determinado [valor]
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

  /// Constroi a consulta onde
  /// whereValueExists('anyType', true) o [atributo] é diferente de undefined
  /// whereValueExists('anyType', false) o [atributo] é undefined
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

  /// Constroi a consulta onde o [atributo] do tipo String inicia com este [text]
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

  /// Constroi a consulta onde o [atributo] do tipo String finaliza com este [text]
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

  /// Constroi a consulta onde o [atributo] do tipo String contem em qualquer parte este [text]
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

  /// Constroi a consulta onde qualquer objeto com [atributo] typeArray contem
  /// um elemento que é igual a qualquer um dos itens da lista
  /// Por exemplo: atributo vale ["a","1"] e lista contem ["a","3"] o retorno é true
  /// Por exemplo: atributo vale ["b","2"] e lista contem ["a","3"] o retorno é false
  /// Por exemplo: atributo vale ["c","3"] e lista contem ["a","3"] o retorno é true
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

  /// Constroi a consulta onde qualquer objeto com [atributo] typeArray contem
  /// todos os itens da lista
  /// Por exemplo: atributo vale ["a","1","4"] e lista contem ["a","1"] o retorno é true
  /// Por exemplo: atributo vale ["b","2"] e lista contem ["a","3"] o retorno é false
  /// Por exemplo: atributo vale ["c","3"] e lista contem ["a","3"] o retorno é false
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

  /// Constroi a consulta onde os objetos retornados são a junção de qualquer
  /// resultado das consultas individuais
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
