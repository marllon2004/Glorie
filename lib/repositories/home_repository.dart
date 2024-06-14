import 'package:glorie_lores/models/post_model.dart';

abstract class HomeRepository {

  Future<List<PostModel>> getList();
}