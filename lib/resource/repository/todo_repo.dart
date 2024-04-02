import '../../model/todo_response.dart';
import '../api_client.dart';
import '../links.dart';

class ToDoRepository extends BaseClient {
  Future<List<ToDoResponse>> fetchToDo({String? link}) async {
    List<ToDoResponse> result = [];
    try {
      final response = await client.get(
        LinksUrl.TODO,
      );
      for (var v in response.data) {
        result.add(ToDoResponse.fromJson(v));
      }
      return result;
    } catch (e) {
      throw e;
    }
  }
}
