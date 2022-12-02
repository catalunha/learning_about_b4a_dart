import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/genre_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GenreSearch {
  GenreSearch() {
    log('=== GenreView ===');
  }

  /// Retorna um objeto da class baseado no seu [objectId]
  void getObject(String objectId) async {
    // GenreController genreController = GenreController();
    // GenreModel? genreModel = await genreController.getObject(objectId);
    log('+++ getObject +++');
    GenreModel? genreModel;
    final parseResponse =
        await ParseObject(GenreEntity.className).getObject(objectId);
    if (parseResponse.success && parseResponse.results != null) {
      genreModel = GenreEntity().toModel(parseResponse.results!.first);
    }
    log('... getObject ...');
    if (genreModel == null) {
      log('null');
    } else {
      log(genreModel.toString());
    }
    log('--- getObject ---');
  }

  /// Retorna todos os objetos da class
  void getAll() async {
    log('+++ getAll +++');
    var list = <GenreModel>[];
    final parseResponse = await ParseObject(GenreEntity.className).getAll();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... getAll ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- getAll ---');
  }

  /// Retorna a quantidade de objetos da query
  void count() async {
    log('+++ count +++');
    int result = -1;
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    var parseResponse = await queryBuilder.count();
    if (parseResponse.success && parseResponse.results != null) {
      result = parseResponse.count;
    }

    log('... count ...');
    log(result.toString());
    log('--- count ---');
  }

  /// Constroi a consulta com todos os objetos da class
  /// Pois neste caso a queryBuilder não tem restrições
  void queryBuilder() async {
    log('+++ queryBuilder +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilder ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilder ---');
  }

  /// Constroi a consulta em ordem crescente para este atributo
  void queryBuilderOrderByAscending(String columnName) async {
    log('+++ queryBuilderOrderByAscending +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.orderByAscending(columnName);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderOrderByAscending ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderOrderByAscending ---');
  }

  /// Constroi a consulta em ordem decrescente para este atributo
  void queryBuilderOrderByDescending(String columnName) async {
    log('+++ queryBuilderOrderByDescending +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.orderByDescending(columnName);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderOrderByDescending ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderOrderByDescending ---');
  }

  /// Constroi a consulta excluindo esta lista de atributos nos objetos retornados
  void queryBuilderExcludeKeys(List<String> columnsName) async {
    log('+++ queryBuilderExcludeKeys +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.excludeKeys(columnsName);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderExcludeKeys ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderExcludeKeys ---');
  }

  /// Constroi a consulta com apenas esta lista de atributos nos objetos retornados
  void queryBuilderKeysToReturn(List<String> columnsName) async {
    log('+++ queryBuilderKeysToReturn +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.keysToReturn(columnsName);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderKeysToReturn ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderKeysToReturn ---');
  }

  /// Constroi a consulta com uma quantidade de objetos após saltar certa
  /// quantidade de objetos.
  /// A junção destas faz a paginação dos objetos retornados.
  void queryBuilderPagination(int page, int limit) async {
    log('+++ queryBuilderPagination +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.setAmountToSkip((page - 1) * limit);
    queryBuilder.setLimit(limit);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderPagination ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderPagination ---');
  }

  /// Constroi a consulta onde um [atributo] é igual a um [valor]
  void queryBuilderWhereEqualToSimpleColumn(
      String columnName, dynamic value) async {
    log('+++ queryBuilderWhereEqualToSimpleColumn +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereEqualTo(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereEqualToSimpleColumn ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereEqualToSimpleColumn ---');
  }

  /// Constroi a consulta onde um [atributo] não é igual a um [valor]
  /// Se coluna for DateTime cuidar para valor ser exato até millisecond
  /// Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
  void queryBuilderWhereNotEqualToSimpleColumn(
      String columnName, dynamic value) async {
    log('+++ queryBuilderWhereNotEqualToSimpleColumn +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereNotEqualTo(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereNotEqualToSimpleColumn ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereNotEqualToSimpleColumn ---');
  }

  /// Constroi a consulta onde um [atributo] é maior que um determinado [valor]
  /// Como false=0 e true=1 então Maior que funciona como inteiro.
  /// Funciona como ordem alfabética
  /// Se coluna for DateTime cuidar para valor ser exato até millisecond
  /// Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
  void queryBuilderWhereGreaterThan(String columnName, dynamic value) async {
    log('+++ queryBuilderWhereGreaterThan +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereGreaterThan(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereGreaterThan ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereGreaterThan ---');
  }

  /// Constroi a consulta onde um [atributo] é maior ou igual a um determinado [valor]
  void queryBuilderWhereGreaterThanOrEqualsTo(
      String columnName, dynamic value) async {
    log('+++ queryBuilderWhereGreaterThanOrEqualsTo +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereGreaterThanOrEqualsTo(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereGreaterThanOrEqualsTo ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereGreaterThanOrEqualsTo ---');
  }

  /// Constroi a consulta onde um [atributo] é menor que um determinado [valor]
  void queryBuilderWhereLessThan(String columnName, dynamic value) async {
    log('+++ queryBuilderWhereLessThan +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereLessThan(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereLessThan ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereLessThan ---');
  }

  /// Constroi a consulta onde um [atributo] é menor ou igual a um determinado [valor]
  void queryBuilderWhereLessThanOrEqualTo(
      String columnName, dynamic value) async {
    log('+++ queryBuilderWhereLessThanOrEqualTo +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereLessThanOrEqualTo(columnName, value);
    // Se coluna for DateTime cuidar para valor ser exato até millisecond
    // Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereLessThanOrEqualTo ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereLessThanOrEqualTo ---');
  }

  /// Constroi a consulta onde
  /// whereValueExists('anyType', true) o [atributo] é diferente de undefined
  /// whereValueExists('anyType', false) o [atributo] é undefined
  void queryBuilderWhereValueExists(
      String columnName, bool containValue) async {
    log('+++ queryBuilderWhereValueExists +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereValueExists(columnName, containValue);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereValueExists ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereValueExists ---');
  }

  /// Constroi a consulta onde o [atributo] do tipo String inicia com este [text]
  void queryBuilderWhereStartsWith(String columnName, String text) async {
    log('+++ queryBuilderWhereStartsWith +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereStartsWith(columnName, text);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereStartsWith ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereStartsWith ---');
  }

  /// Constroi a consulta onde o [atributo] do tipo String finaliza com este [text]
  void queryBuilderWhereEndsWith(String columnName, String text) async {
    log('+++ queryBuilderWhereEndsWith +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereEndsWith(columnName, text);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereEndsWith ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereEndsWith ---');
  }

  /// Constroi a consulta onde o [atributo] do tipo String contem em qualquer parte este [text]
  void queryBuilderWhereContains(String columnName, String text) async {
    log('+++ queryBuilderWhereContains +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereContains(columnName, text);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereContains ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereContains ---');
  }

  /// Constroi a consulta onde qualquer objeto com [atributo] typeArray contem
  /// um elemento que é igual a qualquer um dos itens da lista
  /// Por exemplo: atributo vale ["a","1"] e lista contem ["a","3"] o retorno é true
  /// Por exemplo: atributo vale ["b","2"] e lista contem ["a","3"] o retorno é false
  /// Por exemplo: atributo vale ["c","3"] e lista contem ["a","3"] o retorno é true
  void queryBuilderWhereContainedIn(
      String columnName, List<dynamic> values) async {
    log('+++ queryBuilderWhereContainedIn +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereContainedIn(columnName, values);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereContainedIn ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereContainedIn ---');
  }

  /// Constroi a consulta onde qualquer objeto com [atributo] typeArray contem
  /// todos os itens da lista
  /// Por exemplo: atributo vale ["a","1","4"] e lista contem ["a","1"] o retorno é true
  /// Por exemplo: atributo vale ["b","2"] e lista contem ["a","3"] o retorno é false
  /// Por exemplo: atributo vale ["c","3"] e lista contem ["a","3"] o retorno é false
  void queryBuilderWhereArrayContainsAll(
      String columnName, List<dynamic> values) async {
    log('+++ queryBuilderWhereArrayContainsAll +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder.whereArrayContainsAll(columnName, values);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereArrayContainsAll ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereArrayContainsAll ---');
  }

  /// Constroi a consulta onde os objetos retornados são a junção de qualquer
  /// resultado das consultas individuais
  void queryBuilderOr() async {
    log('+++ queryBuilderOr +++');
    var list = <GenreModel>[];
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

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderOr ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderOr ---');
  }
}
