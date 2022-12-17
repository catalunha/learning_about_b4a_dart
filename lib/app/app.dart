import 'package:learning_about_b4a_dart/app/data/b4a/connect_b4a.dart';

void app() async {
  ConnectB4A connectB4A = ConnectB4A();
  await connectB4A.initialize();
  // await connectB4A.initialize(debug: true);

  // genrePage();
  // authorPage();
  // shapePage();
  // publisherPage();
  // bookPage();
}
