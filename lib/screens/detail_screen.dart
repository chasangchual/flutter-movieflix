import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';

import '../services/movie_api_service.dart';

class MovieDetailScreen extends StatefulWidget {
  final int id;

  MovieDetailScreen({super.key, required this.id});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<MovieDetail> movieDetail;

  String convertToHourMin(int runTime) {
    var hour = runTime / 60;
    var min = runTime % 60;
    return '${hour.floor()}h ${min}min';
  }

  String genre(List<Genre> genres) {
    String out = "";

    for (var genre in genres) {
      out = out + genre.name + " ";
    }
    return out;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDetail = MovieApiService().getMovieDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: FutureBuilder(
            future: movieDetail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                MovieDetail movieDetail = snapshot.data!;
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(movieDetail.posterPath),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.black45.withOpacity(0.6), BlendMode.darken))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 250,
                        ),
                        Text(
                          movieDetail.title,
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star,
                                size: 20,
                                color: movieDetail.voteAverage > 0 ? Colors.yellow : Colors.grey.withOpacity(0.87)),
                            Icon(Icons.star,
                                size: 20,
                                color: movieDetail.voteAverage > 2 ? Colors.yellow : Colors.grey.withOpacity(0.7)),
                            Icon(Icons.star,
                                size: 20,
                                color: movieDetail.voteAverage > 4 ? Colors.yellow : Colors.grey.withOpacity(0.7)),
                            Icon(Icons.star,
                                size: 20,
                                color: movieDetail.voteAverage > 6 ? Colors.yellow : Colors.grey.withOpacity(0.7)),
                            Icon(Icons.star,
                                size: 20,
                                color: movieDetail.voteAverage > 8 ? Colors.yellow : Colors.grey.withOpacity(0.7)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          convertToHourMin(movieDetail.runTime) + " | " + genre(movieDetail.genres),
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "StoryLine",
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          movieDetail.overview,
                          style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                decoration:
                                    BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(15)),
                                child: Text("Buy ticket"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
              return Container();
            }),
      ),
    );
  }
}
