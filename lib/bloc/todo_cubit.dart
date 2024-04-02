import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_task/resource/repository/todo_repo.dart';

import '../model/todo_response.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
  List<ToDoResponse> result = [];

  Future<void> fetchToDo() async {
    try {
      emit(FetchToDoAwaitState());
      result = await GetIt.I.get<ToDoRepository>().fetchToDo();
      print(result);
      emit(FetchToDoAcceptState());
    } catch (ex) {
      emit(FetchToDoErrorState(ex.toString()));
    }
  }
  void closeSearch()  {
    emit(CloseSearchState());
  }
  Future<void> search(String text) async {
    try {
      if (result.isEmpty) {
        emit(SearchEmptyState());
      } else {
        List<ToDoResponse> filteredList = [];
        emit(SearchAwaitState());
        for (var todo in result) {
          if (todo.title != null &&
              todo.title!.toLowerCase().contains(text.toLowerCase())) {
            filteredList.add(todo);
          }
        }
        if (filteredList.isEmpty) {
          emit(SearchNotFoundState());
        } else {
          emit(SearchAcceptState(filteredList));
        }
      }
    } catch (ex) {
      emit(SearchErrorState(ex.toString()));
    }
  }
}
