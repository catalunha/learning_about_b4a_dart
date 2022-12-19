import 'dart:developer';

import 'package:learning_about_b4a_dart/app/data/b4a/tables/publisher/publisher_repository.dart';
import 'package:learning_about_b4a_dart/app/presentation/publisher/publisher_search.dart';

void publisherPage() async {
  // // Publisher
  PublisherRepository publisherRepository = PublisherRepository();
  publisherRepository.addAll();
  // publisherRepository.addPointer();
  // publisherRepository.add();
  // publisherRepository.update();
  // publisherRepository.unset('I9npZLFtqI', 'typeString');
  // publisherRepository.delete('I9npZLFtqI');
  // publisherRepository.removeAll();
  PublisherSearch publisherSearch = PublisherSearch();
  var dataList = <String>[];

  dataList = await publisherSearch.getAll();
  for (var item in dataList) {
    log('${item.toString()}\n');
  }
}
