import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:projecto_unidad1/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    // pa guardar el tamaño
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {
          final movie = movies[index];
          // print(movie.posterPath);
          // print(movie.fullPosterImg);
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'details',
              arguments: '',
            ),
            // Para esquinas redondeadas
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/imagen.jpg'),
                image: NetworkImage(movie.fullPosterImg),
              ),
            ),
          );
        },
      ),
    );
  }
}
