import 'package:parse_server_sdk/parse_server_sdk.dart';

void main(List<String> arguments) async {
  String appId = '1';
  String clientKey = '1';
  // String appId = 'x4uHx8hJECtAPiKo4Z2f8IK9OUKRtcuUBBaUBHM9';
  // String clientKey = 'GoHjfXQ1fIClRQ6K9Gg9hc1dpKj90HJGRXcHeSrs';

  String serverUrl = 'https://parseapi.back4app.com';
  var parse = await Parse().initialize(
    appId,
    serverUrl,
    clientKey: clientKey,
    debug: true,
  );
  print('parse.hasParseBeenInitialized(): ${parse.hasParseBeenInitialized()}');
  var response = await parse.healthCheck();
  if (response.success) {
    print('Bach4App: Connected');
  } else {
    print('Bach4App: Not Connected');
  }
}
// void main(List<String> arguments) async {
//   ConnectB4A connectB4A = ConnectB4A();
//   await connectB4A.initialize();
//   if (await connectB4A.healthCheck()) {
//     log('Parse Server Connected', name: 'main');
//   } else {
//     log('Parse Server NOT Connected. Exiting...', name: 'main');
//     exit(0);
//   }
//   // ProfileData.add();
//   var count = await ProfileData.count();
//   log('Count: $count', name: 'QueryBuilder....');
//   log('get: ', name: 'QueryBuilder....');
//   await ProfileData.get();
//   log('getAll: ', name: 'QueryBuilder....');
//   await ProfileData.getAll();

//   // print('Hello world: ${learning_about_b4a_dart.calculate()}!');
// }
