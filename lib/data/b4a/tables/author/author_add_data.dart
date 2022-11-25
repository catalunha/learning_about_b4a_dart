import 'package:learning_about_b4a_dart/core/models/author_model.dart';
import 'package:learning_about_b4a_dart/core/models/genre_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/author_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AuthorAddData {
  static add() async {
    removeAll();
    var authorModelList = <AuthorModel>[];
    authorModelList.addAll([
      AuthorModel(
        typeString: 'Author01',
        typeBoolean: true,
        typeNumber: 1,
        typeDate: DateTime.now(),
        typeObject: {"key1": "value1"},
        typeArray: ['a', '1'],
        typePointer: GenreModel(objectId: 'kyCtliyFaK'),
      ),
      AuthorModel(
        typeString: 'Author02',
        typeBoolean: false,
        typeNumber: 2,
        typeDate: DateTime.now().add(Duration(hours: 1)),
        typeObject: {"key2": "value2"},
        typeArray: ['b', '2'],
        typePointer: GenreModel(objectId: 'mrsMiyXeuP'),
      ),
      AuthorModel(
        typeString: 'Author03',
        typeBoolean: true,
        typeNumber: 3,
        typeDate: DateTime.now().add(Duration(hours: 2)),
        typeObject: {"key3": "value3"},
        typeArray: ['c', '3'],
        typePointer: GenreModel(objectId: 'w7n72uFBv2'),
      ),
      AuthorModel(
        typeString: 'Author04',
        typeBoolean: false,
        typeNumber: 4,
        typeDate: DateTime.now().add(Duration(hours: 23)),
        typeObject: {"key4": "value4"},
        typeArray: ['d', '4'],
        typePointer: GenreModel(objectId: 'bxirK4sWKU'),
      ),
    ]);
    for (var authorModel in authorModelList) {
      ParseObject authorParseObject = AuthorEntity().toParse(authorModel);
      await authorParseObject.save();
    }
  }

  static removeAll() async {
    final apiResponse = await ParseObject(AuthorEntity.className).getAll();

    if (apiResponse.success && apiResponse.results != null) {
      for (ParseObject element in apiResponse.results!) {
        element.delete();
      }
    }
  }
}
