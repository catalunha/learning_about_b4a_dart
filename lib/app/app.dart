import 'package:learning_about_b4a_dart/app/data/b4a/connect_b4a.dart';
import 'package:learning_about_b4a_dart/app/presentation/shape/shape_page.dart';

void app() async {
  ConnectB4A connectB4A = ConnectB4A();
  await connectB4A.initialize();

  // genrePage();
  // authorPage();
  shapePage();
  // publisherPage();
  // bookPage();
}
