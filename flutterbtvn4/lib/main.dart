import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:btvn4/Data/dummy_data.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MaterialApp(
    home: Categories(),
  ));
}

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 227, 152),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 0, 79),
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.count(crossAxisCount: 3,
        padding: const EdgeInsets.all(15),
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: List.generate(DUMMY_CATEGORIES.length, (index) {
          return Material (
            color: DUMMY_CATEGORIES[index].color,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: InkWell (
              onTap: () {
                Navigator.push( context,
                  MaterialPageRoute(builder: (context) => FoodList(index: index)));
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  DUMMY_CATEGORIES[index].title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class FoodList extends StatelessWidget {
  final int index;
  const FoodList({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    List<Meal> list = DUMMY_MEALS.where((element) 
    => element.categories.contains(DUMMY_CATEGORIES[index].id)).toList();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 227, 152),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor:const Color.fromARGB(255, 238, 0, 79),
        title: Text(
          DUMMY_CATEGORIES[index].title,
          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: list.length, 
        itemBuilder: (BuildContext context, index) => InkWell( 
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => FoodDetails
              (id: list.elementAt(index).id)
              )
            );
          },
          child: Flexible (
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.network(list.elementAt(index).imageUrl),
                      Container(
                        width: 200,
                        color: Colors.black54,
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          list.elementAt(index).title,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.schedule_outlined), 
                            Text("${list.elementAt(index).duration.toString()} min")
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.work), 
                            Text(list.elementAt(index).complexity.name)
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.attach_money), 
                            Text(list.elementAt(index).affordability.name)
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        ), 
      ),
    );
  }
}
      
class FoodDetails extends StatelessWidget {
  final String id;
  const FoodDetails ({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    Meal food = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 227, 152),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 238, 0, 79),
        title: Text(
          food.title,
          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Column(
            children: [
            Image.network(food.imageUrl),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Ingredients", style: TextStyle(fontSize: 16),),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: food.ingredients.length,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 196, 175, 148)
                      ),
                      child: Text(
                        food.ingredients[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Steps", style: TextStyle(fontSize: 16),),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: food.steps.length,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text("# ${index+1}", style: const TextStyle(color: Colors.white),),
                          ),
                          Expanded(child: Text(food.steps[index]))
                        ],
                      ),
                    )
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}