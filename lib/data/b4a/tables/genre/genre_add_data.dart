import 'package:learning_about_b4a_dart/core/models/genre_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GenreAddData {
  static add() async {
    removeAll();
    var genreModelList = <GenreModel>[];
    genreModelList.addAll([
      GenreModel(
        typeString: 'Genre01',
        typeBoolean: true,
        typeNumber: 1,
        typeDate: DateTime.now(),
        typeObject: {"key1": "value1"},
        typeArray: ['a', '1'],
      ),
      GenreModel(
        typeString: 'Genre02',
        typeBoolean: false,
        typeNumber: 2,
        typeDate: DateTime.now().add(Duration(hours: 1)),
        typeObject: {"key2": "value2"},
        typeArray: ['b', '2'],
      ),
      GenreModel(
        typeString: 'Genre03',
        typeBoolean: true,
        typeNumber: 3,
        typeDate: DateTime.now().add(Duration(hours: 2)),
        typeObject: {"key3": "value3"},
        typeArray: ['c', '3'],
      ),
      GenreModel(
        typeString: 'Genre04',
        typeBoolean: false,
        typeNumber: 4,
        typeDate: DateTime.now().add(Duration(hours: 23)),
        typeObject: {"key4": "value4"},
        typeArray: ['d', '4'],
      ),
    ]);
    for (var genreModel in genreModelList) {
      ParseObject genreParseObject = GenreEntity().toParse(genreModel);
      await genreParseObject.save();
    }
  }

  static removeAll() async {
    final apiResponse = await ParseObject(GenreEntity.className).getAll();

    if (apiResponse.success && apiResponse.results != null) {
      for (ParseObject element in apiResponse.results!) {
        element.delete();
      }
    }
  }
}
