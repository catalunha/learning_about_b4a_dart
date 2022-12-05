import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/author_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/author_entity.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AuthorSearch {
  AuthorSearch() {
    log('=== AuthorSearch ===');
  }

  /// Constroi a consulta incluindo todos os atributos da class ligada pelo ponteiro.
  /// Se não colocar [includeObject] o response traz apenas o objectId do objeto ligado pelo ponteiro
  void queryBuilderIncludeObject(List<String> columnsName) async {
    log('+++ queryBuilderIncludeObject +++');
    var list = <AuthorModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Author'));
    queryBuilder.includeObject(columnsName);
    var parseResponse = await queryBuilder.query();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    log('... queryBuilderIncludeObject ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderIncludeObject ---');
  }

  /// Constroi a consulta onde todos os objetos são iguais ao objectId do ponteiro informado.
  /// E o mesmo que um whereEqualTo('typeString',"a") mas aplicado a um ponteiro.
  void queryBuilderWhereEqualToPointer(
      String columnName, String pointerClassName, String pointerId) async {
    log('+++ queryBuilderWhereEqualToPointer +++');
    var list = <AuthorModel>[];
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));
    queryBuilder.whereEqualTo(columnName,
        (ParseObject(pointerClassName)..objectId = pointerId).toPointer());
    var apiResponse = await queryBuilder.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereEqualToPointer ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereEqualToPointer ---');
  }

  /// Envolve apenas uma coluna typePointer e sua query
  /// Lembre-se que a class Author tem um ponteiro, typePointerGenre, para uma class Genre
  /// Então filtramos com qualquer condição desejada os objectIds em Genre.
  /// Este é meu pointerQueryBuilder
  /// Agora eu desejo filtrar minha class Author pelo atributo typePointerGenre
  /// onde o valor deste seja igual a qualquer um dos objectIds encontrados no filtro de Genre
  /// que esta em pointerQueryBuilder
  void queryBuilderWhereMatchesQuery() async {
    log('+++ queryBuilderWhereMatchesQuery +++');
    var list = <AuthorModel>[];
    QueryBuilder<ParseObject> pointerQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    pointerQueryBuilder.whereContainedIn('typeArray', ['a', '3']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));

    queryBuilder.whereMatchesQuery('typePointerGenre', pointerQueryBuilder);
    queryBuilder.includeObject(['typePointerGenre']);
    var apiResponse = await queryBuilder.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereMatchesQuery ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereMatchesQuery ---');
  }

  /// o inverto do whereMatchesQuery
  void queryBuilderWhereDoesNotMatchQuery() async {
    log('+++ queryBuilderWhereDoesNotMatchQuery +++');
    var list = <AuthorModel>[];
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '3']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));

    queryBuilder.whereDoesNotMatchQuery('typePointerGenre', otherQueryBuilder);
    queryBuilder.includeObject(['typePointerGenre']);
    var apiResponse = await queryBuilder.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereDoesNotMatchQuery ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereDoesNotMatchQuery ---');
  }

  /// Envolver quaisquer duas colunas
  /// Lembre-se que a class Author tem uma coluna chamada typeNumber
  /// Lembre-se que a class Genre também tem uma coluna chamada typeNumber
  /// Então filtramos com qualquer condição desejada os objectIds em Genre.
  /// Este é meu otherQueryBuilder
  /// Agora eu desejo os objetos de Author em que a coluna typeNumber seja igual
  /// em valor a coluna typeNumber de Genre de acordo com o filtro feito em Genre.
  void queryBuilderWhereMatchesKeyInQuery() async {
    log('+++ queryBuilderWhereMatchesKeyInQuery +++');
    var list = <AuthorModel>[];
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '3']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));

    queryBuilder.whereMatchesKeyInQuery(
        'typeNumber', 'typeNumber', otherQueryBuilder);
    var apiResponse = await queryBuilder.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereMatchesKeyInQuery ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereMatchesKeyInQuery ---');
  }

  /// O inverso de whereMatchesKeyInQuery
  void queryBuilderWhereDoesNotMatchKeyInQuery() async {
    log('+++ queryBuilderWhereDoesNotMatchKeyInQuery +++');
    var list = <AuthorModel>[];
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '3']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));

    queryBuilder.whereDoesNotMatchKeyInQuery(
        'typeNumber', 'typeNumber', otherQueryBuilder);
    var apiResponse = await queryBuilder.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(AuthorEntity().toModel(element));
      }
    }
    log('... queryBuilderWhereDoesNotMatchKeyInQuery ...');
    for (var item in list) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereDoesNotMatchKeyInQuery ---');
  }
}
