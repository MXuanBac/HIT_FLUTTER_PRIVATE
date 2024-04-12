import 'package:flutter/material.dart';

class Task {
  final String title;
  final String startTime;
  final String endTime;
  final String deadLine;
  final bool isFavourite;
  final bool isCompleted;
  final String remind;
  final String repeat;
  final Color color;

  const Task ({
    required this.title, 
    required this.startTime, 
    required this.endTime, 
    required this.deadLine, 
    required this.isFavourite, 
    required this.isCompleted, 
    required this.remind, 
    required this.repeat, 
    required this.color,
  });
}

class dataTask {
  final int id;
  final String title;
  final String startTime;
  final String endTime;
  final String deadLine;
  final Color color;

  const dataTask({
    required this.id,
    required this.title, 
    required this.startTime, 
    required this.endTime, 
    required this.deadLine,
    required this.color, 
  });
}


const DATA_TASK = [
  dataTask(
    id: 1,
    title: "Làm việc cho chị ...", 
    startTime: "7:34 PM", 
    endTime: "7:34 PM", 
    deadLine: "2023-01-01",
    color: Colors.green 
  ),
  dataTask(
    id: 2,
    title: "Làm việc cho chị ...", 
    startTime: "7:34 PM", 
    endTime: "7:34 PM", 
    deadLine: "2023-01-01",
    color: Colors.pink 
  ),
];