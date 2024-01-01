import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mymovie/models/movie.dart';

class MovieService {
  static Future<List<movie>> fetchMovies() async {
    final response = await http.get(Uri.parse('https://ac56-185-213-229-92.ngrok-free.app/shohbozbek/movie/app/v1/api/movies/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
