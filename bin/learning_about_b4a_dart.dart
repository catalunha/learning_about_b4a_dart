import 'package:learning_about_b4a_dart/data/b4a/connect_b4a.dart';
import 'package:learning_about_b4a_dart/presentation/author/author_view.dart';
import 'package:learning_about_b4a_dart/presentation/book/book_view.dart';
import 'package:learning_about_b4a_dart/presentation/genre/genre_view.dart';

void main(List<String> arguments) async {
  ConnectB4A connectB4A = ConnectB4A();
  await connectB4A.initialize();
  // await connectB4A.initialize(debug: true);

// Genre
  // GenreAddData.add();
  GenreView genreView = GenreView();
  genreView.count();
  genreView.get('I9npZLFtqI');
  genreView.unset('I9npZLFtqI', ['typeString']);
  genreView.getAll();
  genreView.queryBuilder();
  genreView.queryBuilderOrderByAscending('typeString');
  genreView.queryBuilderOrderByDescending('typeString');
  genreView.queryBuilderExcludeKeys(['typeString']);
  genreView.queryBuilderKeysToReturn(['typeString']);
  genreView.queryBuilderPagination(1, 2);
  genreView.queryBuilderPagination(2, 2);
  genreView.queryBuilderWhereEqualToSimpleColumn('typeBoolean', false);
  genreView.queryBuilderWhereEqualToSimpleColumn('typeString', 'Genre01');
  genreView.queryBuilderWhereEqualToSimpleColumn('typeNumber', 3);
  genreView.queryBuilderWhereEqualToSimpleColumn(
      'typeDate', DateTime(2022, 11, 26, 10));
  genreView.queryBuilderWhereNotEqualToSimpleColumn('typeBoolean', true);
  genreView.queryBuilderWhereNotEqualToSimpleColumn('typeString', 'Genre02');
  genreView.queryBuilderWhereNotEqualToSimpleColumn('typeNumber', 3);
  genreView.queryBuilderWhereNotEqualToSimpleColumn(
      'typeDate', DateTime(2022, 11, 26, 10));
  genreView.queryBuilderWhereGreaterThan('typeBoolean', false);
  genreView.queryBuilderWhereGreaterThan('typeString', 'Genre02');
  genreView.queryBuilderWhereGreaterThan('typeNumber', 3);
  genreView.queryBuilderWhereGreaterThan(
      'typeDate', DateTime(2022, 11, 25, 10));
  genreView.queryBuilderWhereGreaterThanOrEqualsTo('typeBoolean', true);
  genreView.queryBuilderWhereGreaterThanOrEqualsTo('typeString', 'Genre02');
  genreView.queryBuilderWhereGreaterThanOrEqualsTo('typeNumber', 3);
  genreView.queryBuilderWhereGreaterThanOrEqualsTo(
      'typeDate', DateTime(2022, 11, 25, 10));
  genreView.queryBuilderWhereLessThan('typeBoolean', true);
  genreView.queryBuilderWhereLessThan('typeString', 'Genre02');
  genreView.queryBuilderWhereLessThan('typeNumber', 3);
  genreView.queryBuilderWhereLessThan('typeDate', DateTime(2022, 11, 25, 10));
  genreView.queryBuilderWhereLessThanOrEqualTo('typeBoolean', true);
  genreView.queryBuilderWhereLessThanOrEqualTo('typeString', 'Genre02');
  genreView.queryBuilderWhereLessThanOrEqualTo('typeNumber', 3);
  genreView.queryBuilderWhereLessThanOrEqualTo(
      'typeDate', DateTime(2022, 11, 25, 10));
  genreView.queryBuilderWhereValueExists('typeString', false);
  genreView.queryBuilderWhereStartsWith('typeString', 'g');
  genreView.queryBuilderWhereEndsWith('typeString', '2');
  genreView.queryBuilderWhereContains('typeString', '0');
  genreView.queryBuilderWhereContainedIn('typeArray', ['a', '4']);
  genreView.queryBuilderWhereArrayContainsAll('typeArray', ['a', '1']);
  genreView.queryBuilderOr();

  // Author
  // AuthorAddData.add();
  AuthorView authorView = AuthorView();
  authorView.queryBuilderIncludeObject(['typePointerGenre']);
  authorView.queryBuilderWhereEqualToPointer(
      'typePointer', 'Genre', 'mrsMiyXeuP');
  authorView.queryBuilderWhereMatchesQuery();
  authorView.queryBuilderWhereDoesNotMatchQuery();
  authorView.queryBuilderWhereMatchesKeyInQuery();
  authorView.queryBuilderWhereDoesNotMatchKeyInQuery();

  // Publisher
  // PublisherAddData.add();

  // Book
  // BookAddData.add();
  BookView bookView = BookView();
  bookView.queryBuilderIncludeObject(
      ['typePointerPublisher', 'typePointerPublisher.typePointerGenre']);
  bookView.queryBuilderWhereEqualToRelation('Author', 'VUDROrC3iK');
  bookView.queryBuilderWhereMatchesQuery();
  bookView.queryBuilderWhereDoesNotMatchQuery();
}
