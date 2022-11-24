import 'package:learning_about_b4a_dart/core/models/profile_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/profile_entity.dart';
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

  Future<ProfileModel?> getWithRelations() async {
    final apiResponse = await ParseObject('Profile').getObject('0zswR3nQg7');
    ProfileModel? profileModel;

    if (apiResponse.success && apiResponse.results != null) {
      profileModel = await ProfileEntity().toModel(apiResponse.results!.first);
    }
    return profileModel;
  }

  Future<ProfileModel?> getWithoutRelations() async {
    final apiResponse = await ParseObject('Profile').getObject('0zswR3nQg7');
    ProfileModel? profileModel;

    if (apiResponse.success && apiResponse.results != null) {
      profileModel = await ProfileEntity()
          .toModel(apiResponse.results!.first, includeColumns: []);
    }
    return profileModel;
  }

  Future<List<ProfileModel>> getAllWithRelations() async {
    final apiResponse = await ParseObject('Profile').getAll();
    var list = <ProfileModel>[];

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<ProfileModel>> getAllWithoutRelations() async {
    final apiResponse = await ParseObject('Profile').getAll();
    var list = <ProfileModel>[];

    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element, includeColumns: []));
      }
    }
    return list;
  }

  Future<List<ProfileModel>> queryWithRelations() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    var apiResponse = await queryBuilder.query();

    var list = <ProfileModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<ProfileModel>> queryWithoutRelations() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    var apiResponse = await queryBuilder.query();

    var list = <ProfileModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element, includeColumns: []));
      }
    }
    return list;
  }

  Future<List<ProfileModel>> queryWithPointer() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    queryBuilder.includeObject(['typePointer']);

    var apiResponse = await queryBuilder.query();

    var list = <ProfileModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element));
      }
    }
    return list;
  }

  Future<List<ProfileModel>> queryOrderByDescending() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    queryBuilder.orderByDescending('typeString');
    var apiResponse = await queryBuilder.query();

    var list = <ProfileModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element, includeColumns: []));
      }
    }
    return list;
  }

  Future<List<ProfileModel>> queryOrderByAscending() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    queryBuilder.orderByAscending('typeString');
    var apiResponse = await queryBuilder.query();

    var list = <ProfileModel>[];
    if (apiResponse.success && apiResponse.results != null) {
      for (var element in apiResponse.results!) {
        list.add(await ProfileEntity().toModel(element, includeColumns: []));
      }
    }
    return list;
  }
}
