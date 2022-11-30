import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/book_model.dart';
import 'package:learning_about_b4a_dart/app/presentation/book/book_controller.dart';

class BookView {
  Future<void> queryBuilderIncludeObject(List<String> columnsName) async {
    log('+++ queryBuilderIncludeObject +++');
    BookController bookController = BookController();
    List<BookModel> result =
        await bookController.queryBuilderIncludeObject(columnsName);
    log('... queryBuilderIncludeObject ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderIncludeObject ---');
  }

  void queryBuilderWhereEqualToRelation(
      String relationClassName, String relationId) async {
    log('+++ queryBuilderWhereEqualToRelation +++');
    BookController bookController = BookController();
    List<BookModel> result = await bookController
        .queryBuilderWhereEqualToRelation(relationClassName, relationId);
    log('... queryBuilderWhereEqualToRelation ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereEqualToRelation ---');
  }

  void queryBuilderWhereMatchesQuery() async {
    log('+++ queryBuilderWhereMatchesQuery +++');
    BookController bookController = BookController();
    List<BookModel> result =
        await bookController.queryBuilderWhereMatchesQuery();
    log('... queryBuilderWhereMatchesQuery ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereMatchesQuery ---');
  }

  void queryBuilderWhereDoesNotMatchQuery() async {
    log('+++ queryBuilderWhereDoesNotMatchQuery +++');
    BookController bookController = BookController();
    List<BookModel> result =
        await bookController.queryBuilderWhereDoesNotMatchQuery();
    log('... queryBuilderWhereDoesNotMatchQuery ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryBuilderWhereDoesNotMatchQuery ---');
  }
}
