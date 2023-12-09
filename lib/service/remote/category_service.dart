import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mymovie/models/category.dart';

class CategoryService {
  Future<List<Category>> getData() async {
    List<Category> categoryList = [];
    final url = Uri.parse("https://f21f-188-113-247-199.ngrok-free.app/shohbozbek/movie/app/v1/api/category/");

    try {
      final res = await http.get(url);
      final resData = json.decode(utf8.decode(res.bodyBytes));

      if (res.statusCode == 200) {
        for (final item in resData) {
          categoryList.add(Category.fromJson(item));
        }
      } else {
        throw Exception("Server error code ${res.statusCode}");
      }
    } catch (e) {
      throw Exception("Server error code $e");
    }

    return categoryList;
  }
}
