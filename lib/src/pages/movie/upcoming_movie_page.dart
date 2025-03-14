import 'package:flutter/material.dart';
import 'package:myapp/src/configs/app_route.dart';
import 'package:myapp/src/model/upcoming_movie_model.dart';
import 'package:myapp/src/services/nextwork.dart';

class UpcomingMoviePage extends StatefulWidget {
  const UpcomingMoviePage({Key? key}) : super(key: key);

  @override
  State<UpcomingMoviePage> createState() => _UpcomingMoviePageState();
}

class _UpcomingMoviePageState extends State<UpcomingMoviePage> {
  Future<UpcomingMovieModel>? _upcomingMovieModel;
  final Color _primaryColor = Colors.grey.shade800;
  final Color _accentColor = Colors.amber.shade700;

  @override
  void initState() {
    super.initState();
    _upcomingMovieModel = NetworkService().getUpcomingMovieDio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: _primaryColor,
        title: Text(
          'Upcoming Movies',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<UpcomingMovieModel>(
        future: _upcomingMovieModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: _accentColor),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading movies',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data?.results?.length ?? 0,
                itemBuilder: (context, index) {
                  var movie = snapshot.data?.results?[index];
                  return _buildMovieCard(movie, context);
                },
              ),
            );
          } else {
            return Center(child: Text('No movies available'));
          }
        },
      ),
    );
  }

  Widget _buildMovieCard(dynamic movie, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoute.movieDetailRoute,
              arguments: movie,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Movie Poster
                Hero(
                  tag: 'movie-${movie?.id}',
                  child: Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${movie?.posterPath}',
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => Container(
                              color: Colors.grey.shade300,
                              child: Icon(
                                Icons.image_not_supported,
                                color: Colors.grey.shade700,
                              ),
                            ),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: Colors.grey.shade200,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: _accentColor,
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                // Movie Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie?.title ?? 'Unknown Title',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _primaryColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: _accentColor,
                          ),
                          SizedBox(width: 4),
                          Text(
                            movie?.releaseDate?.toString().substring(0, 10) ??
                                'Unknown Date',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: _accentColor),
                          SizedBox(width: 4),
                          Text(
                            '${movie?.voteAverage ?? 0.0}',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        movie?.overview ?? 'No description available',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // More Icon
                Icon(Icons.chevron_right, color: _accentColor, size: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/* 
import 'package:flutter/material.dart';
import 'package:myapp/src/configs/app_route.dart';
import 'package:myapp/src/model/upcoming_movie_model.dart';
import 'package:myapp/src/services/nextwork.dart';

class UpcomingMoviePage extends StatefulWidget {
  const UpcomingMoviePage({Key? key}) : super(key: key);

  @override
  State<UpcomingMoviePage> createState() => _UpcomingMoviePageState();
}

class _UpcomingMoviePageState extends State<UpcomingMoviePage> {
  Future<UpcomingMovieModel>? _upcomingMovieModel;

  @override
  void initState() {
    super.initState();
    _upcomingMovieModel = NetworkService().getUpcomingMovieDio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upcoming Movie')),
      body: Container(
        child: FutureBuilder<UpcomingMovieModel>(
          future: _upcomingMovieModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.results?.length,
                itemBuilder: (context, index) {
                  var movie = snapshot.data?.results?[index];
                  print(movie);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoute.movieDetailRoute,
                          arguments: movie,
                        );
                      },
                      trailing: Icon(Icons.more),
                      tileColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      title: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${movie?.posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie?.title ?? '',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    movie?.releaseDate?.year.toString() ?? '',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

*/