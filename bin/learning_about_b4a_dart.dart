import 'dart:io';

import 'package:learning_about_b4a_dart/app/data/b4a/connect_b4a.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/tables/author/author_repository.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/tables/book/book_repository.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/tables/genre/genre_repository.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/tables/publisher/publisher_repository.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/tables/shape/shape_repository.dart';
import 'package:learning_about_b4a_dart/app/presentation/genre/genre_view.dart';
import 'package:learning_about_b4a_dart/app/presentation/publisher/publisher_view.dart';
import 'package:learning_about_b4a_dart/app/presentation/shape/shape_view.dart';

void main(List<String> arguments) async {
  joinPartsInReadme();
  // app();
}

void joinPartsInReadme() {
  String pathREADME = 'README.md';
  var fileREADME = File(pathREADME).openWrite(mode: FileMode.write);
  List<String> parts = ['introducao', 'apresentacao', 'tabelas'];
  for (var part in parts) {
    String pathPart = 'readmes/$part.md';
    var dataPart = File(pathPart).readAsStringSync();
    fileREADME.writeln(dataPart);
    fileREADME.writeln('---');
    fileREADME.writeln('---');
  }
  fileREADME.close();
}

app() async {
  ConnectB4A connectB4A = ConnectB4A();
  // await connectB4A.initialize();
  await connectB4A.initialize(debug: true);

  // Genre
  GenreRepository genreRepository = GenreRepository();
  genreRepository.addAll();
  genreRepository.add();
  genreRepository.update();
  genreRepository.unset('I9npZLFtqI', 'typeString');
  genreRepository.delete('I9npZLFtqI');
  genreRepository.removeAll();
  GenreView genreView = GenreView();
  // genreView.count();
  genreView.getObject('mrsMiyXeuP');
  // genreView.getAll();
  // genreView.queryBuilder();
  // genreView.queryBuilderOrderByAscending('typeString');
  // genreView.queryBuilderOrderByDescending('typeString');
  // genreView.queryBuilderExcludeKeys(['typeString']);
  // genreView.queryBuilderKeysToReturn(['typeString']);
  // genreView.queryBuilderPagination(1, 2);
  // genreView.queryBuilderPagination(2, 2);
  // genreView.queryBuilderWhereEqualToSimpleColumn('typeBoolean', false);
  // genreView.queryBuilderWhereEqualToSimpleColumn('typeString', 'Genre01');
  // genreView.queryBuilderWhereEqualToSimpleColumn('typeNumber', 3);
  // genreView.queryBuilderWhereEqualToSimpleColumn(
  //     'typeDate', DateTime(2022, 11, 26, 10));
  // genreView.queryBuilderWhereNotEqualToSimpleColumn('typeBoolean', true);
  // genreView.queryBuilderWhereNotEqualToSimpleColumn('typeString', 'Genre02');
  // genreView.queryBuilderWhereNotEqualToSimpleColumn('typeNumber', 3);
  // genreView.queryBuilderWhereNotEqualToSimpleColumn(
  //     'typeDate', DateTime(2022, 11, 26, 10));
  // genreView.queryBuilderWhereGreaterThan('typeBoolean', false);
  // genreView.queryBuilderWhereGreaterThan('typeString', 'Genre02');
  // genreView.queryBuilderWhereGreaterThan('typeNumber', 3);
  // genreView.queryBuilderWhereGreaterThan(
  //     'typeDate', DateTime(2022, 11, 25, 10));
  // genreView.queryBuilderWhereGreaterThanOrEqualsTo('typeBoolean', true);
  // genreView.queryBuilderWhereGreaterThanOrEqualsTo('typeString', 'Genre02');
  // genreView.queryBuilderWhereGreaterThanOrEqualsTo('typeNumber', 3);
  // genreView.queryBuilderWhereGreaterThanOrEqualsTo(
  //     'typeDate', DateTime(2022, 11, 25, 10));
  // genreView.queryBuilderWhereLessThan('typeBoolean', true);
  // genreView.queryBuilderWhereLessThan('typeString', 'Genre02');
  // genreView.queryBuilderWhereLessThan('typeNumber', 3);
  // genreView.queryBuilderWhereLessThan('typeDate', DateTime(2022, 11, 25, 10));
  // genreView.queryBuilderWhereLessThanOrEqualTo('typeBoolean', true);
  // genreView.queryBuilderWhereLessThanOrEqualTo('typeString', 'Genre02');
  // genreView.queryBuilderWhereLessThanOrEqualTo('typeNumber', 3);
  // genreView.queryBuilderWhereLessThanOrEqualTo(
  //     'typeDate', DateTime(2022, 11, 25, 10));
  // genreView.queryBuilderWhereValueExists('typeString', false);
  // genreView.queryBuilderWhereStartsWith('typeString', 'g');
  // genreView.queryBuilderWhereEndsWith('typeString', '2');
  // genreView.queryBuilderWhereContains('typeString', '0');
  // genreView.queryBuilderWhereContainedIn('typeArray', ['a', '4']);
  // genreView.queryBuilderWhereArrayContainsAll('typeArray', ['a', '1']);
  // genreView.queryBuilderOr();

  // Author
  AuthorRepository authorRepository = AuthorRepository();
  authorRepository.addAll();
  authorRepository.addPointer();
  authorRepository.add();
  authorRepository.update();
  authorRepository.unset('I9npZLFtqI', 'typeString');
  authorRepository.delete('I9npZLFtqI');
  authorRepository.removeAll();
  // AuthorView authorView = AuthorView();
  // authorView.queryBuilderIncludeObject(['typePointerGenre']);
  // authorView.queryBuilderWhereEqualToPointer(
  //     'typePointer', 'Genre', 'mrsMiyXeuP');
  // authorView.queryBuilderWhereMatchesQuery();
  // authorView.queryBuilderWhereDoesNotMatchQuery();
  // authorView.queryBuilderWhereMatchesKeyInQuery();
  // authorView.queryBuilderWhereDoesNotMatchKeyInQuery();

  // Shape
  ShapeRepository shapeRepository = ShapeRepository();
  shapeRepository.addAll();
  shapeRepository.addFile('readmes/files/uml.jpg', '5iLu1JOO9x');
  shapeRepository.add();
  shapeRepository.update();
  shapeRepository.unset('I9npZLFtqI', 'typeString');
  shapeRepository.delete('I9npZLFtqI');
  shapeRepository.removeAll();
  ShapeView shapeView = ShapeView();
  shapeView.getObject('5iLu1JOO9x');

  // Publisher
  PublisherRepository publisherRepository = PublisherRepository();
  publisherRepository.addAll();
  publisherRepository.addPointer();
  publisherRepository.add();
  publisherRepository.update();
  publisherRepository.unset('I9npZLFtqI', 'typeString');
  publisherRepository.delete('I9npZLFtqI');
  publisherRepository.removeAll();
  PublisherView publisherView = PublisherView();
  publisherView.getObject('5iLu1JOO9x');

  // Book
  BookRepository bookRepository = BookRepository();
  bookRepository.addAll();
  bookRepository.addPointer();
  bookRepository.addRelations();
  bookRepository.add();
  bookRepository.update();
  bookRepository.unset('I9npZLFtqI', 'typeString');
  bookRepository.delete('I9npZLFtqI');
  bookRepository.removeAll();
  // BookView bookView = BookView();
  // bookView.queryBuilderIncludeObject(
  //     ['typePointerPublisher', 'typePointerPublisher.typePointerGenre']);
  // bookView.queryBuilderWhereEqualToRelation('Author', 'VUDROrC3iK');
  // bookView.queryBuilderWhereMatchesQuery();
  // bookView.queryBuilderWhereDoesNotMatchQuery();
}
