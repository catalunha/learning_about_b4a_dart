import 'package:learning_about_b4a_dart/app/data/b4a/tables/book/book_repository.dart';
import 'package:learning_about_b4a_dart/app/presentation/book/book_search.dart';

void bookPage() {
  // // Book
  BookRepository bookRepository = BookRepository();
  // bookRepository.addAll();
  bookRepository.addRelations();
  bookRepository.removeRelations();
  // bookRepository.addPointer();
  // bookRepository.add();
  // bookRepository.update();
  // bookRepository.unset('I9npZLFtqI', 'typeString');
  // bookRepository.delete('I9npZLFtqI');
  // bookRepository.removeAll();
  BookSearch bookSearch = BookSearch();
  bookSearch.queryBuilderIncludeObject(
      ['typePointerPublisher', 'typePointerPublisher.typePointerShape']);
  bookSearch.queryBuilderWhereEqualToRelation('Author', 'VUDROrC3iK');
  bookSearch.queryBuilderWhereMatchesQuery();
  bookSearch.queryBuilderWhereDoesNotMatchQuery();
}
