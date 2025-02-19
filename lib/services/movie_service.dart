import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart'; // Ensure this path is correct



class MovieService {
  final String baseUrl = "https://api.themoviedb.org/3";
  final String apiKey = "1ef9420b1d1988fd82dee5eaf93285bd";

  // Fetch popular movies
  Future<List<Movie>> fetchPopularMovies() async {
    final url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e) {
      print('Error fetching popular movies: $e');
      throw Exception('Something went wrong');
    }
  }

  // Fetch the latest movie
  Future<Movie> fetchLatestMovie() async {
    final url = Uri.parse('$baseUrl/movie/latest?api_key=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Movie.fromJson(data);
      } else {
        throw Exception('Failed to load latest movie');
      }
    } catch (e) {
      print('Error fetching latest movie: $e');
      throw Exception('Something went wrong');
    }
  }
}

void main() async {
  final movieService = MovieService();

  // Fetch and print popular movies
  try {
    print('Fetching popular movies...');
    final popularMovies = await movieService.fetchPopularMovies();
    print('Popular Movies: ${popularMovies.map((m) => m.title).toList()}');
  } catch (e) {
    print('Error fetching popular movies: $e');
  }

  // Fetch and print the latest movie
  try {
    print('Fetching latest movie...');
    final latestMovie = await movieService.fetchLatestMovie();
    print('Latest Movie: ${latestMovie.title}');
  } catch (e) {
    print('Error fetching latest movie: $e');
  }
}
