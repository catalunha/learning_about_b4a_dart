import 'package:learning_about_b4a_dart/app/core/models/author_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/author_entity.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AuthorController {
  /// Constroi a consulta incluindo todos os atributos da class ligada pelo ponteiro.
  /// Se não colocar [includeObject] o response traz apenas o objectId do objeto ligado pelo ponteiro
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

  /// Constroi a consulta onde todos os objetos são iguais ao objectId do ponteiro informado.
  /// E o mesmo que um whereEqualTo('typeString',"a") mas aplicado a um ponteiro.
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

  /// Envolve apenas uma coluna typePointer e sua query
  /// Lembre-se que a class Author tem um ponteiro, typePointerGenre, para uma class Genre
  /// Então filtramos com qualquer condição desejada os objectIds em Genre.
  /// Este é meu pointerQueryBuilder
  /// Agora eu desejo filtrar minha class Author pelo atributo typePointer
  /// onde o valor deste seja igual a qualquer um dos objectIds encontrados no filtro de Genre
  /// que esta em pointerQueryBuilder
  Future<List<AuthorModel>> queryBuilderWhereMatchesQuery() async {
    QueryBuilder<ParseObject> pointerQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    pointerQueryBuilder.whereContainedIn('typeArray', ['a', '3']);

    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(AuthorEntity.className));

    queryBuilder.whereMatchesQuery('typePointer', pointerQueryBuilder);
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

  /// o inverto do whereMatchesQuery
  Future<List<AuthorModel>> queryBuilderWhereDoesNotMatchQuery() async {
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '3']);

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

  /// Envolver quaisquer duas colunas
  /// Lembre-se que a class Author tem uma coluna chamada typeNumber
  /// Lembre-se que a class Genre também tem uma coluna chamada typeNumber
  /// Então filtramos com qualquer condição desejada os objectIds em Genre.
  /// Este é meu otherQueryBuilder
  /// Agora eu desejo os objetos de Author em que a coluna typeNumber seja igual
  /// em valor a coluna typeNumber de Genre de acordo com o filtro feito em Genre.
  Future<List<AuthorModel>> queryBuilderWhereMatchesKeyInQuery() async {
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '3']);

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

  /// O inverso de whereMatchesKeyInQuery
  Future<List<AuthorModel>> queryBuilderWhereDoesNotMatchKeyInQuery() async {
    QueryBuilder<ParseObject> otherQueryBuilder =
        QueryBuilder<ParseObject>(ParseObject(GenreEntity.className));
    otherQueryBuilder.whereContainedIn('typeArray', ['a', '3']);

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
