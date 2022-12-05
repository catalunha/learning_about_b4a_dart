import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/shape_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/shape_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ShapeSearch {
  ShapeSearch() {
    log('=== ShapeSearch ===');
  }
  void getObject(String objectId) async {
    log('+++ getObject +++');
    ShapeModel? shapeModel;
    final parseResponse =
        await ParseObject(ShapeEntity.className).getObject(objectId);

    if (parseResponse.success && parseResponse.results != null) {
      shapeModel = ShapeEntity().toModel(parseResponse.results!.first);
    }
    log('... getObject ...');
    if (shapeModel == null) {
      log('null');
    } else {
      log(shapeModel.toString());
    }
    log('--- getObject ---');
  }
}
