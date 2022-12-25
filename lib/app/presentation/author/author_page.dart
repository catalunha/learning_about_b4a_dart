import 'dart:developer';

import 'package:learning_about_b4a_dart/app/presentation/author/author_search.dart';

void authorPage() async {
  // // Author
  // AuthorRepository authorRepository = AuthorRepository();
  // authorRepository.addAll();
  // authorRepository.addPointer();
  // authorRepository.add();
  // authorRepository.update();
  // authorRepository.unset('I9npZLFtqI', 'typeString');
  // authorRepository.delete('I9npZLFtqI');
  // authorRepository.removeAll();
  AuthorSearch authorSearch = AuthorSearch();
  var dataList = <String>[];
  // dataList = await authorSearch.getAll();
  dataList =
      await authorSearch.getObject(objectId: 'wumssuy5eQ', withPointer: true);

  // dataList = await authorSearch.queryBuilderIncludeObject(['typePointerGenre']);
  // dataList = await authorSearch.queryBuilderWhereEqualToPointer(
  //     'typePointerGenre', 'Genre', 'mrsMiyXeuP');
  // dataList = await authorSearch.queryBuilderWhereMatchesQuery();
  // dataList = await authorSearch.queryBuilderWhereDoesNotMatchQuery();
  // dataList = await authorSearch.queryBuilderWhereMatchesKeyInQuery();
  // dataList = await authorSearch.queryBuilderWhereDoesNotMatchKeyInQuery();
  for (var item in dataList) {
    log('${item.toString()}\n');
  }
}
