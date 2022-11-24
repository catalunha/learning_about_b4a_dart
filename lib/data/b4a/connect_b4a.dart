import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ConnectB4A {
  Future<void> initialize() async {
    var env = DotEnv()..load();
    String appId = env['appId']!;
    String clientKey = env['clientKey']!;
    // String appId = '1';
    // String clientKey = '1';
    String keyParseServerUrl = 'https://parseapi.back4app.com';
    await Parse().initialize(
      appId,
      keyParseServerUrl,
      clientKey: clientKey,
      autoSendSessionId: true,
      debug: true,
    );
    await healthCheck();
  }

  Future<void> healthCheck() async {
    if ((await Parse().healthCheck()).success) {
      print('Back4app Connected.');
    } else {
      print('Back4app NOT Connected.');
      exit(0);
    }
  }
}
