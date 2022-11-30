import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/shape_model.dart';
import 'package:learning_about_b4a_dart/app/presentation/shape/shape_controller.dart';

class ShapeView {
  void getObject(String objectId) async {
    log('+++ getObject +++');
    ShapeController genreController = ShapeController();
    ShapeModel? genreModel = await genreController.getObject(objectId);
    log('... getObject ...');
    if (genreModel == null) {
      log('null');
    } else {
      log(genreModel.toString());
    }
    log('--- getObject ---');
  }
}
