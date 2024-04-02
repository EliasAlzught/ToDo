import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/bloc/todo_cubit.dart';
import 'package:todo_task/layout/search_page.dart';
import 'package:todo_task/style/text_style.dart';

import '../widget/todo_card.dart';

class ToDoLayout extends StatefulWidget {
  const ToDoLayout({super.key});

  @override
  State<ToDoLayout> createState() => _ToDoLayoutState();
}

class _ToDoLayoutState extends State<ToDoLayout> {
  late TodoCubit _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<TodoCubit>(context);
    _bloc.fetchToDo();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Todo",
              style: TextStyle(fontSize: mediaQuery.height * 0.025),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(),
                        ));
                  },
                  icon: Icon(Icons.search,color: Colors.grey,))
            ]),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                if (state is FetchToDoAwaitState) {
                  return const Center(
                    child:
                        CircularProgressIndicator(color: Colors.yellowAccent),
                  );
                } else if (state is FetchToDoErrorState) {
                  return Center(
                    child: Text(state.errorMessage ?? "",
                        style: AppTestStyle.errorTextStyle),
                  );
                }
                return ListView.separated(
                    itemBuilder: (context, index) {
                      var item = _bloc.result[index];
                      return ToDoCard(
                        item: item,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: mediaQuery.height * 0.010,
                      );
                    },
                    itemCount: _bloc.result.length);
              },
            ),
          ),
        ));
  }
}
