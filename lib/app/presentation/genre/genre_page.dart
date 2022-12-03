import 'package:learning_about_b4a_dart/app/presentation/genre/genre_search.dart';

void genrePage() {
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
  // genreSearch.getObject('3xILA8Wjyp');
  // genreSearch.getAll();
  // genreSearch.count();
  // genreSearch.queryBuilder();
  // genreSearch.queryBuilderOrderByAscending('typeString');
  // genreSearch.queryBuilderOrderByDescending('typeString');
  // genreSearch.queryBuilderExcludeKeys(['typeString']);
  // genreSearch.queryBuilderKeysToReturn(['typeString']);
  // genreSearch.queryBuilderPagination(1, 2);
  // genreSearch.queryBuilderPagination(2, 2);
  genreSearch.queryBuilderWhereEqualToSimpleColumn('typeBoolean', false);
  genreSearch.queryBuilderWhereEqualToSimpleColumn('typeString', 'Genre01');
  genreSearch.queryBuilderWhereEqualToSimpleColumn('typeNumber', 3);
  genreSearch.queryBuilderWhereEqualToSimpleColumn(
      'typeDate', DateTime(2022, 11, 26, 10));
  genreSearch.queryBuilderWhereNotEqualToSimpleColumn('typeBoolean', true);
  genreSearch.queryBuilderWhereNotEqualToSimpleColumn('typeString', 'Genre02');
  genreSearch.queryBuilderWhereNotEqualToSimpleColumn('typeNumber', 3);
  genreSearch.queryBuilderWhereEqualToSimpleColumn(
      'typeDateTime', DateTime(2022, 12, 02, 16, 42, 36));
  genreSearch.queryBuilderWhereGreaterThan('typeBoolean', false);
  genreSearch.queryBuilderWhereGreaterThan('typeString', 'Genre02');
  genreSearch.queryBuilderWhereGreaterThan('typeNumber', 3);
  genreSearch.queryBuilderWhereGreaterThan(
      'typeDate', DateTime(2022, 11, 25, 10));
  genreSearch.queryBuilderWhereGreaterThanOrEqualsTo('typeBoolean', true);
  genreSearch.queryBuilderWhereGreaterThanOrEqualsTo('typeString', 'Genre02');
  genreSearch.queryBuilderWhereGreaterThanOrEqualsTo('typeNumber', 3);
  genreSearch.queryBuilderWhereGreaterThanOrEqualsTo(
      'typeDate', DateTime(2022, 11, 25, 10));
  genreSearch.queryBuilderWhereLessThan('typeBoolean', true);
  genreSearch.queryBuilderWhereLessThan('typeString', 'Genre02');
  genreSearch.queryBuilderWhereLessThan('typeNumber', 3);
  genreSearch.queryBuilderWhereLessThan('typeDate', DateTime(2022, 11, 25, 10));
  genreSearch.queryBuilderWhereLessThanOrEqualTo('typeBoolean', true);
  genreSearch.queryBuilderWhereLessThanOrEqualTo('typeString', 'Genre02');
  genreSearch.queryBuilderWhereLessThanOrEqualTo('typeNumber', 3);
  genreSearch.queryBuilderWhereLessThanOrEqualTo(
      'typeDate', DateTime(2022, 11, 25, 10));
  genreSearch.queryBuilderWhereValueExists('typeString', false);
  genreSearch.queryBuilderWhereStartsWith('typeString', 'g');
  genreSearch.queryBuilderWhereEndsWith('typeString', '2');
  genreSearch.queryBuilderWhereContains('typeString', '0');
  genreSearch.queryBuilderWhereContainedIn('typeArray', ['a', '3']);
  genreSearch.queryBuilderWhereArrayContainsAll('typeArray', ['a', '1']);
  genreSearch.queryBuilderOr();
}
