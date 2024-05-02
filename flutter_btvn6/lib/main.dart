import 'package:flutter_btvn6/cart.dart';
import 'package:flutter_btvn6/formatNumber.dart';
import 'package:flutter_btvn6/itemFood.dart';
import 'package:flutter_btvn6/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => cart())],
      child: const MaterialApp(
        home: MyHome(),
      ), 
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: FoodData.typeOfFood.length,
      child: Scaffold (
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.share, color: Colors.red,),)
          ],
          bottom: TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            tabs: FoodData.typeOfFood.map((e) => Tab(child: Text(e.nameOfType))).toList(),
          ),
        ),
        body: TabBarView (
          children: FoodData.typeOfFood.map((e) 
          => TabContent(
            nameOfType: e.nameOfType, 
            listFoodByType: FoodData.listFoods.where((food) => food.typeId == e.id).toList())).toList(),
        ),
        bottomNavigationBar: (context.watch<cart>().totalMoney > 0) ? BottomAppBar(
          child: Container(
            child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.red,
                        size: 40,
                      ),
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          builder: (context) {
                          return _bottomShopping(context, true);
                        });
                      },
                    ),
                    Positioned(
                      child: Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(context.watch<cart>().total.toString(), style: const TextStyle(color: Colors.white, fontSize: 11),),
                      )
                    )
                ],
                ),
                Row(
                  children: [
                    Text("${formatNumber.formatMoney(context.watch<cart>().totalMoney)}đ",
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 70,
                      color: Colors.red,
                      width: 120,
                      alignment: Alignment.center,
                      child: const Text("Giao hàng",
                        style: TextStyle(fontSize: 16, color: Colors.white,),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ): null
      )
    );
  }
}

class TabContent extends StatelessWidget {
  const TabContent({super.key, required this.nameOfType, required this.listFoodByType});
  final String nameOfType;
  final List<Food> listFoodByType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text("${nameOfType} (${listFoodByType.length})", style: const TextStyle(fontWeight: FontWeight.bold),),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listFoodByType.length,
            itemBuilder: (context, indext) {
              return itemFood(food: listFoodByType[indext]);
            },
          )
        ],
      ),
    );
  }
}

Widget _bottomShopping(BuildContext context, bool check){
  return Column(
    children: [
      Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: const Text("Xóa tất cả",style: TextStyle(color: Colors.red, fontSize: 12),),
                onTap: () {
                  context.read<cart>().reset();
                },
              ),
              const Text("Giỏ hàng", style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              InkWell(
                child: const Icon(Icons.close,color: Colors.black,),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
      _listFoodShopping(context),
      Container(
        margin: const EdgeInsets.all(8),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                InkWell(
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.red,
                    size: 40,
                  ),
                  onTap: () {},
                ),
                Positioned(
                  child: Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(context.watch<cart>().total.toString(), style: const TextStyle(color: Colors.white, fontSize: 11),),
                  )
                )
              ],
            ),
            Row(
              children: [
                Text("${formatNumber.formatMoney(context.watch<cart>().totalMoney)}đ",
                  style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 55,
                  color: Colors.red,
                  width: 120,
                  alignment: Alignment.center,
                  child: const Text("Giao hàng",
                    style: TextStyle(fontSize: 16, color: Colors.white,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ],
  );
}

Widget _FoodInCard(Food food, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 4),
      padding: const EdgeInsets.only(bottom: 4),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 1))),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(food.imageUlr),
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                food.title,
                style: const TextStyle(color: Colors.black, fontSize: 14, overflow: TextOverflow.ellipsis,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${formatNumber.formatMoney(food.cost)} đ", style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
              ],
            )
          ],
        ))
      ],
    ),
  );
}


Widget _listFoodShopping(BuildContext context) {
  List<Food> foodChoice = FoodData.listFoods.where((element) => context.watch<cart>().selectFood[element.id] > 0).toList();
  return Expanded(
    child: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: foodChoice.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image.network(foodChoice.elementAt(index).imageUlr,),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  foodChoice.elementAt(index).title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${formatNumber.formatMoney(foodChoice.elementAt(index).cost)}đ",
                                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    (context.watch<cart>().selectFood[foodChoice.elementAt(index).id] ==0) ? InkWell(
                                      onTap: () {
                                        context.read<cart>().add(foodChoice.elementAt(index).id);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: const Icon( Icons.add,color: Colors.white,),
                                      )): Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                   context.read<cart>().minus(foodChoice.elementAt(index).id);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all( color: Colors.red),
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: const Icon(Icons.remove, color: Colors.red,),
                                                )
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 8, right: 8),
                                                child: Text(context.watch<cart>().selectFood[foodChoice.elementAt(index).id].toString()),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  context.read<cart>().add(foodChoice.elementAt(index).id);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: const Icon(Icons.add, color: Colors.white,
                                                  ),
                                                )
                                              )
                                            ],
                                          )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                )
              ),
    ),
  );
}



