import 'package:flutter/material.dart';
import 'package:todo_task/model/todo_response.dart';
import 'package:todo_task/style/text_style.dart';

import '../layout/todo_details.dart';

class ToDoCard extends StatelessWidget {
  final ToDoResponse item;

  const ToDoCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ToDoDetails(todo: item),
              ));
        },
        child: Card(
          shadowColor: Colors.yellow.shade100,
          color: Colors.white,
          elevation: 3,


          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title ?? "",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text( item.completed ==true ?"complete" : "not complete",
                            style: item.completed ==true ? AppTestStyle.completeTextStyle:AppTestStyle.unCompleteTextStyle),
                       const Spacer(),
                        Container(
                          color: Colors.yellow.shade100,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Text("Show Details",
                                    style: AppTestStyle.showDetailsTextStyle),
                                const Icon(Icons.arrow_forward_ios, size: 10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
