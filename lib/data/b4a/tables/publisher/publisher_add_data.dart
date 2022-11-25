import 'package:learning_about_b4a_dart/core/models/genre_model.dart';
import 'package:learning_about_b4a_dart/core/models/publisher_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/publisher_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class PublisherAddData {
  static add() async {
    removeAll();
    var authorModelList = <PublisherModel>[];
    authorModelList.addAll([
      PublisherModel(
        typeString: 'Publisher01',
        typeBoolean: true,
        typeNumber: 1,
        typeDate: DateTime.now(),
        typeArray: ['a', '1'],
        typePointerGenre: GenreModel(objectId: 'kyCtliyFaK'),
      ),
      PublisherModel(
        typeString: 'Publisher02',
        typeBoolean: false,
        typeNumber: 2,
        typeDate: DateTime(2022, 11, 26, 12).add(Duration(hours: 1)),
        typeArray: ['b', '2'],
        typePointerGenre: GenreModel(objectId: 'mrsMiyXeuP'),
      ),
      PublisherModel(
        typeString: 'Publisher03',
        typeBoolean: true,
        typeNumber: 3,
        typeDate: DateTime.now().add(Duration(hours: 2)),
        typeArray: ['c', '3'],
        typePointerGenre: GenreModel(objectId: 'w7n72uFBv2'),
      ),
      PublisherModel(
        typeString: 'Publisher04',
        typeBoolean: false,
        typeNumber: 4,
        typeDate: DateTime.now().add(Duration(hours: 23)),
        typeArray: ['d', '4'],
        typePointerGenre: GenreModel(objectId: 'bxirK4sWKU'),
      ),
    ]);
    for (var authorModel in authorModelList) {
      ParseObject authorParseObject = PublisherEntity().toParse(authorModel);
      await authorParseObject.save();
    }
  }

  static removeAll() async {
    final apiResponse = await ParseObject(PublisherEntity.className).getAll();

    if (apiResponse.success && apiResponse.results != null) {
      for (ParseObject element in apiResponse.results!) {
        await element.delete();
      }
    }
  }
}
