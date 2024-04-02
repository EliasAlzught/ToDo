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