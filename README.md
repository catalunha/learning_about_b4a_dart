# learning_about_b4a_dart
Um pequeno projeto para aprender um pouco mais sobre b4a com puro dart.



# ConnectB4A

```dart
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ConnectB4A {
  ConnectB4A() {
    // init();
  }

  Future<void> initialize() async {
    String keyApplicationId = '1';
    String keyClientKey = '1';
    String keyParseServerUrl = 'https://parseapi.back4app.com';
    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
      debug: true,
    );
    // return (await Parse().healthCheck()).success;
  }

  Future<bool> healthCheck() async {
    return (await Parse().healthCheck()).success;
  }
}
```

