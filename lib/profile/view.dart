import 'dart:developer';

import 'package:learning_about_b4a_dart/core/models/profile_model.dart';
import 'package:learning_about_b4a_dart/profile/controller.dart';

class ProfileView {
  Future<void> count() async {
    log('+++ count +++');
    ProfileController profileController = ProfileController();
    var result = await profileController.count();
    log('... count ...');
    log(result.toString());
    log('--- count ---');
  }

  Future<void> getWithRelations() async {
    log('+++ getWithRelations +++');
    ProfileController profileController = ProfileController();
    ProfileModel? profileModel = await profileController.getWithRelations();
    log('... getWithRelations ...');
    if (profileModel == null) {
      log('null');
    } else {
      log(profileModel.toString());
    }
    log('--- getWithRelations ---');
  }

  Future<void> getWithoutRelations() async {
    log('+++ getWithoutRelations +++');
    ProfileController profileController = ProfileController();
    ProfileModel? profileModel = await profileController.getWithoutRelations();
    log('... getWithoutRelations ...');
    if (profileModel == null) {
      log('null');
    } else {
      log(profileModel.toString());
    }
    log('--- getWithoutRelations ---');
  }

  Future<void> getAllWithRelations() async {
    log('+++ getAllWithRelations +++');
    ProfileController profileController = ProfileController();
    List<ProfileModel> result = await profileController.getAllWithRelations();
    log('... getAllWithRelations ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- getAllWithRelations ---');
  }

  Future<void> getAllWithoutRelations() async {
    log('+++ getAllWithoutRelations +++');
    ProfileController profileController = ProfileController();
    List<ProfileModel> result =
        await profileController.getAllWithoutRelations();
    log('... getAllWithoutRelations ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- getAllWithoutRelations ---');
  }

  Future<void> queryWithRelations() async {
    log('+++ queryWithRelations +++');
    ProfileController profileController = ProfileController();
    List<ProfileModel> result = await profileController.queryWithRelations();
    log('... queryWithRelations ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryWithRelations ---');
  }

  Future<void> queryWithoutRelations() async {
    log('+++ queryWithoutRelations +++');
    ProfileController profileController = ProfileController();
    List<ProfileModel> result = await profileController.queryWithoutRelations();
    log('... queryWithoutRelations ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryWithoutRelations ---');
  }

  Future<void> queryOrderByAscending() async {
    log('+++ queryOrderByAscending +++');
    ProfileController profileController = ProfileController();
    List<ProfileModel> result = await profileController.queryOrderByAscending();
    log('... queryOrderByAscending ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryOrderByAscending ---');
  }

  Future<void> queryOrderByDescending() async {
    log('+++ queryOrderByDescending +++');
    ProfileController profileController = ProfileController();
    List<ProfileModel> result =
        await profileController.queryOrderByDescending();
    log('... queryOrderByDescending ...');
    for (var item in result) {
      log('${item.toString()}\n');
    }
    log('--- queryOrderByDescending ---');
  }
}
