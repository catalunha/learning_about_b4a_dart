import 'dart:developer';
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

  Future<void> initialize({bool debug = false}) async {
    getCredentials();
    String keyParseServerUrl = 'https://parseapi.back4app.com';
    await Parse().initialize(
      _appId,
      keyParseServerUrl,
      clientKey: _clientKey,
      autoSendSessionId: true,
      debug: debug,
    );
    await healthCheck();
  }

  Future<void> healthCheck() async {
    if ((await Parse().healthCheck()).success) {
      log('Back4app Connected.');
    } else {
      log('Back4app NOT Connected.');
      exit(0);
    }
  }
}
