import 'dart:developer';

import 'package:learning_about_b4a_dart/core/models/publisher_model.dart';
import 'package:learning_about_b4a_dart/presentation/publisher/publisher_controller.dart';

class PublisherView {
  void getObject(String objectId) async {
    log('+++ getObject +++');
    PublisherController genreController = PublisherController();
    PublisherModel? genreModel = await genreController.getObject(objectId);
    log('... getObject ...');
    if (genreModel == null) {
      log('null');
    } else {
      log(genreModel.toString());
    }
    log('--- getObject ---');
  }
}
