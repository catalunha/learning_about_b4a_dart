import 'dart:developer';

import 'package:learning_about_b4a_dart/core/models/genre_model.dart';
import 'package:learning_about_b4a_dart/presentation/genre/genre_controller.dart';

class GenreView {
  void get(String objectId) async {
    log('+++ get +++');
    GenreController genreController = GenreController();
    GenreModel? profileModel = await genreController.get(objectId);
    log('... get ...');
    if (profileModel == null) {
      log('null');
    } else {
      log(profileModel.toString());
    }
    log('--- get ---');
  }

  void getAll() async {
    log('+++ getAll +++');
    GenreController genreController = GenreController();
    List<GenreModel> result = await genreController.getAll();
    log('... getAll ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- getAll ---');
  }

  void unset(String objectId, List<String> columnsName) async {
    log('+++ unset +++');
    GenreController genreController = GenreController();
    for (var column in columnsName) {
      await genreController.unset(objectId, column);
    }
    log('... unset ...');
    log('always true\n');
    log('--- unset ---');
  }

  void count() async {
    log('+++ count +++');
    GenreController genreController = GenreController();
    var result = await genreController.count();
    log('... count ...');
    log(result.toString());
    log('--- count ---');
  }

  void queryBuilder() async {
    log('+++ queryBuilder +++');
    GenreController genreController = GenreController();
    List<GenreModel> result = await genreController.queryBuilder();
    log('... queryBuilder ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilder ---');
  }

  void queryBuilderOrderByAscending(String columnName) async {
    log('+++ queryBuilderOrderByAscending +++');
    GenreController genreController = GenreController();
    List<GenreModel> result =
        await genreController.queryBuilderOrderByAscending(columnName);
    log('... queryBuilderOrderByAscending ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderOrderByAscending ---');
  }

  void queryBuilderOrderByDescending(String columnName) async {
    log('+++ queryBuilderOrderByDescending +++');
    GenreController genreController = GenreController();
    List<GenreModel> result =
        await genreController.queryBuilderOrderByDescending(columnName);
    log('... queryBuilderOrderByDescending ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderOrderByDescending ---');
  }

  void queryBuilderExcludeKeys(List<String> columnsName) async {
    log('+++ queryBuilderExcludeKeys +++');
    GenreController genreController = GenreController();
    List<GenreModel> result =
        await genreController.queryBuilderExcludeKeys(columnsName);
    log('... queryBuilderExcludeKeys ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderExcludeKeys ---');
  }

  void queryBuilderKeysToReturn(List<String> columnsName) async {
    log('+++ queryBuilderKeysToReturn +++');
    GenreController genreController = GenreController();
    List<GenreModel> result =
        await genreController.queryBuilderKeysToReturn(columnsName);
    log('... queryBuilderKeysToReturn ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderKeysToReturn ---');
  }

  void queryBuilderPagination(int page, int limit) async {
    log('+++ queryBuilderPagination +++');
    GenreController genreController = GenreController();
    List<GenreModel> result =
        await genreController.queryBuilderPagination(page, limit);
    log('... queryBuilderPagination ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderPagination ---');
  }

  void queryBuilderWhereEqualToSimpleColumn(
      String columnName, dynamic value) async {
    log('+++ queryBuilderWhereEqualToSimpleColumn +++');
    GenreController genreController = GenreController();
    List<GenreModel> result = await genreController
        .queryBuilderWhereEqualToSimpleColumn(columnName, value);
    log('... queryBuilderWhereEqualToSimpleColumn ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereEqualToSimpleColumn ---');
  }

  void queryBuilderWhereNotEqualToSimpleColumn(
      String columnName, dynamic value) async {
    log('+++ queryBuilderWhereNotEqualToSimpleColumn +++');
    GenreController genreController = GenreController();
    List<GenreModel> result = await genreController
        .queryBuilderWhereNotEqualToSimpleColumn(columnName, value);
    log('... queryBuilderWhereNotEqualToSimpleColumn ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereNotEqualToSimpleColumn ---');
  }

  void queryBuilderWhereGreaterThan(String columnName, dynamic value) async {
    log('+++ queryBuilderWhereGreaterThan +++');
    GenreController genreController = GenreController();
    List<GenreModel> result =
        await genreController.queryBuilderWhereGreaterThan(columnName, value);
    log('... queryBuilderWhereGreaterThan ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereGreaterThan ---');
  }

  void queryBuilderWhereGreaterThanOrEqualsTo(
      String columnName, dynamic value) async {
    log('+++ queryBuilderWhereGreaterThanOrEqualsTo +++');
    GenreController genreController = GenreController();
    List<GenreModel> result = await genreController
        .queryBuilderWhereGreaterThanOrEqualsTo(columnName, value);
    log('... queryBuilderWhereGreaterThanOrEqualsTo ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereGreaterThanOrEqualsTo ---');
  }

  void queryBuilderWhereLessThan(String columnName, dynamic value) async {
    log('+++ queryBuilderWhereLessThan +++');
    GenreController genreController = GenreController();
    List<GenreModel> result =
        await genreController.queryBuilderWhereLessThan(columnName, value);
    log('... queryBuilderWhereLessThan ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereLessThan ---');
  }

  void queryBuilderWhereLessThanOrEqualTo(
      String columnName, dynamic value) async {
    log('+++ queryBuilderWhereLessThanOrEqualTo +++');
    GenreController genreController = GenreController();
    List<GenreModel> result = await genreController
        .queryBuilderWhereLessThanOrEqualTo(columnName, value);
    log('... queryBuilderWhereLessThanOrEqualTo ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereLessThanOrEqualTo ---');
  }

  void queryBuilderWhereValueExists(
      String columnName, bool containValue) async {
    log('+++ queryBuilderWhereValueExists +++');
    GenreController genreController = GenreController();
    List<GenreModel> result = await genreController
        .queryBuilderWhereValueExists(columnName, containValue);
    log('... queryBuilderWhereValueExists ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereValueExists ---');
  }

  void queryBuilderWhereStartsWith(String columnName, String text) async {
    log('+++ queryBuilderWhereStartsWith +++');
    GenreController genreController = GenreController();
    List<GenreModel> result =
        await genreController.queryBuilderWhereStartsWith(columnName, text);
    log('... queryBuilderWhereStartsWith ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereStartsWith ---');
  }

  void queryBuilderWhereEndsWith(String columnName, String text) async {
    log('+++ queryBuilderWhereEndsWith +++');
    GenreController genreController = GenreController();
    List<GenreModel> result =
        await genreController.queryBuilderWhereEndsWith(columnName, text);
    log('... queryBuilderWhereEndsWith ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereEndsWith ---');
  }

  void queryBuilderWhereContains(String columnName, String text) async {
    log('+++ queryBuilderWhereContains +++');
    GenreController genreController = GenreController();
    List<GenreModel> result =
        await genreController.queryBuilderWhereContains(columnName, text);
    log('... queryBuilderWhereContains ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereContains ---');
  }

  void queryBuilderWhereContainedIn(
      String columnName, List<dynamic> values) async {
    log('+++ queryBuilderWhereContainedIn +++');
    GenreController genreController = GenreController();
    List<GenreModel> result =
        await genreController.queryBuilderWhereContainedIn(columnName, values);
    log('... queryBuilderWhereContainedIn ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereContainedIn ---');
  }

  void queryBuilderWhereArrayContainsAll(
      String columnName, List<dynamic> values) async {
    log('+++ queryBuilderWhereArrayContainsAll +++');
    GenreController genreController = GenreController();
    List<GenreModel> result = await genreController
        .queryBuilderWhereArrayContainsAll(columnName, values);
    log('... queryBuilderWhereArrayContainsAll ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereArrayContainsAll ---');
  }
}