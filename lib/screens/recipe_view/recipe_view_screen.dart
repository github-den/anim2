import 'package:duque_assignment6/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class RecipeViewScreen extends StatelessWidget {
  const RecipeViewScreen({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name,
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: recipe.imageUrl != null
                ? Image.network(
                    recipe.imageUrl!,
                    fit: BoxFit.cover,
                  )
                : Text('No available image'),
          ),
          Gap(16),
          DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Colors.blue,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.blue,
                    tabs: [
                      Tab(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.restaurant_menu),
                            SizedBox(
                              height: 2,
                            ),
                            Text('Ingredients')
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.directions),
                            SizedBox(
                              height: 2,
                            ),
                            Text('Steps'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    height: 400,
                    child: TabBarView(children: [
                      ListView.builder(
                        itemCount: recipe.ingredients.length,
                        itemBuilder: (_, index) {
                          return Card(
                            color: Color(0xFFFFFFFF),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 12,
                                ),
                                child: Text(recipe.ingredients[index])),
                          );
                        },
                      ),
                      ListView.builder(
                        padding: EdgeInsets.all(16),
                        itemCount: recipe.steps.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            leading: CircleAvatar(child: Text('${index + 1}')),
                            title: Text(recipe.steps[index]),
                          );
                        },
                      ),
                    ]),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
