import 'dart:math';
import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int status = 0;
  int score = 0;
  int maxScore = 0;
  int remainingTime = 10;
  late TinhToan ttRandom;
  late Timer setTime;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: status==0?Home():status==1?HomePlaying():HomeGameOver(),
    );
  }

  Widget Home() {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text("1+1=3", style: TextStyle(fontSize: 50, color: Colors.blue, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: const Text("Freaking",style: TextStyle(fontSize: 30, color: Colors.white60 ,fontWeight: FontWeight.w300),),
                  ),
                  Container(
                    child: const Text("Math",
                      style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 100,
              margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon:const Icon(Icons.play_arrow),
                iconSize: 35,
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    status=1;
                    remainingTime=10;
                    startGame();
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
  void checkTrueResult(bool check){
    maxScore = max(score, maxScore);
    if(check==true){
      setTime.cancel();
      setState(() {
        score++;
      });
      maxScore = max(score, maxScore);
      remainingTime=10;
      startGame();
    }
    else {
      setState(() {
        setTime.cancel();
        status=3;
      });
    }
  }
  void checkFalseResult(bool check){
    if(check==false){
      setTime.cancel();
      setState(() {
        score++;
      });
      maxScore = max(score, maxScore);
      remainingTime=10;
      startGame();
    }
    else {
      setState(() {
        setTime.cancel();
        status=3;
      });
    }
  }
  void startGame() {
    ttRandom = TinhToan.random();
    setTime= Timer.periodic(const Duration(seconds: 1) ,(timer) {
      setState(() {
        remainingTime--;
        if (remainingTime == 0) {
          timer.cancel();
          setTime.cancel();
          setState(() {
            status=3;
            remainingTime=10;
          });
        }
      });
    });
  }
  Widget HomePlaying() {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.orangeAccent,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                alignment: Alignment.topRight,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: const Icon(Icons.lock_clock),
                        ),
                        const SizedBox(width: 10,),
                        textBox(noiDung: "$remainingTime", size: 30),
                      ],
                    ),
                    textBox(noiDung: "$score", size: 30),
                  ],
                )

              ),
              Container(
                margin: const EdgeInsets.only(top: 150),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textBox(noiDung: "${ttRandom.number1}", size: 70),
                    const SizedBox(width: 10,),
                    textBox(noiDung: "${ttRandom.calculate}", size: 70),
                    const SizedBox(width: 10,),
                    textBox(noiDung: "${ttRandom.number2}", size: 70),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const textBox(noiDung: "=", size: 70),
                    const SizedBox(width: 10,),
                    textBox(noiDung: "${ttRandom.result}", size: 70),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){
                          checkTrueResult(ttRandom.trueorfalse);
                        },
                        color: Colors.blue,
                        iconSize: 60,
                        icon: const Icon(Icons.done),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){
                          checkFalseResult(ttRandom.trueorfalse);
                        },
                        color: Colors.red,
                        iconSize: 60,
                        icon: const Icon(Icons.close),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget HomeGameOver() {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 50, 0, 20),
              child: const Text("GAME OVER",style: TextStyle(color: Colors.white,fontSize: 70),),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Text("current",style: TextStyle(color: Colors.white,fontSize: 30),),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text( "$score",style: const TextStyle(color: Colors.white,fontSize: 70),),
            ),
            Container(margin: const EdgeInsets.only(top: 30),
              child: const Text("Best Score",style: TextStyle(color: Colors.white,fontSize: 30),),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text("$maxScore",style: const TextStyle(color: Colors.white,fontSize: 70),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: IconButton(
                    color: Colors.green,
                    iconSize: 60,
                    icon: const Icon(Icons.rotate_90_degrees_ccw),
                    onPressed: (){
                      setState(() {
                        score=0;
                        status = 1;
                        remainingTime=10;
                        startGame();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: IconButton(
                    color: Colors.red,
                    iconSize: 60,
                    icon: const Icon(Icons.home_filled),
                    onPressed: (){
                      setState(() {
                        status = 0;
                        remainingTime=10;
                      });
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class TinhToan {
  int? number1;
  int? number2;
  var result;
  String? calculate;
  bool trueorfalse;
  static List<String> list = ['+', '-', 'x', '/'];

  TinhToan(this.number1, this.number2, this.result, this.calculate, this.trueorfalse);

  factory TinhToan.random() {
    Random random = Random();
    int number1 = random.nextInt(100) + 1;
    int number2 = random.nextInt(100) + 1;
    String calculate = list[random.nextInt(4)];
    var kq;
    if (calculate == '+') {
      kq = number1 + number2;
    } else if (calculate == '-') {
      kq = number1 - number2;
    } else if (calculate == 'x') {
      kq = number1 * number2;
    } else {
      double kq1 = number1 / number2;
      kq = double.parse((kq1).toStringAsExponential(3));
    }
    List listResult = [kq-2, kq-1, kq, kq+1, kq+2, kq+3];
    var result = listResult[random.nextInt(6)];
    bool trueorfalse = (kq == result);
    return TinhToan(number1, number2, result, calculate, trueorfalse);
  }
}
class textBox extends StatelessWidget {
  final String noiDung;
  final double size;
  const textBox({Key? key, required this.noiDung,required this.size,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$noiDung",style: TextStyle(fontSize: size,color: Colors.white),),
    );
  }
}