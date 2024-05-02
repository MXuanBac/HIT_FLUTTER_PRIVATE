import 'package:flutter_btvn6/cart.dart';
import 'package:flutter_btvn6/formatNumber.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key, required this.food});
  final Food food;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    Image(image: NetworkImage(food.imageUlr)),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      leading: Material(
                        color: Colors.black38,
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        child: InkWell(
                          child: const Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.title, style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                      Text(
                        food.describe,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${formatNumber.formatter(food.numOfSold)} đã bán | ${formatNumber.formatter(food.numOfLike)} lượt thích",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${formatNumber.formatMoney(food.cost)}đ",
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
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
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}