import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/genre_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GenreSearch {
  GenreSearch() {
    log('=== GenreView ===');
  }

  /// Retorna um objeto da class baseado no seu [objectId]
  Future<List<String>> getObject(String objectId) async {
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
      log('--- getObject ---');
      return [''];
    } else {
      log(genreModel.toString());
      log('--- getObject ---');
      return [genreModel.toString()];
    }
  }

  /// Retorna todos os objetos da class
  Future<List<String>> getAll() async {
    log('+++ getAll +++');
    var list = <GenreModel>[];
    final parseResponse = await ParseObject(GenreEntity.className).getAll();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('--- getAll ---');
    return list.map((e) => e.toString()).toList();
  }

  /// Retorna a quantidade de objetos da query
  Future<List<String>> queryBuilderCount() async {
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
    return [result.toString()];
  }

  /// Constroi a consulta com todos os objetos da class
  /// Pois neste caso a queryBuilder não tem restrições
  Future<List<String>> queryBuilder() async {
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
    return list.map((e) => e.toString()).toList();

    log('--- queryBuilder ---');
  }

  /// Constroi a consulta em ordem crescente para este atributo
  Future<List<String>> queryBuilderOrderByAscending(String columnName) async {
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta em ordem decrescente para este atributo
  Future<List<String>> queryBuilderOrderByDescending(String columnName) async {
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta excluindo esta lista de atributos nos objetos retornados
  Future<List<String>> queryBuilderExcludeKeys(List<String> columnsName) async {
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta com apenas esta lista de atributos nos objetos retornados
  Future<List<String>> queryBuilderKeysToReturn(
      List<String> columnsName) async {
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta com uma quantidade de objetos após saltar certa
  /// quantidade de objetos.
  /// A junção destas faz a paginação dos objetos retornados.
  Future<List<String>> queryBuilderPagination(int page, int limit) async {
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde um [atributo] é igual a um [valor]
  Future<List<String>> queryBuilderWhereEqualToSimpleColumn(
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde um [atributo] não é igual a um [valor]
  /// Se coluna for DateTime cuidar para valor ser exato até millisecond
  /// Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
  Future<List<String>> queryBuilderWhereNotEqualToSimpleColumn(
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde um [atributo] é maior que um determinado [valor]
  /// Como false=0 e true=1 então Maior que funciona como inteiro.
  /// Funciona como ordem alfabética
  /// Se coluna for DateTime cuidar para valor ser exato até millisecond
  /// Informe DateTime local que ele compara em UTC no Back4app. Ou seja +3h
  Future<List<String>> queryBuilderWhereGreaterThan(
      String columnName, dynamic value) async {
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde um [atributo] é maior ou igual a um determinado [valor]
  Future<List<String>> queryBuilderWhereGreaterThanOrEqualsTo(
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde um [atributo] é menor que um determinado [valor]
  Future<List<String>> queryBuilderWhereLessThan(
      String columnName, dynamic value) async {
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde um [atributo] é menor ou igual a um determinado [valor]
  Future<List<String>> queryBuilderWhereLessThanOrEqualTo(
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde
  /// whereValueExists('anyType', true) o [atributo] é diferente de undefined
  /// whereValueExists('anyType', false) o [atributo] é undefined
  Future<List<String>> queryBuilderWhereValueExists(
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde o [atributo] do tipo String inicia com este [text]
  Future<List<String>> queryBuilderWhereStartsWith(
      String columnName, String text) async {
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde o [atributo] do tipo String finaliza com este [text]
  Future<List<String>> queryBuilderWhereEndsWith(
      String columnName, String text) async {
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde o [atributo] do tipo String contem em qualquer parte este [text]
  Future<List<String>> queryBuilderWhereContains(
      String columnName, String text) async {
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde qualquer objeto com [atributo] typeArray contem
  /// um elemento que é igual a qualquer um dos itens da lista
  /// Por exemplo: atributo vale ["a","1"] e busca que contem ["a","3"] o retorno é true
  /// Por exemplo: atributo vale ["b","2"] e busca que contem ["a","3"] o retorno é false
  /// Por exemplo: atributo vale ["c","3"] e busca que contem ["a","3"] o retorno é true
  Future<List<String>> queryBuilderWhereContainedIn(
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde qualquer objeto com [atributo] typeArray contem
  /// todos os itens da lista
  /// Por exemplo: atributo vale ["a","1","4"] e busca que contem ["a","1"] o retorno é true
  /// Por exemplo: atributo vale ["b","2"] e busca que contem ["a","1"] o retorno é false
  /// Por exemplo: atributo vale ["c","3"] e busca que contem ["a","1"] o retorno é false
  Future<List<String>> queryBuilderWhereArrayContainsAll(
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
    return list.map((e) => e.toString()).toList();
  }

  /// Constroi a consulta onde os objetos retornados são a junção de qualquer
  /// resultado das consultas individuais
  Future<List<String>> queryBuilderOr() async {
    log('+++ queryBuilderOr +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder1 =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder1.whereLessThan('typeNumber', 2);
    QueryBuilder<ParseObject> queryBuilder2 =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    queryBuilder2.whereGreaterThan('typeNumber', 2);
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
    return list.map((e) => e.toString()).toList();
  }

  Future<List<String>> queryBuilderCustom() async {
    log('+++ queryBuilderCustom +++');
    var list = <GenreModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    // Entra a busca aninhada com chamadas ja estudadas.
    //+++
    queryBuilder.orderByAscending('typeString');
    queryBuilder.orderByDescending('typeString');
    queryBuilder.excludeKeys(['typeString']);
    queryBuilder.keysToReturn(['typeString']);
    queryBuilder.setAmountToSkip(1);
    queryBuilder.setLimit(1);
    queryBuilder.whereEqualTo('typeBoolean', false);
    queryBuilder.whereEqualTo('typeString', 'Genre01');
    queryBuilder.whereEqualTo('typeNumber', 3);
    queryBuilder.whereEqualTo('typeDate', DateTime(2022, 11, 26, 10));
    queryBuilder.whereNotEqualTo('typeBoolean', true);
    queryBuilder.whereNotEqualTo('typeString', 'Genre02');
    queryBuilder.whereNotEqualTo('typeNumber', 3);
    queryBuilder.whereEqualTo(
        'typeDateTime', DateTime(2022, 12, 02, 16, 42, 36));
    queryBuilder.whereGreaterThan('typeBoolean', false);
    queryBuilder.whereGreaterThan('typeString', 'Genre02');
    queryBuilder.whereGreaterThan('typeNumber', 3);
    queryBuilder.whereGreaterThan('typeDate', DateTime(2022, 11, 25, 10));
    queryBuilder.whereGreaterThanOrEqualsTo('typeBoolean', true);
    queryBuilder.whereGreaterThanOrEqualsTo('typeString', 'Genre02');
    queryBuilder.whereGreaterThanOrEqualsTo('typeNumber', 3);
    queryBuilder.whereGreaterThanOrEqualsTo(
        'typeDate', DateTime(2022, 11, 25, 10));
    queryBuilder.whereLessThan('typeBoolean', true);
    queryBuilder.whereLessThan('typeString', 'Genre02');
    queryBuilder.whereLessThan('typeNumber', 3);
    queryBuilder.whereLessThan('typeDate', DateTime(2022, 11, 25, 10));
    queryBuilder.whereLessThanOrEqualTo('typeBoolean', true);
    queryBuilder.whereLessThanOrEqualTo('typeString', 'Genre02');
    queryBuilder.whereLessThanOrEqualTo('typeNumber', 3);
    queryBuilder.whereLessThanOrEqualTo('typeDate', DateTime(2022, 11, 25, 10));
    queryBuilder.whereValueExists('typeString', false);
    queryBuilder.whereStartsWith('typeString', 'g');
    queryBuilder.whereEndsWith('typeString', '2');
    queryBuilder.whereContains('typeString', '0');
    queryBuilder.whereContainedIn('typeArray', ['a', '3']);
    queryBuilder.whereArrayContainsAll('typeArray', ['a', '1']);
    //---
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(GenreEntity().toModel(element));
      }
    }
    log('... queryBuilderCustom ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderCustom ---');
    return list.map((e) => e.toString()).toList();
  }
}
