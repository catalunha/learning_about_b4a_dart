import 'dart:developer';

import 'package:learning_about_b4a_dart/core/models/author_model.dart';
import 'package:learning_about_b4a_dart/presentation/author/author_controller.dart';

class AuthorView {
  Future<void> count() async {
    log('+++ count +++');
    AuthorController profileController = AuthorController();
    var result = await profileController.count();
    log('... count ...');
    log(result.toString());
    log('--- count ---');
  }

  Future<void> get(String objectId) async {
    log('+++ get +++');
    AuthorController profileController = AuthorController();
    AuthorModel? profileModel = await profileController.get(objectId);
    log('... get ...');
    if (profileModel == null) {
      log('null');
    } else {
      log(profileModel.toString());
    }
    log('--- get ---');
  }

  Future<void> getAll() async {
    log('+++ getAll +++');
    AuthorController profileController = AuthorController();
    List<AuthorModel> result = await profileController.getAll();
    log('... getAll ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- getAll ---');
  }

  Future<void> queryBuilder() async {
    log('+++ queryBuilder +++');
    AuthorController profileController = AuthorController();
    List<AuthorModel> result = await profileController.queryBuilder();
    log('... queryBuilder ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilder ---');
  }

  Future<void> queryBuilderOrderByAscending(String columnName) async {
    log('+++ queryBuilderOrderByAscending +++');
    AuthorController profileController = AuthorController();
    List<AuthorModel> result =
        await profileController.queryBuilderOrderByAscending(columnName);
    log('... queryBuilderOrderByAscending ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderOrderByAscending ---');
  }

  Future<void> queryBuilderOrderByDescending(String columnName) async {
    log('+++ queryBuilderOrderByDescending +++');
    AuthorController profileController = AuthorController();
    List<AuthorModel> result =
        await profileController.queryBuilderOrderByDescending(columnName);
    log('... queryBuilderOrderByDescending ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderOrderByDescending ---');
  }

  Future<void> queryBuilderExcludeKeys(List<String> columnsName) async {
    log('+++ queryBuilderExcludeKeys +++');
    AuthorController profileController = AuthorController();
    List<AuthorModel> result =
        await profileController.queryBuilderExcludeKeys(columnsName);
    log('... queryBuilderExcludeKeys ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderExcludeKeys ---');
  }

  Future<void> queryBuilderKeysToReturn(List<String> columnsName) async {
    log('+++ queryBuilderKeysToReturn +++');
    AuthorController profileController = AuthorController();
    List<AuthorModel> result =
        await profileController.queryBuilderKeysToReturn(columnsName);
    log('... queryBuilderKeysToReturn ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderKeysToReturn ---');
  }

  Future<void> queryBuilderPagination(int page, int limit) async {
    log('+++ queryBuilderPagination +++');
    AuthorController profileController = AuthorController();
    List<AuthorModel> result =
        await profileController.queryBuilderPagination(page, limit);
    log('... queryBuilderPagination ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderPagination ---');
  }
}
