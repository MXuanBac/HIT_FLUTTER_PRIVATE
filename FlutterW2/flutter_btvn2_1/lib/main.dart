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
          padding: const EdgeInsets.all(24),
          child: Column (
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const Text('Hi, Mai Xuân Bắc', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(115, 71, 69, 69), width: 1,
                    ),
                    borderRadius: BorderRadius.circular(18)
                  ),
                  child: const Center(child: Icon(Icons.notifications_outlined, size: 30))
                ),],
              ),

              Stack(
                children: [
                  Image.asset('assets/i1.png', width: 100, height: 100, ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(45, 20, 20, 20),
                    margin: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(6, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Thời khóa biểu', style: TextStyle(fontWeight: FontWeight.w500),),
                              const Text('30 tháng 10', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: const Row(
                                  children: [
                                    Text("Không có lịch!"),
                                    Text(' Xem thêm TKB', style: TextStyle(color: Colors.blue),)
                                  ],
                                )
                              )
                            ],
                          ),
                          ElevatedButton(onPressed: () {},
                            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue), ), 
                            child: const Text('Lịch thi', style: TextStyle(color: Colors.white))
                          )
                        ],
                    ),
                  ),
                ],
              ),
              Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Thông báo gần đây', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15), textAlign: TextAlign.left,),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 40),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(6, 0, 0, 0),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Column(children:[
                        Text('THÔNG BÁO V/v mở, không mở các lớp học phần trong học kì 2 năm học 2023-2024 cho sinh viên Đại học các khóa',
                        style: TextStyle(color: Colors.blue, fontSize: 14 , fontWeight: FontWeight.w600),),

                        Padding(padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Icon(Icons.schedule, color: Colors.black45, size: 15,),
                              Text(' 09:20 10/11/2023', style: TextStyle(fontSize: 12),),
                            ],
                          )
                        )
                      ],)
                  )
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Tiện ích', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15), textAlign: TextAlign.left,),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color: const Color.fromARGB(6, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20)
                            ), child: const Icon(Icons.payments_outlined, size: 40, color: Colors.blue)
                          ),
                          const Text('Tài chính')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color: const Color.fromARGB(6, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20)
                            ), child: const Icon(Icons.equalizer_outlined, size: 40, color: Colors.blue)
                          ),
                          const Text('kết quả HP')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color: const Color.fromARGB(6, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20)
                            ), child: const Icon(Icons.receipt_long_outlined, size: 40, color: Colors.blue)
                          ),
                          const Text('Học phần')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color: const Color.fromARGB(6, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20)
                            ), child: const Icon(Icons.school_outlined, size: 40, color: Colors.blue)
                          ),
                          const Text('Tốt nghiệp')
                        ],
                      ),
                    ],
                  ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color: const Color.fromARGB(6, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20)
                            ), child: const Icon(Icons.call_outlined, size: 40, color: Colors.blue)
                          ),
                          const Text('DV một cửa')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color: const Color.fromARGB(6, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20)
                            ), child: const Icon(Icons.edit_square, size: 40, color: Colors.blue)
                          ),
                          const Text('Đánh giá',)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color: const Color.fromARGB(6, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20)
                            ), child: const Icon(Icons.help_outline, size: 40, color: Colors.blue)
                          ),
                          const Text('Hỏi đáp')
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                            color: const Color.fromARGB(6, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20)
                            ), child: const Icon(Icons.draw_outlined, size: 40, color: Colors.blue)
                          ),
                          const Text('Khảo sát')
                        ],
                      ),
                    ],
                  )
                ]
            ),]
          )
        ),
      ),
    );
  }
}
