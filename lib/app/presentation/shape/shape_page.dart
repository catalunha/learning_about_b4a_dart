import 'dart:developer';

import 'package:learning_about_b4a_dart/app/data/b4a/tables/shape/shape_repository.dart';
import 'package:learning_about_b4a_dart/app/presentation/shape/shape_search.dart';

void shapePage() async {
  // // Shape
  ShapeRepository shapeRepository = ShapeRepository();
  shapeRepository.addAll();
  shapeRepository.addFile('readmes/files/uml.jpg', '5iLu1JOO9x');
  // shapeRepository.add();
  // shapeRepository.update();
  // shapeRepository.unset('I9npZLFtqI', 'typeString');
  // shapeRepository.delete('I9npZLFtqI');
  // shapeRepository.removeAll();
  ShapeSearch shapeSearch = ShapeSearch();
  var dataList = <String>[];
  // dataList = await shapeSearch.getObject('5iLu1JOO9x');
  dataList = await shapeSearch.getAll();
  for (var item in dataList) {
    log('${item.toString()}\n');
  }
}
