import 'dart:developer';

import 'package:learning_about_b4a_dart/app/core/models/publisher_model.dart';
import 'package:learning_about_b4a_dart/app/data/b4a/entity/publisher_entity.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class PublisherSearch {
  PublisherSearch() {
    log('=== PublisherView ===');
  }

  /// Retorna todos os objetos da class
  Future<List<String>> getAll() async {
    log('+++ getAll +++');
    var list = <PublisherModel>[];
    final parseResponse = await ParseObject(PublisherEntity.className).getAll();

    if (parseResponse.success && parseResponse.results != null) {
      for (var element in parseResponse.results!) {
        list.add(PublisherEntity().toModel(element));
      }
    }
    log('--- getAll ---');
    return list.map((e) => e.toString()).toList();
  }
}
