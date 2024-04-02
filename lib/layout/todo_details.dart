import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/png/todo_image.png'),
            const SizedBox(
              height: 20,
            ),
            buildRowInfo("Completed", todo.completed ?? false),
                const SizedBox(
                  height: 15,
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

  Widget buildRowInfo(String title, bool complete) {
    return Row(
      children: [
        Text(title, style: AppTestStyle.titleTextStyle),
        const Spacer(),
        Text(complete == true ? "not complete" : "not complete",
            style: AppTestStyle.contentTextStyle),
        const SizedBox(
          width: 15,
        ),
        complete == true
            ? SvgPicture.asset(
                "assets/svg/complete.svg",
                color: Colors.green,
                width: 20,
                height: 20,
              )
            : SvgPicture.asset(
                "assets/svg/un_complete.svg",
                color: Colors.red,
                width: 20,
                height: 20,
              )
      ],
    );
  }
}
