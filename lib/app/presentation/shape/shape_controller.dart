import 'package:learning_about_b4a_dart/app/core/models/shape_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/shape_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ShapeController {
  Future<ShapeModel?> getObject(String objectId) async {
    final parseResponse =
        await ParseObject(ShapeEntity.className).getObject(objectId);
    ShapeModel? genreModel;

    if (parseResponse.success && parseResponse.results != null) {
      genreModel = ShapeEntity().toModel(parseResponse.results!.first);
    }
    return genreModel;
  }
}
