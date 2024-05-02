import 'package:flutter_btvn6/FoodDetail.dart';
import 'package:flutter_btvn6/formatNumber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_btvn6/cart.dart';
import 'data.dart';

class itemFood extends StatelessWidget {
  const itemFood({super.key, required this.food});
  final Food food;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FoodDetail(food: food)));
      },
      child: Container (
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(bottom: 5),
        height: 120,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1))
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              child:  Image(image: NetworkImage(food.imageUlr), height: 100, width: 100,),
            ),
            Expanded(
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16 , overflow: TextOverflow.ellipsis),),
                  Text(food.describe, style: const TextStyle(color: Colors.grey, overflow: TextOverflow.ellipsis),),
                  Text("${formatNumber.formatter(food.numOfSold)} đã bán | ${formatNumber.formatter(food.numOfLike)} lượt thích", style: const TextStyle(color: Colors.grey),),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${formatNumber.formatMoney(food.cost)}đ", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                        (context.watch<cart>().selectFood[food.id] == 0) ? InkWell(
                            onTap: () {
                              context.read<cart>().add(food.id);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ) : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<cart>().minus(food.id);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.red,),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8),
                                child: Text(context.watch<cart>().selectFood[food.id].toString(), style: const TextStyle(fontSize: 15),)
                              ),
                              InkWell(
                                onTap: () {
                                  context.read<cart>().add(food.id);
                                },
                                child: Container(
                                  decoration: BoxDecoration (
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon( Icons.add, color: Colors.white,)
                                ),
                              )
                            ],
                          )
                      ],
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}