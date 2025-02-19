import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/movie_service.dart';
import '../models/movie.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies App'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: MovieService().fetchPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No movies found'));
          }

          final movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                leading: movie.posterPath != null
                    ? Image.network(
                        'https://image.tmdb.org/t/p/w200${movie.posterPath}')
                    : Icon(Icons.movie),
                title: Text(movie.title),
                subtitle: Text(
                    'Rating: ${movie.voteAverage?.toStringAsFixed(1) ?? 'N/A'}'),
                onTap: () {
                  // Navigate to movie details
                },
              );
            },
          );
        },
      ),
    );
  }
}
