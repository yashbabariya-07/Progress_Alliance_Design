import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:progress_alliance/Models/todo.dart';

class TodoService {
  Future<List<Todo>> getAll() async {
    final url = dotenv.env['API_URL'];
    final uri = Uri.parse(url!);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Todo(
          id: e['id'],
          title: e['title'],
          userId: e['userId'],
          completed: e['completed'],
        );
      }).toList();
      return todos;
    }
    return [];
  }
}
