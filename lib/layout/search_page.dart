import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/bloc/todo_cubit.dart';

import '../widget/todo_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TodoCubit _bloc;
  TextEditingController testController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool _isTextFieldOpen = false;
  bool _isContentText = false;

  @override
  void initState() {
    _bloc = BlocProvider.of<TodoCubit>(context);
    focusNode.addListener(_handleFocusChange);
    // TODO: implement initState
    super.initState();
  }

  void _handleFocusChange() {
    setState(() {
      _isTextFieldOpen = focusNode.hasFocus;
    });
  }

  void _handleTextChanged(String text) {
    _bloc.search(text);
    setState(() {
      _isContentText = true;
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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
          "Search Page",
          style: TextStyle(fontSize: mediaQuery.height * 0.025),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.white,
              child: TextFormField(
                onChanged: _handleTextChanged,
                controller: testController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  suffixIcon: _isContentText
                      ? IconButton(
                          onPressed: () {
                            _bloc.closeSearch();
                            setState(() {
                              testController.clear();
                              _isContentText = false;
                            });
                          },
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: Colors.grey,
                          ))
                      : const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                  hintText: "Search by title ...",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.yellow)),
                  fillColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<TodoCubit, TodoState>(
              buildWhen: (_, current) =>
                  current is SearchAwaitState ||
                  current is SearchEmptyState ||
                  current is SearchNotFoundState ||
                  current is SearchErrorState ||
                  current is SearchAcceptState ||
                  current is CloseSearchState,
              builder: (context, state) {
                if (state is SearchEmptyState) {
                  return const Center(
                      child: Text("There is no data to search"));
                } else if (state is SearchNotFoundState) {
                  return const Center(
                    child: Text("No results found"),
                  );
                } else if (state is SearchAwaitState) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.yellow,
                  ));
                } else if (state is SearchErrorState) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                } else if (state is SearchAcceptState) {
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          var item = state.searchResponse[index];
                          return ToDoCard(
                            item: item,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: mediaQuery.height * 0.010,
                          );
                        },
                        itemCount: state.searchResponse.length),
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(top: mediaQuery.height/3),
                  child: const SizedBox(
                    child: Center(child: Text("Type to Search",style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold),)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
