import 'package:learning_about_b4a_dart/app/core/models/publisher_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/publisher_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class PublisherController {
  Future<PublisherModel?> getObject(String objectId) async {
    final parseResponse =
        await ParseObject(PublisherEntity.className).getObject(objectId);
    PublisherModel? genreModel;

    if (parseResponse.success && parseResponse.results != null) {
      genreModel = PublisherEntity().toModel(parseResponse.results!.first);
    }
    return genreModel;
  }
}
