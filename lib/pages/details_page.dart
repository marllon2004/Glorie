import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glorie_lores/models/post_model.dart';
import 'package:glorie_lores/widgets/gradient_background.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PostModel args = ModalRoute.of(context)!.settings.arguments as PostModel;

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .55,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    args.image,
                  ),
                ),
                const SizedBox(height: 20),
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Lore'),
                    Tab(text: 'Dicas'),
                  ],
                  labelColor: Colors.black,
                  indicatorColor: Colors.pink,
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                args.body,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.title),
                                  Text(args.title),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                args.tips,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.title),
                                  Text(args.title),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
