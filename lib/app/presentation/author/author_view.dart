import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/author_model.dart';
import 'package:learning_about_b4a_dart/app/presentation/author/author_controller.dart';

class AuthorView {
  AuthorView() {
    log('... AuthorView ...');
  }
  Future<void> queryBuilderIncludeObject(List<String> columnsName) async {
    log('+++ queryBuilderIncludeObject +++');
    AuthorController authorController = AuthorController();
    List<AuthorModel> result =
        await authorController.queryBuilderIncludeObject(columnsName);
    log('... queryBuilderIncludeObject ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderIncludeObject ---');
  }

  void queryBuilderWhereEqualToPointer(
      String columnName, String pointerClassName, String pointerId) async {
    log('+++ queryBuilderWhereEqualToPointer +++');
    AuthorController authorController = AuthorController();
    List<AuthorModel> result =
        await authorController.queryBuilderWhereEqualToPointer(
            columnName, pointerClassName, pointerId);
    log('... queryBuilderWhereEqualToPointer ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereEqualToPointer ---');
  }

  void queryBuilderWhereMatchesQuery() async {
    log('+++ queryBuilderWhereMatchesQuery +++');
    AuthorController authorController = AuthorController();
    List<AuthorModel> result =
        await authorController.queryBuilderWhereMatchesQuery();
    log('... queryBuilderWhereMatchesQuery ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereMatchesQuery ---');
  }

  void queryBuilderWhereDoesNotMatchQuery() async {
    log('+++ queryBuilderWhereDoesNotMatchQuery +++');
    AuthorController authorController = AuthorController();
    List<AuthorModel> result =
        await authorController.queryBuilderWhereDoesNotMatchQuery();
    log('... queryBuilderWhereDoesNotMatchQuery ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereDoesNotMatchQuery ---');
  }

  void queryBuilderWhereMatchesKeyInQuery() async {
    log('+++ queryBuilderWhereMatchesKeyInQuery +++');
    AuthorController authorController = AuthorController();
    List<AuthorModel> result =
        await authorController.queryBuilderWhereMatchesKeyInQuery();
    log('... queryBuilderWhereMatchesKeyInQuery ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereMatchesKeyInQuery ---');
  }

  void queryBuilderWhereDoesNotMatchKeyInQuery() async {
    log('+++ queryBuilderWhereDoesNotMatchKeyInQuery +++');
    AuthorController authorController = AuthorController();
    List<AuthorModel> result =
        await authorController.queryBuilderWhereDoesNotMatchKeyInQuery();
    log('... queryBuilderWhereDoesNotMatchKeyInQuery ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereDoesNotMatchKeyInQuery ---');
  }
}
