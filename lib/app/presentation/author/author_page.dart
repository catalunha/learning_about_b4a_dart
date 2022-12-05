import 'package:learning_about_b4a_dart/app/data/b4a/tables/author/author_repository.dart';
import 'package:learning_about_b4a_dart/app/presentation/author/author_search.dart';

void authorPage() {
  // // Author
  AuthorRepository authorRepository = AuthorRepository();
  authorRepository.addAll();
  // authorRepository.addPointer();
  // authorRepository.add();
  // authorRepository.update();
  // authorRepository.unset('I9npZLFtqI', 'typeString');
  // authorRepository.delete('I9npZLFtqI');
  // authorRepository.removeAll();
  AuthorSearch authorSearch = AuthorSearch();
  // authorSearch.queryBuilderIncludeObject(['typePointerGenre']);
  // authorSearch.queryBuilderWhereEqualToPointer(
  //     'typePointerGenre', 'Genre', 'mrsMiyXeuP');
  // authorSearch.queryBuilderWhereMatchesQuery();
  // authorSearch.queryBuilderWhereDoesNotMatchQuery();
  // authorSearch.queryBuilderWhereMatchesKeyInQuery();
  // authorSearch.queryBuilderWhereDoesNotMatchKeyInQuery();
}
