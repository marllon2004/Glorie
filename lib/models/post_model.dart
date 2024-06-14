class PostModel {
  final int? userId;
  final int? id;
  final image;
  final String title;
  final String popularised;
  final String stars;
  final String body;
  final String tips;
  final String releaseDate;

  PostModel(this.userId, this.id, this.image, this.title, this.popularised, this.stars, this.body, this.tips, this.releaseDate);

  factory PostModel.fromJson(Map json) {
    return PostModel(json['userId'], json['id'], json['image'], json['title'], json['popularised'], json['stars'], json['body'], json['tips'], json['releaseDate']);
  }

  @override
  String toString() {
    return 'id: $id';
  }
}