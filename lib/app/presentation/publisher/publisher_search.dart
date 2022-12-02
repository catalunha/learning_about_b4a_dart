import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/publisher_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/publisher_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class PublisherSearch {
  PublisherSearch() {
    log('=== PublisherView ===');
  }
  void getObject(String objectId) async {
    log('+++ getObject +++');
    PublisherModel? genreModel;
    final parseResponse =
        await ParseObject(PublisherEntity.className).getObject(objectId);

    if (parseResponse.success && parseResponse.results != null) {
      genreModel = PublisherEntity().toModel(parseResponse.results!.first);
    }
    log('... getObject ...');
    if (genreModel == null) {
      log('null');
    } else {
      log(genreModel.toString());
    }
    log('--- getObject ---');
  }
}
