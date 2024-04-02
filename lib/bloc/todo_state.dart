part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class FetchToDoAwaitState extends TodoState {}

class FetchToDoAcceptState extends TodoState {}

class FetchToDoErrorState extends TodoState {
  final String errorMessage;

  FetchToDoErrorState(this.errorMessage);
}

class SearchAwaitState extends TodoState {}

class SearchAcceptState extends TodoState {
  final  List<ToDoResponse>  searchResponse;

  SearchAcceptState(this.searchResponse);
}

class SearchErrorState extends TodoState {
  final String errorMessage;

  SearchErrorState(this.errorMessage);
}

class SearchNotFoundState extends TodoState {}

class SearchEmptyState extends TodoState {}

class CloseSearchState extends TodoState {}
