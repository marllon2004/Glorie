import 'package:flutter/cupertino.dart';
import 'package:glorie_lores/repositories/home_repository.dart';
import '../models/post_model.dart';

class HomeController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository) {
    fetch();
  }

  ValueNotifier<List<PostModel>> posts = ValueNotifier([]);
  List<PostModel> _allPosts = [];

  onChanged(String value) {
    filterPosts(value);
  }

  fetch() async {
    _allPosts = await _homeRepository.getList();
    posts.value = _allPosts;
  }

  void filterPosts(String query) {
    if (query.isEmpty) {
      posts.value = _allPosts;
    } else {
      posts.value = _allPosts.where((post) {
        return post.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}
