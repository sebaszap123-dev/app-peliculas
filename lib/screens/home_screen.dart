import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

import 'package:provider/provider.dart';

import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Películas en cines'),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Tarjetas principales
              _swiperTarjetas(moviesProvider),
              // Slider de películas
              MovieSlider(
                movies: moviesProvider.popularMovies, // populares,
                title: 'Populares', // opcional
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }

  Widget _swiperTarjetas(MoviesProvider moviesProvider) {
    return FutureBuilder(
      future: moviesProvider.getOnDisplayMovies(),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(movies: snapshot.data!);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
