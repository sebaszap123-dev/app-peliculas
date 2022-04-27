import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (BuildContext context, int index, int realIndex) =>
          _MoviePosterImage(movie: movies[index]),
      itemCount: movies.length,
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
    );
  }
}

class _MoviePosterImage extends StatelessWidget {
  const _MoviePosterImage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: AssetImage('assets/no-image.jpg'),
      image: NetworkImage(movie.fullPosterImg),
      fit: BoxFit.cover,
    );
  }
}
