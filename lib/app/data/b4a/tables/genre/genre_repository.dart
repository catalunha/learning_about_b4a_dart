import 'package:learning_about_b4a_dart/app/core/models/genre_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/genre_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class GenreRepository {
  addAll() async {
    removeAll();
    var genreModelList = <GenreModel>[];
    genreModelList.addAll([
      GenreModel(
        typeString: 'Genre01',
        typeBoolean: true,
        typeNumber: 1,
        typeDate: DateTime.now(),
        typeArray: ['a', '1'],
      ),
      GenreModel(
        typeString: 'Genre02',
        typeBoolean: false,
        typeNumber: 2,
        typeDate: DateTime.now().add(Duration(hours: 1)),
        typeArray: ['b', '2'],
      ),
      GenreModel(
        typeString: 'Genre03',
        typeBoolean: true,
        typeNumber: 3,
        typeDate: DateTime.now().add(Duration(hours: 2)),
        typeArray: ['c', '3'],
      ),
      GenreModel(
        typeString: 'Genre04',
        typeBoolean: false,
        typeNumber: 4,
        typeDate: DateTime.now().add(Duration(hours: 3)),
        typeArray: ['d', '4'],
      ),
    ]);
    for (var genreModel in genreModelList) {
      ParseObject genreParseObject = GenreEntity().toParse(genreModel);
      await genreParseObject.save();
    }
  }

  add() async {
    var genreModel = GenreModel(
      typeString: 'Genre01',
      typeBoolean: true,
      typeNumber: 1,
      typeDate: DateTime.now(),
      typeArray: ['a', '1'],
    );
    ParseObject genreParseObject = GenreEntity().toParse(genreModel);
    await genreParseObject.save();
  }

  update() async {
    var genreModel = GenreModel(
      objectId: 'kyCtliyFaK',
      typeString: 'Genre01',
      typeBoolean: true,
      typeNumber: 1,
      // typeDate: DateTime.now(),
      typeDate: DateTime(2022, 12, 1, 0, 0, 0),
      typeArray: ['a', '1'],
    );
    ParseObject genreParseObject = GenreEntity().toParse(genreModel);
    await genreParseObject.save();
  }

  unset(String objectId, String columnName) async {
    final parseObject = ParseObject(GenreEntity.className);
    parseObject.objectId = objectId;
    await parseObject.unset(columnName);
    // É sempre parseResponse.success=true
    // mesmo que coluna ja esteja undefined, ou
    // nome da coluna esteja errado.
    // print('parseResponse.count: ${parseResponse.count}');
    // print('parseResponse.error: ${parseResponse.error}');
    // print('parseResponse.results: ${parseResponse.results}');
    // print('parseResponse.statusCode: ${parseResponse.statusCode}');
    // print('parseResponse.success: ${parseResponse.success}');
  }

  delete(String objectId) async {
    final parseObject = ParseObject(GenreEntity.className);
    parseObject.objectId = objectId;
    await parseObject.delete();
  }

  removeAll() async {
    final apiResponse = await ParseObject(GenreEntity.className).getAll();

    if (apiResponse.success && apiResponse.results != null) {
      for (ParseObject element in apiResponse.results!) {
        await element.delete();
      }
    }
  }
}
