import 'package:learning_about_b4a_dart/data/b4a/connect_b4a.dart';
import 'package:learning_about_b4a_dart/presentation/author/author_view.dart';

void main(List<String> arguments) async {
  ConnectB4A connectB4A = ConnectB4A();
  await connectB4A.initialize();

// Genre
  // GenreAddData.add();
  // GenreView genreView = GenreView();
  // await genreView.count();
  // await genreView.get('I9npZLFtqI');
  // await genreView.getAll();
  // await genreView.queryBuilder();
  // await genreView.queryBuilderOrderByAscending('typeString');
  // await genreView.queryBuilderOrderByDescending('typeString');
  // await genreView.queryBuilderExcludeKeys(['typeString']);
  // await genreView.queryBuilderKeysToReturn(['typeString']);
  // await genreView.queryBuilderPagination(1, 2);
  // await genreView.queryBuilderPagination(2, 2);
  // Author
  // AuthorAddData.add();
  AuthorView authorView = AuthorView();
  // await authorView.count();
  await authorView.get('VUDROrC3iK');
  // await authorView.getAll();
  // await authorView.queryBuilder();
  // await authorView.queryBuilderOrderByAscending('typeString');
  // await authorView.queryBuilderOrderByDescending('typeString');
  // await authorView.queryBuilderExcludeKeys(['typeString']);
  // await authorView.queryBuilderKeysToReturn(['typeString']);
  // await authorView.queryBuilderPagination(1, 2);
  // await authorView.queryBuilderPagination(2, 2);
}
