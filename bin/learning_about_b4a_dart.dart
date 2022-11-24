import 'dart:developer';
import 'dart:io';

import 'package:learning_about_b4a_dart/connect_b4a.dart';
import 'package:learning_about_b4a_dart/profile/add_data.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main(List<String> arguments) async {
  ConnectB4A connectB4A = ConnectB4A();
  await connectB4A.initialize();
  if (await connectB4A.healthCheck()) {
    log('Parse Server Connected', name: 'main');
  } else {
    log('Parse Server NOT Connected. Exiting...', name: 'main');
    exit(0);
  }
  // ProfileData.add();
  var count = await ProfileData.count();
  log('Count: $count', name: 'QueryBuilder....');
  log('get: ', name: 'QueryBuilder....');
  await ProfileData.get();
  log('getAll: ', name: 'QueryBuilder....');
  await ProfileData.getAll();

  // print('Hello world: ${learning_about_b4a_dart.calculate()}!');
}
