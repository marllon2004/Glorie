import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glorie_lores/controllers/home_controller.dart';
import 'package:glorie_lores/models/post_model.dart';
import 'package:glorie_lores/repositories/home_repository_imp.dart';
import 'package:glorie_lores/services/prefs_service.dart';
import 'package:glorie_lores/widgets/gradient_background.dart';
import 'package:glorie_lores/widgets/star_rating.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Games'),
          actions: [
            IconButton(
              onPressed: () {
                PrefsService.logout();
                Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => true);
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TextField(
                onChanged: _controller.onChanged,
                decoration: InputDecoration(
                  hintText: 'Digite o nome do jogo...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ValueListenableBuilder<List<PostModel>>(
                  valueListenable: _controller.posts,
                  builder: (_, list, __) {
                    if (list.isEmpty) {
                      return Center(child: Text('Nenhum jogo encontrado :('));
                    }
                    return ListView.separated(
                      itemCount: list.length,
                      itemBuilder: (_, idx) => GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                          '/details',
                          arguments: list[idx],
                        ),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: Image.asset(
                                  list[idx].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[idx].title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20, // Ajuste o tamanho do texto para economizar espaço
                                          fontWeight: FontWeight.bold,
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Spacer(),
                                      Text(
                                        'Popularidade: ' + list[idx].popularised,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      const SizedBox(height: 10),
                                      StarRating(
                                        rating: double.parse(list[idx].stars) / 2, // Converte para a escala de 5 estrelas
                                        starCount: 5, // número de estrelas ajustado para a escala 0-5
                                        size: 16, // Ajuste o tamanho das estrelas para economizar espaço
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_forward, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (_, __) => SizedBox(height: 20), // Espaçamento entre os itens
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
