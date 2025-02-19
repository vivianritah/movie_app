import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/genre.dart';


class GenreService {
  final String baseUrl = "https://api.themoviedb.org/3";
  final String apiKey = "1ef9420b1d1988fd82dee5eaf93285bd";

  Future<List<Genre>> fetchGenres() async {
    final url = Uri.parse('$baseUrl/genre/movie/list?api_key=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> genresJson = data['genres'];
        return genresJson.map((json) => Genre.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load genres');
      }
    } catch (e) {
      print('Error fetching genres: $e');
      throw Exception('Something went wrong');
    }
  }
}

// **Main function for testing**
void main() async {
  final genreService = GenreService();

  // Fetch and print genres
  try {
    print('Fetching genres...');
    final genres = await genreService.fetchGenres();
    print('Genres: ${genres.map((g) => g.name).toList()}');
  } catch (e) {
    print('Error fetching genres: $e');
  }
}
