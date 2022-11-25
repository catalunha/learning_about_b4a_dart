import 'package:learning_about_b4a_dart/core/models/book_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/book_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ProfileController {
  Future<int> count() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    var apiResponse = await queryBuilder.count();
    int result = -1;
    if (apiResponse.success && apiResponse.results != null) {
      result = apiResponse.count;
    }

    return result;
  }

  Future<BookModel?> getWithRelations() async {
    final apiResponse = await ParseObject('Profile').getObject('0zswR3nQg7');
    BookModel? profileModel;

    if (apiResponse.success && apiResponse.results != null) {
      profileModel = await ProfileEntity().toModel(apiResponse.results!.first);
    }
    return profileModel;
  }

  Future<BookModel?> getWithoutRelations() async {
    final apiResponse = await ParseObject('Profile').getObject('0zswR3nQg7');
    BookModel? profileModel;

    if (apiResponse.success && apiResponse.results != null) {
      profileModel = await ProfileEntity()
          .toModel(apiResponse.results!.first, includeColumns: []);
    }
    return profileModel;
  }

  Future<List<BookModel>> getAllWithRelations() async {
    final apiResponse = await ParseObject('Profile').getAll();
    var list = <BookModel>[];

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<BookModel>> getAllWithoutRelations() async {
    final apiResponse = await ParseObject('Profile').getAll();
    var list = <BookModel>[];

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element, includeColumns: []));
      }
    }
    return list;
  }

  Future<List<BookModel>> queryWithRelations() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    var apiResponse = await queryBuilder.query();

    var list = <BookModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<BookModel>> queryWithoutRelations() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    var apiResponse = await queryBuilder.query();

    var list = <BookModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element, includeColumns: []));
      }
    }
    return list;
  }

  Future<List<BookModel>> queryWithPointer() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    queryBuilder.includeObject(['typePointer']);

    var apiResponse = await queryBuilder.query();

    var list = <BookModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<BookModel>> queryOrderByDescending() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    queryBuilder.orderByDescending('typeString');
    var apiResponse = await queryBuilder.query();

    var list = <BookModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element, includeColumns: []));
      }
    }
    return list;
  }

  Future<List<BookModel>> queryOrderByAscending() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    queryBuilder.orderByAscending('typeString');
    var apiResponse = await queryBuilder.query();

    var list = <BookModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element, includeColumns: []));
      }
    }
    return list;
  }
}
