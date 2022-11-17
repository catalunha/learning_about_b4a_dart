import 'dart:developer';

import 'package:learning_about_b4a_dart/connect_b4a.dart';
import 'package:learning_about_b4a_dart/learning_about_b4a_dart.dart'
    as learning_about_b4a_dart;
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main(List<String> arguments) async {
  ConnectB4A connectB4A = ConnectB4A();
  await connectB4A.initialize();
  if (await connectB4A.healthCheck()) {
    log('Parse Server Connected', name: 'main');
    var profile = ParseObject('Profile')
      ..set('typeString', 'String01')
      ..set('typeBoolean', true)
      ..set('typeNumber', 1)
      ..set('typeDate', DateTime.now())
      ..set('typeObject', {"key1": "value1"})
      ..set('typeArray', ['a', 'b']);
    await profile.save();
  } else {
    log('Parse Server NOT Connected', name: 'main');
  }

  print('Hello world: ${learning_about_b4a_dart.calculate()}!');
}
