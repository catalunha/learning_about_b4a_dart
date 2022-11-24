import 'dart:io';

import 'package:parse_server_sdk/parse_server_sdk.dart';

class ConnectB4A {
  Future<void> initialize() async {
    String appId = 'x4uHx8hJECtAPiKo4Z2f8IK9OUKRtcuUBBaUBHM9';
    String clientKey = 'GoHjfXQ1fIClRQ6K9Gg9hc1dpKj90HJGRXcHeSrs';
    String keyParseServerUrl = 'https://parseapi.back4app.com';
    await Parse().initialize(
      appId,
      keyParseServerUrl,
      clientKey: clientKey,
      autoSendSessionId: true,
      debug: true,
    );
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
