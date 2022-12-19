import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/shape_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/shape_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ShapeSearch {
  ShapeSearch() {
    log('=== ShapeSearch ===');
  }

  /// Retorna todos os objetos da class
  Future<List<String>> getAll() async {
    log('+++ getAll +++');
    var list = <ShapeModel>[];
    final parseResponse = await ParseObject(ShapeEntity.className).getAll();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(ShapeEntity().toModel(element));
      }
    }

    log('--- getAll ---');
    return list.map((e) => e.toString()).toList();
  }
}
