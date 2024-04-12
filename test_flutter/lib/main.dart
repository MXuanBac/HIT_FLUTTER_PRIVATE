import 'package:flutter/material.dart';
import 'package:test_flutter/task.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeApp(),
  ));
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _TabBarExampleState();
}
class _TabBarExampleState extends State<HomeApp>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text("Board"),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            )),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.notification_add_rounded,
              color: Colors.black,
            )),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.calendar_month,
              color: Colors.black,
            ))  
        ],
        bottom: TabBar (
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text("All")
            ),
            Tab(
              child: Text("Uncompleted")
            ),
            Tab(
              child: Text("Completed")
            ),
            Tab(
              child: Text("Favourite")
            ),
          ],
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: const<Widget>[
          Center(
            child: Screen1(),
          ),
          Center(
            child: Text("all"),
          ),
          Center(
            child: Text("all"),
          ),
          Center(
            child: Text("all"),
          ),
        ],
      ) 
    );
  } 
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});
  static bool isColor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: DATA_TASK.length,
        itemBuilder: (BuildContext context, int index) { 
          return Container(
            margin: const EdgeInsets.all(10),
            height: 70,
            decoration: BoxDecoration(
              color: DATA_TASK[index].color,
              borderRadius: BorderRadius.circular(5)
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Checkbox(
                value: false, 
                onChanged: (bool? value) {
                  value = true;
                }
              ),
              Column(
                children: [
                  Text(
                    DATA_TASK[index].title,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text("From: ${DATA_TASK[index].startTime} - To: ${DATA_TASK[index].endTime}"),
                  Text("Dealine: ${DATA_TASK[index].deadLine}")
                ],
              ), 
              const ChangedColor(),
            ],),
          );
         },
      )
    );
  }
}

class ChangedColor extends StatefulWidget {
  const ChangedColor({super.key});
  @override
  _iconFavourite createState() => _iconFavourite();
}

class _iconFavourite extends State<ChangedColor> {
  bool isIconColored = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
       Icons.favorite,
       size: 30,
       color: isIconColored ? Colors.red : Colors.white,),
        onPressed: () {
          setState(() {
          isIconColored = !isIconColored;
        });
      }
    );
  }
}
