import 'package:learning_about_b4a_dart/core/models/book_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/book_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class BookAddData {
  static add() async {
    removeAll();
    var authorModelList = <BookModel>[];
    authorModelList.addAll([
      BookModel(
        typeString: 'Book01',
        typeBoolean: true,
        typeNumber: 1,
        typeDate: DateTime.now(),
        typeObject: {"key1": "value1"},
        typeArray: ['a', '1'],
      ),
      BookModel(
        typeString: 'Book02',
        typeBoolean: false,
        typeNumber: 2,
        typeDate: DateTime(2022, 11, 26, 12).add(Duration(hours: 1)),
        typeObject: {"key2": "value2"},
        typeArray: ['b', '2'],
      ),
      BookModel(
        typeString: 'Book03',
        typeBoolean: true,
        typeNumber: 3,
        typeDate: DateTime.now().add(Duration(hours: 2)),
        typeObject: {"key3": "value3"},
        typeArray: ['c', '3'],
      ),
      BookModel(
        typeString: 'Book04',
        typeBoolean: false,
        typeNumber: 4,
        typeDate: DateTime.now().add(Duration(hours: 23)),
        typeObject: {"key4": "value4"},
        typeArray: ['d', '4'],
      ),
    ]);
    for (var authorModel in authorModelList) {
      ParseObject authorParseObject = BookEntity().toParse(authorModel);
      await authorParseObject.save();
    }
  }

  static removeAll() async {
    final apiResponse = await ParseObject(BookEntity.className).getAll();

    if (apiResponse.success && apiResponse.results != null) {
      for (ParseObject element in apiResponse.results!) {
        await element.delete();
      }
    }
  }
}
