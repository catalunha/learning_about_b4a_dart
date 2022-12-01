import 'package:learning_about_b4a_dart/app/data/b4a/connect_b4a.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/tables/genre/genre_repository.dart';
import 'package:learning_about_b4a_dart/app/presentation/author/author_page.dart';
import 'package:learning_about_b4a_dart/app/presentation/book/book_page.dart';
import 'package:learning_about_b4a_dart/app/presentation/genre/genre_page.dart';
import 'package:learning_about_b4a_dart/app/presentation/publisher/publisher_page.dart';
import 'package:learning_about_b4a_dart/app/presentation/shape/shape_page.dart';

void app() async {
  ConnectB4A connectB4A = ConnectB4A();
  await connectB4A.initialize();
  // await connectB4A.initialize(debug: true);

  genre_page();
  author_page();
  shape_page();
  publisher_page();
  book_page();
}
