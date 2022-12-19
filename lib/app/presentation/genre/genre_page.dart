import 'dart:developer';

import 'package:learning_about_b4a_dart/app/presentation/genre/genre_search.dart';

void genrePage() async {
  // Genre repo
  // GenreRepository genreRepository = GenreRepository();
  // genreRepository.addAll();
  // genreRepository.add();
  // genreRepository.update();
  // genreRepository.unset('3xILA8Wjyp', 'typeString');
  // genreRepository.delete('iBX9aQtUTv');
  // genreRepository.removeAll();
  // genreRepository.typeNumberIncrement('3xILA8Wjyp', 2.0);
  // genreRepository.typeNumberDecrement('3xILA8Wjyp', 3.0);
  // genreRepository.typeArraySetAdd('3xILA8Wjyp', 'd');
  // genreRepository.typeArraySetAddUnique('3xILA8Wjyp', 'd');
  // genreRepository.typeArraySetAddAll('3xILA8Wjyp', ['e', 'f']);
  // genreRepository.typeArraySetAddAllUnique('3xILA8Wjyp', ['e', 'f']);
  // genreRepository.typeArraySetRemove('3PplSH1UZd', 'a');
  // genreRepository.typeArraySetRemoveAll('3PplSH1UZd', ['aa', 'd', 'g']);
  // Genre View
  GenreSearch genreSearch = GenreSearch();
  var dataList = <String>[];
  // dataList = await genreSearch.getObject('3xILA8Wjyp');
  dataList = await genreSearch.getAll();
  // dataList = await genreSearch.queryBuilderCount();
  // dataList = await genreSearch.queryBuilder();
  // dataList = await genreSearch.queryBuilderOrderByAscending('typeString');
  // dataList = await genreSearch.queryBuilderOrderByDescending('typeString');
  // dataList = await genreSearch.queryBuilderExcludeKeys(['typeString']);
  // dataList = await genreSearch.queryBuilderKeysToReturn(['typeString']);
  // dataList = await genreSearch.queryBuilderPagination(1, 2);
  // dataList = await genreSearch.queryBuilderPagination(2, 2);
  // dataList = await genreSearch.queryBuilderWhereEqualToSimpleColumn(
  //     'typeBoolean', false);
  // dataList = await genreSearch.queryBuilderWhereEqualToSimpleColumn(
  //     'typeString', 'Genre01');
  // dataList =
  //     await genreSearch.queryBuilderWhereEqualToSimpleColumn('typeNumber', 3);
  // dataList = await genreSearch.queryBuilderWhereEqualToSimpleColumn(
  //     'typeDate', DateTime(2022, 11, 26, 10));
  // dataList = await genreSearch.queryBuilderWhereNotEqualToSimpleColumn(
  //     'typeBoolean', true);
  // dataList = await genreSearch.queryBuilderWhereNotEqualToSimpleColumn(
  //     'typeString', 'Genre02');
  // dataList = await genreSearch.queryBuilderWhereNotEqualToSimpleColumn(
  //     'typeNumber', 3);
  // dataList = await genreSearch.queryBuilderWhereEqualToSimpleColumn(
  //     'typeDateTime', DateTime(2022, 12, 02, 16, 42, 36));
  // dataList =
  //     await genreSearch.queryBuilderWhereGreaterThan('typeBoolean', false);
  // dataList =
  //     await genreSearch.queryBuilderWhereGreaterThan('typeString', 'Genre02');
  // dataList = await genreSearch.queryBuilderWhereGreaterThan('typeNumber', 3);
  // dataList = await genreSearch.queryBuilderWhereGreaterThan(
  //     'typeDate', DateTime(2022, 11, 25, 10));
  // dataList = await genreSearch.queryBuilderWhereGreaterThanOrEqualsTo(
  //     'typeBoolean', true);
  // dataList = await genreSearch.queryBuilderWhereGreaterThanOrEqualsTo(
  //     'typeString', 'Genre02');
  // dataList = await genreSearch.queryBuilderWhereGreaterThanOrEqualsTo(
  //     'typeNumber', 3);
  // dataList = await genreSearch.queryBuilderWhereGreaterThanOrEqualsTo(
  //     'typeDate', DateTime(2022, 11, 25, 10));
  // dataList = await genreSearch.queryBuilderWhereLessThan('typeBoolean', true);
  // dataList =
  //     await genreSearch.queryBuilderWhereLessThan('typeString', 'Genre02');
  // dataList = await genreSearch.queryBuilderWhereLessThan('typeNumber', 3);
  // dataList = await genreSearch.queryBuilderWhereLessThan(
  //     'typeDate', DateTime(2022, 11, 25, 10));
  // dataList = await genreSearch.queryBuilderWhereLessThanOrEqualTo(
  //     'typeBoolean', true);
  // dataList = await genreSearch.queryBuilderWhereLessThanOrEqualTo(
  //     'typeString', 'Genre02');
  // dataList =
  //     await genreSearch.queryBuilderWhereLessThanOrEqualTo('typeNumber', 3);
  // dataList = await genreSearch.queryBuilderWhereLessThanOrEqualTo(
  //     'typeDate', DateTime(2022, 11, 25, 10));
  // dataList =
  //     await genreSearch.queryBuilderWhereValueExists('typeString', false);
  // dataList = await genreSearch.queryBuilderWhereStartsWith('typeString', 'g');
  // dataList = await genreSearch.queryBuilderWhereEndsWith('typeString', '2');
  // dataList = await genreSearch.queryBuilderWhereContains('typeString', '0');
  // dataList =
  //     await genreSearch.queryBuilderWhereContainedIn('typeArray', ['a', '3']);
  // dataList = await genreSearch
  //     .queryBuilderWhereArrayContainsAll('typeArray', ['a', '1']);
  // dataList = await genreSearch.queryBuilderOr();
  // dataList = await genreSearch.queryBuilderCustom();

  // dataList = await genreSearch.queryBuilderCount();
  for (var item in dataList) {
    log('${item.toString()}\n');
  }
}
