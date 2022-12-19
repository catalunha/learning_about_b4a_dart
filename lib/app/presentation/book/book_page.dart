import 'dart:developer';

import 'package:learning_about_b4a_dart/app/data/b4a/tables/book/book_repository.dart';
import 'package:learning_about_b4a_dart/app/presentation/book/book_search.dart';

void bookPage() async {
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
  var dataList = <String>[];
  dataList = await bookSearch.getAll();

  // dataList = await bookSearch.queryBuilderIncludeObject(
  // ['typePointerPublisher', 'typePointerPublisher.typePointerShape'])
  // dataList =
  //     await bookSearch.queryBuilderWhereEqualToRelation('Author', 'VUDROrC3iK');
  // dataList = await bookSearch.queryBuilderWhereMatchesQuery();
  // dataList = await bookSearch.queryBuilderWhereDoesNotMatchQuery();
  for (var item in dataList) {
    log('${item.toString()}\n');
  }
}
