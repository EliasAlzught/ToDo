import 'package:flutter/material.dart';
import 'package:todo_task/style/text_style.dart';

import '../model/todo_response.dart';

class ToDoDetails extends StatelessWidget {
  final ToDoResponse todo;

  const ToDoDetails({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          "Todo Details",
          style: TextStyle(fontSize: mediaQuery.height * 0.025),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildRowInfo("Completed",
                todo.completed == true ? "not complete" : "not complete"),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Title :",
              style: AppTestStyle.titleTextStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              todo?.title ?? "",
              style: AppTestStyle.titleSmallTextStyle,
            )
          ]),
        ),
      ),
    );
  }

  Widget buildRowInfo(String title, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTestStyle.titleTextStyle),
        Text(content, style: AppTestStyle.contentTextStyle),
      ],
    );
  }
}
