import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    decoration: const BoxDecoration(color: Colors.red),
                    child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text('Lịch sử hiến máu', style: TextStyle(color: Colors.white, fontSize: 20),),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Icon(Icons.forum_rounded, size: 40, color: Colors.white),
                  )
                ],
              ),

              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 15),
                child: Column(children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/avt.jpg')
                          )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(50)),
                        child: const Icon(Icons.photo_camera_outlined, color: Colors.white,),
                      ),
                    ],
                  )
                ],),
              ),
              const Text('Mai Xuân Bắc', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: const Text('Mức 2', style: TextStyle(color: Colors.white),)
              ),

              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(6, 0, 0, 0)
                ),child: Column(children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 30, 20, 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 1)
                        ),],
                        borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
                          alignment: Alignment.center,
                          child: Row (children: [
                            Container(decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)
                            )), 
                             width: 5, height: 60,),
                            Container(decoration: const BoxDecoration(color: Color.fromARGB(6, 0, 0, 0)), 
                              margin: const EdgeInsets.fromLTRB(0, 0, 10, 0), 
                              padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                              child: const Text('Lần 4')),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('25/01/2024', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                                Row(children: [
                                Icon(Icons.vaccines_outlined, size: 20, color: Colors.black38,),
                                Text(' 350ml (Toàn phần)', style: TextStyle(color: Colors.black38, fontSize: 10))
                            ],),
                            Text('Trung tâm Máu Quốc Gia', style: TextStyle(color: Colors.black38, fontSize: 10),)
                              ],
                        ),
                          ],),
                        ),
                        const Padding(padding: EdgeInsets.all(10), child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black45,),)
                      ],),
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 1)
                        ),],
                        borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
                          alignment: Alignment.center,
                          child: Row (children: [
                            Container(decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)
                            )), 
                             width: 5, height: 60,),
                            Container(decoration: const BoxDecoration(color: Color.fromARGB(6, 0, 0, 0)), 
                              margin: const EdgeInsets.fromLTRB(0, 0, 10, 0), 
                              padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                              child: const Text('Lần 4')),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('20/09/2023', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                                Row(children: [
                                Icon(Icons.vaccines_outlined, size: 20, color: Colors.black38,),
                                Text(' 350ml (Toàn phần)', style: TextStyle(color: Colors.black38, fontSize: 10))
                            ],),
                            Text('Trung tâm Máu Quốc Gia', style: TextStyle(color: Colors.black38, fontSize: 10),)
                              ],
                        ),
                          ],),
                        ),
                        const Padding(padding: EdgeInsets.all(10), child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black45,),)
                      ],),
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 1)
                        ),],
                        borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
                          alignment: Alignment.center,
                          child: Row (children: [
                            Container(decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)
                            )), 
                             width: 5, height: 60,),
                            Container(decoration: const BoxDecoration(color: Color.fromARGB(6, 0, 0, 0)), 
                              margin: const EdgeInsets.fromLTRB(0, 0, 10, 0), 
                              padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                              child: const Text('Lần 4')),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('15/05/2023', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                                Row(children: [
                                Icon(Icons.vaccines_outlined, size: 20, color: Colors.black38,),
                                Text(' 350ml (Toàn phần)', style: TextStyle(color: Colors.black38, fontSize: 10))
                            ],),
                            Text('Trung tâm Máu Quốc Gia', style: TextStyle(color: Colors.black38, fontSize: 10),)
                              ],
                        ),
                          ],),
                        ),
                        const Padding(padding: EdgeInsets.all(10), child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black45,),)
                      ],),
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 1)
                        ),],
                        borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
                          alignment: Alignment.center,
                          child: Row (children: [
                            Container(decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)
                            )), 
                             width: 5, height: 60,),
                            Container(decoration: const BoxDecoration(color: Color.fromARGB(6, 0, 0, 0)), 
                              margin: const EdgeInsets.fromLTRB(0, 0, 10, 0), 
                              padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                              child: const Text('Lần 1')),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('16/01/2023', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                                Row(children: [
                                Icon(Icons.vaccines_outlined, size: 20, color: Colors.black38,),
                                Text(' 350ml (Toàn phần)', style: TextStyle(color: Colors.black38, fontSize: 10))
                            ],),
                            Text('Trung tâm Máu Quốc Gia', style: TextStyle(color: Colors.black38, fontSize: 10),)
                              ],
                        ),
                          ],),
                        ),
                        const Padding(padding: EdgeInsets.all(10), child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black45,),)
                      ],),
                    )
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
