import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ConnectB4A {
  String _appId = '1';
  String _clientKey = '1';

  getCredentials() {
    var env = DotEnv()..load();
    _appId = env['appId'] ?? _appId;
    _clientKey = env['clientKey'] ?? _clientKey;
  }

  Future<void> initialize() async {
    getCredentials();
    String keyParseServerUrl = 'https://parseapi.back4app.com';
    await Parse().initialize(
      _appId,
      keyParseServerUrl,
      clientKey: _clientKey,
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
