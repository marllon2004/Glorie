import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:glorie_lores/models/post_model.dart';
import 'package:glorie_lores/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    try {
      String response = await rootBundle.loadString('assets/data.json');
      var decodedResponse = jsonDecode(response) as List;
      return decodedResponse.map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      print('Erro ao carregar dados da API local: $e');
    }
    return [];
  }
}
