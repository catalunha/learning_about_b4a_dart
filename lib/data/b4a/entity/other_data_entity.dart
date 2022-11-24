import 'package:learning_about_b4a_dart/core/models/other_data.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class OtherDataEntity {
  static const String className = 'OtherData';

  OtherDataModel fromParse(ParseObject parseObject) {
    OtherDataModel expertiseModel = OtherDataModel(
      objectId: parseObject.objectId!,
      typeString: parseObject.get('typeString') ?? '',
    );
    return expertiseModel;
  }
}
