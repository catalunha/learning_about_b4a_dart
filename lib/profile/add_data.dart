import 'package:parse_server_sdk/parse_server_sdk.dart';

class ProfileData {
  static add() async {
    var profile = ParseObject('Profile')
      ..set('typeString', 'String01')
      ..set('typeBoolean', true)
      ..set('typeNumber', 1)
      ..set('typeDate', DateTime.now())
      ..set('typeObject', {"key1": "value1"})
      ..set('typeArray', ['a', '1']);
    await profile.save();
    var profile2 = ParseObject('Profile')
      ..set('typeString', 'String02')
      ..set('typeBoolean', false)
      ..set('typeNumber', 2)
      ..set('typeDate', DateTime.now())
      ..set('typeObject', {"key2": "value2"})
      ..set('typeArray', ['b', '2']);
    await profile2.save();
  }

  static Future<int> count() async {
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Profile'));
    var apiResponse = await queryBuilder.count();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.count;
    }
    return 0;
  }

  static Future<void> get() async {
    final apiResponse = await ParseObject('Profile').getObject('0zswR3nQg7');

    if (apiResponse.success && apiResponse.results != null) {
      for (var o in apiResponse.results!) {
        final object = o as ParseObject;
        // print('${object.objectId} - ${object.get<String>("typeString")}');
        printObject(object);
      }
    } else {
      print('${apiResponse.success}');
      print('${apiResponse.count}');
      print('${apiResponse.error}');
      print('${apiResponse.statusCode}');
    }
  }

  static Future<void> printObject(ParseObject object) async {
    print('+++');
    print('${object.objectId}');
    print('${object.get<String>("typeString")}');
    print('${object.get<bool>("typeBoolean")}');
    print('${object.get("typeNumber")}');
    print('${object.get<DateTime>("typeDate")}');
    print('${object.get<Map<String, dynamic>>("typeObject")}');
    print('${object.get<List>("typeArray")}');
    print('${object.get("typePointer")}');
    print('${object.get("typeRelation")}');
    print('---');
    // print('+++');
    // print('${object.objectId}');
    // print('${object.get("typeString")}');
    // print('${object.get("typeBoolean")}');
    // print('${object.get("typeNumber")}');
    // print('${object.get("typeDate")}');
    // print('${object.get("typeObject")}');
    // print('${object.get("typeArray")}');
    // print('${object.get("typePointer")}');
    // print('${object.get("typeRelation")}');
    // print('---');
  }

  static Future<void> getAll() async {
    final apiResponse = await ParseObject('Profile').getAll();

    if (apiResponse.success && apiResponse.results != null) {
      for (var o in apiResponse.results!) {
        final object = o as ParseObject;
        printObject(object);
      }
    } else {
      print('${apiResponse.success}');
      print('${apiResponse.count}');
      print('${apiResponse.error}');
      print('${apiResponse.statusCode}');
    }
  }
}
