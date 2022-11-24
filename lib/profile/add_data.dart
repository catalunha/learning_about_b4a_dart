import 'package:learning_about_b4a_dart/core/models/profile_model.dart';
import 'package:learning_about_b4a_dart/data/b4a/entity/profile_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ProfileAddData {
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
}
