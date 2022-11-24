# learning_about_b4a_dart
Um pequeno projeto para aprender um pouco mais sobre b4a com puro dart.


# run

dart bin/learning_about_b4a_dart.dart


# ConnectB4A
```dart
// lib/data/b4a/connect_b4a.dart
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

```

