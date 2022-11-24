import 'package:learning_about_b4a_dart/data/b4a/connect_b4a.dart';
import 'package:learning_about_b4a_dart/profile/view.dart';

void main(List<String> arguments) async {
  ConnectB4A connectB4A = ConnectB4A();
  await connectB4A.initialize();
  await connectB4A.healthCheck();

  // ProfileAddData.add();
  ProfileView profileView = ProfileView();
  // await profileView.count();
  // await profileView.getWithRelations();
  // await profileView.getWithoutRelations();
  // await profileView.getAllWithRelations();
  // await profileView.getAllWithoutRelations();
  // await profileView.queryWithRelations();
  await profileView.queryWithPointer();
  // await profileView.queryWithoutRelations();
  // await profileView.queryOrderByAscending();
  // await profileView.queryOrderByDescending();
}
