import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final Color color;
  final double size;

  const StarRating({
    Key? key,
    required this.rating,
    this.starCount = 5,
    this.color = Colors.yellow,
    this.size = 20, // Ajuste o tamanho das estrelas aqui
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        IconData icon;
        if (index < rating.floor()) {
          icon = Icons.star;
        } else if (index < rating) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }
        return Icon(
          icon,
          color: color,
          size: size, // Define o tamanho das estrelas aqui
        );
      }),
    );
  }
}
