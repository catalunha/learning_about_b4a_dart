import 'dart:io';

import 'data/b4a/connect_b4a.dart';

void app() async {
  final isInitialized = await initB4A();
  if (!isInitialized) {
    print('B4A not conected...');
    exit(0);
  } else {
    print('B4A conected...');
  }
  // genrePage();
  // authorPage();
  // shapePage();
  // publisherPage();
  // bookPage();
}
